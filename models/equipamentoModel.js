const { DataTypes } = require('sequelize');
const sequelize = require('./index');

const Equipamento = sequelize.define('equipamentos', {
  nome: {
    type: DataTypes.STRING(255),
    allowNull: true, // Permitir NULL inicialmente
  },
  descricao: {
    type: DataTypes.STRING(1000),
    allowNull: true,
  },
  clienteId: {
    type: DataTypes.INTEGER,
    references: {
      model: 'clientes',
      key: 'id',
    },
  },
});

module.exports = Equipamento;
