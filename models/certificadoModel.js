const { DataTypes } = require('sequelize');
const sequelize = require('./index');
const Equipment = require('./equipamentoModel');
const Client = require('./clienteModel');
const Employee = require('./funcionarioModel');

const Certificate = sequelize.define('certificados', {
  otherDetails: {
    type: DataTypes.TEXT,
    allowNull: true
  }
}, {
  timestamps: true
});

Certificate.belongsTo(Equipment, { as: 'equipamento', foreignKey: 'equipamento_id' });
Certificate.belongsTo(Client, { as: 'cliente', foreignKey: 'cliente_id' });
Certificate.belongsTo(Employee, { as: 'funcionario', foreignKey: 'funcionario_id' });

module.exports = Certificate;
