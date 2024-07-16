const { DataTypes } = require('sequelize');
const sequelize = require('./index');

const Equipamento = sequelize.define('equipamentos', {
  nome: {
    type: DataTypes.STRING,
    allowNull: true, // Permitir NULL inicialmente
  },
  descricao: {
    type: DataTypes.STRING,
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
