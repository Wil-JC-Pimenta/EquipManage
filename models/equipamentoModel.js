const { DataTypes } = require('sequelize');
const sequelize = require('./index');

const Equipamento = sequelize.define('Equipamento', {
  name: DataTypes.STRING,
  type: DataTypes.STRING,
  serialNumber: DataTypes.STRING,
});

module.exports = Equipamento;
