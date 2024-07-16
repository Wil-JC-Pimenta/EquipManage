const { DataTypes } = require('sequelize');
const sequelize = require('./index');

const Equipamento = sequelize.define('equipamento', {
  name: DataTypes.STRING,
  type: DataTypes.STRING,
  serialNumber: DataTypes.STRING,
});

module.exports = Equipamento;
