const { DataTypes } = require('sequelize');
const sequelize = require('./index');

const Cliente = sequelize.define('Cliente', {
  name: DataTypes.STRING,
  email: DataTypes.STRING,
  address: DataTypes.STRING,
});

module.exports = Cliente;
