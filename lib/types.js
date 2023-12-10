'use strict';

const types = {
  number: 'INTEGER NOT NULL',
  text: 'VARCHAR NOT NULL',
  id: 'BIGINT GENERATED ALWAYS AS IDENTITY',
};

const createTypes = (rows) => {
  let result = '';
  for (const [name, type] of Object.entries(rows)) {
    result += `(${name} ${types[type.toLowerCase()]}), \r\n`;
  }
  return result;
};

module.exports = createTypes;
