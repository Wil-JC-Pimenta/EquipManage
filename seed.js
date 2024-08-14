const sequelize = require('./models/index');
const Equipamento = require('./models/equipamentoModel');
const Cliente = require('./models/clienteModel');
const Funcionario = require('./models/funcionarioModel');

sequelize.sync().then(async () => {
  await Equipamento.create({
    name: 'Equipamento A',
    type: 'Tipo A',
    serialNumber: '12345'
  });

  await Cliente.create({
    name: 'Cliente A',
    email: 'clientea@example.com',
    address: 'Rua Exemplo, 123'
  });

  await Funcionario.create({
    name: 'Funcionario A',
    email: 'funcionarioa@example.com',
    role: 'Técnico'
  });

  console.log('Dados de teste inseridos com sucesso!');
  process.exit();
}).catch(err => {
  console.error('Erro ao inserir dados de teste:', err);
  process.exit(1);
});
