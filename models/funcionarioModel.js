const { DataTypes } = require('sequelize');
const sequelize = require('./index');

const Funcionario = sequelize.define('Funcionario', {
  name: DataTypes.STRING,
  email: DataTypes.STRING,
  role: DataTypes.STRING,
});

module.exports = Funcionario;
