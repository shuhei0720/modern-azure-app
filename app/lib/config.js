const fs = require('fs');
const path = require('path');

var getCert = function (target = '') {
  var key = target.toLocaleLowerCase();

  switch (key) {
    case 'azure':
      return {
        ca: fs.readFileSync(path.join(__dirname, './certs/azure-ca.pem'), 'utf8'),
      };
    case 'aws':
      return {
        ca: fs.readFileSync(path.join(__dirname, './certs/aws-ca.pem'), 'utf8'),
      };
    case 'true':
      return {
        rejectUnauthorized: false
      };
    default:
      return undefined;
  }
}

var Database = {
  connection: {
    host: process.env.MYSQL_HOST || 'localhost',
    port: process.env.MYSQL_PORT || 3306,
    user: process.env.MYSQL_USER || 'root',
    password: process.env.MYSQL_PASSWORD || 'root',
    database: process.env.MYSQL_DATABASE || 'notes',
    connectionLimit: 10,
    namedPlaceholders: true,
    ssl: getCert(process.env.MYSQL_SSL) || undefined,
  },
  session: {
    schema: {
      tableName: 'Sessions',
      columnNames: {
        session_id: 'SessionID',
        expires: 'Expires',
        data: 'Data'
      }
    }
  }
};

var Application = {
  port: process.env.PORT || 3000,
  session: {
    name: 'sid',
    secret: process.env.SESSION_SECRET || 'YOUR_SESSION_SECRET',
    resave: false,
    saveUninitialized: false,
    cookie: {
      maxAge: 1000 * 60 * 60 * 24 * 7, // 1 week
      secure: false
    }
  },
  password: {
    saltRounds: 10,
    minLength: 8,
    maxLength: 20,
    requireUppercase: true,
    requireLowercase: true,
    requireNumbers: true,
    requireSpecialCharacters: true
  }
};

module.exports = {
  Database,
  Application,
};