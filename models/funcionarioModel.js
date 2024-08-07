const { DataTypes } = require('sequelize');
const sequelize = require('../config/database/sequelize');

const Funcionario = sequelize.define('funcionario', {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true,
  },
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
    validate: {
      isEmail: true,
    },
  },
  role: {
    type: DataTypes.STRING,
    allowNull: false,
  },
}, {
  timestamps: true,
  freezeTableName: true,
  tableName: 'funcionarios',
});

module.exports = Funcionario;
