// models/equipamentoModel.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/database/sequelize');

const Equipamento = sequelize.define('equipamentos', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  nome: {
    type: DataTypes.STRING(255),
    allowNull: true,
  },
  descricao: {
    type: DataTypes.STRING(1000),
    allowNull: true,
  },
  clienteId: {
    type: DataTypes.INTEGER,
    references: {
      model: 'clientes',
      key: 'id'
    },
    onDelete: 'NO ACTION',
    onUpdate: 'CASCADE',
  },
  createdAt: {
    type: DataTypes.DATE,
    allowNull: false,
    defaultValue: DataTypes.NOW,
  },
  updatedAt: {
    type: DataTypes.DATE,
    allowNull: false,
    defaultValue: DataTypes.NOW,
  },
});

module.exports = Equipamento;
