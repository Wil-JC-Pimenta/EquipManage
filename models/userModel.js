// models/userModel.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/database/sequelize');
const Role = require('./roleModel'); // Adicionar a importação do Role

const User = sequelize.define('User', {
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
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  roleId: {
    type: DataTypes.INTEGER,
    references: {
      model: 'Roles',
      key: 'id',
    },
    allowNull: false,
  },
});

User.belongsTo(Role, { foreignKey: 'roleId' });

module.exports = User;
