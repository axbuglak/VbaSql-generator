'use strict';

const fsp = require('node:fs/promises');
const path = require('node:path');
const createSqlStructure = require('./lib/sqlStructure.js');
const createVba = require('./lib/vbaStructure.js');
const staticServer = require('./lib/static.js');

const SCHEMAS = path.join(process.cwd(), './schemas');
const DB = path.join(process.cwd(), './db');

const STATIC_PORT = 3000;

(async () => {
  const schemas = await fsp.readdir(SCHEMAS);
  for (const schemaFile of schemas) {
    const schema = require(path.join(SCHEMAS, schemaFile));
    const schemaName = schemaFile.split('.')[0];
    const name = schemaName + '-' + schema.method;
    const sql = createSqlStructure(schema, schemaName);
    const vba = createVba(name, sql);
    await fsp.writeFile(`${DB}/${name}.txt`, vba);
  }

  staticServer('./static', STATIC_PORT);
})().catch((err) => {
  console.error(err);
});
