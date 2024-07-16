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

Certificate.belongsTo(Equipment, { foreignKey: 'equipamento_id' });
Certificate.belongsTo(Client, { foreignKey: 'cliente_id' });
Certificate.belongsTo(Employee, { foreignKey: 'funcionario_id' });

module.exports = Certificate;
