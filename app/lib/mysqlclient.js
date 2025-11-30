const { Database: config } = require('./config');
const mysql = require('mysql2/promise');

var createConnection = function () {
  return mysql.createPool(config.connection);
};

const pool = createConnection();

class MySqlClient {
  _config = null;
  _pool = null;

  constructor() {
    this._pool = pool;
    this._config = config.connection;
  }

  async executeQuery(query, parameters) {
    const [rows] = await this._pool.query(query, parameters);
    return rows;
  }
}

module.exports = { MySqlClient, createConnection };