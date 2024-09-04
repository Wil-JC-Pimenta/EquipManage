const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../config/database/sequelize');

const User = sequelize.define('User', {
  name: {
    type: DataTypes.STRING,
    allowNull: false
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true
  }
}, {
  tableName: 'users',
  timestamps: false // Se você não quer campos `createdAt` e `updatedAt`
});

module.exports = User;
