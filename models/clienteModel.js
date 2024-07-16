const { DataTypes } = require('sequelize');
const sequelize = require('./index');

const Cliente = sequelize.define('cliente', {
  name: DataTypes.STRING,
  email: DataTypes.STRING,
  address: DataTypes.STRING,
});

module.exports = Cliente;
