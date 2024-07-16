// models/certificate.model.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Equipment = require('./equipment.model');
const Client = require('./client.model');
const Employee = require('./employee.model');

const Certificate = sequelize.define('Certificate', {
  otherDetails: {
    type: DataTypes.TEXT,
    allowNull: true
  }
}, {
  timestamps: true
});

Certificate.belongsTo(Equipment, { foreignKey: 'equipamento_id' });
Certificate.belongsTo(Client, { foreignKey: 'cliente_id' });
Certificate.belongsTo(Employee, { foreignKey: 'funcionario_id' });

module.exports = Certificate;
