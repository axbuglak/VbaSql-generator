'use strict';

const fsp = require('node:fs/promises');
const path = require('node:path');
const createSqlStructure = require('./lib/sqlStructure.js');
const createTypes = require('./lib/types.js');

const SCHEMAS = path.join(process.cwd(), './schemas');


(async () => {
  const schemas = await fsp.readdir(SCHEMAS);
  for (const schemaFile of schemas) {
    const schema = require(path.join(SCHEMAS, schemaFile));
    const schemaName = `${schemaFile.slice(0, -3)}`;
    const sqlStructure = createSqlStructure(schema.method);
    let args;
    if (typeof schema.args === 'object') args = createTypes(schema.args);
    if (typeof schema.args === 'string') args = schema.args;

    const sql = sqlStructure(schemaName, args);
    await fsp.writeFile(`${schemaName}.txt`, sql);
  }
})().catch((err) => {
  console.error(err);
});
