'use strict';
const methods = {
  select: (table, params) => `SELECT * FROM ${table} ${params ? `WHERE ${params}` : ''}`,
  drop: (table) => `DROP TABLE ${table}`,
  create: (table, colums) => `CREATE TABLE ${table} ( \r\n ${colums})`,
  insert: (table, values) => `INSERT INTO ${table} ( \r\n ${values})`,
};

const createSqlStructure = (method) => methods[method.toLowerCase()];

module.exports = createSqlStructure;
