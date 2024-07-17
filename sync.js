// sync.js
const sequelize = require('./index'); 
const Cliente = require('./models/clienteModel');
const Equipamento = require('./models/equipamentoModel');

sequelize.sync({ force: false }).then(async () => {
  console.log('Tabelas sincronizadas');

  // Atualize as linhas existentes para ter um valor na coluna 'nome'
  await Equipamento.update({ nome: 'valor padrão' }, { where: { nome: null } });

  await sequelize.getQueryInterface().changeColumn('equipamentos', 'nome', {
    type: DataTypes.STRING,
    allowNull: false,
  });

}).catch((error) => {
  console.error('Erro ao sincronizar as tabelas:', error);
});
