const { DataTypes } = require('sequelize');
const sequelize = require('../models/index'); // Certifique-se de que o caminho esteja correto

const Cliente = sequelize.define('clientes', {
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
  },
  address: {
    type: DataTypes.STRING,
    allowNull: false,
  },
});

module.exports = Cliente;
