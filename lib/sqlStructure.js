'use strict';

const createTypes = require('./types');

const methods = (table, args) => ({
  select: () => `SELECT ${args.rows ? args.rows : '*'} FROM ${table} ${args.condition ? `WHERE ${args.condition.join(' AND ')}` : ''}`,
  drop: () => `DROP TABLE ${table}`,
  create: () => {
    const rows = createTypes(args);
    return `CREATE TABLE ${table} ( \r\n ${rows})`;
  },
  insert: () => {
    let values = '';
    for (const value of args.values) {
      values += `(${value.join(', ')}) \r\n`;
    }
    return `INSERT INTO ${table} (${args.colums.join(', ')}) VALUES \r\n ${values}`;
  },
});

module.exports = (schema, table) => methods(table, schema.args)[schema.method.toLowerCase()]();
