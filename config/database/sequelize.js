const { Sequelize } = require('sequelize');
const sequelize = new Sequelize('nr13gestor', 'postgres', 'Database7894', {
  host: 'localhost',
  dialect: 'postgres',
  port: 5432,
});

sequelize.authenticate()
  .then(() => {
    console.log('Conexão com o banco de dados PostgreSQL estabelecida com sucesso.');
  })
  .catch(err => {
    console.error('Não foi possível conectar ao banco de dados:', err);
  });

module.exports = sequelize;
