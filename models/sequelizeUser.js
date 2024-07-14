const { DataTypes } = require('sequelize');
const sequelize = require('./index');

const SequelizeUser = sequelize.define('User', {
  name: {
    type: DataTypes.STRING,
    allowNull: false
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true
  }
}, {
  tableName: 'users'
});

module.exports = SequelizeUser;
