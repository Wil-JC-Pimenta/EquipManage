const express = require('express');
const app = express();
const port = process.env.PORT || 3001;

const sequelize = require('./models/index');
const userRoutes = require('./routes/userRoutes');
const adminRoutes = require('./routes/adminRoutes');
const clienteRoutes = require('./routes/clienteRoutes');
const equipamentoRoutes = require('./routes/equipamentoRoutes');
const funcionarioRoutes = require('./routes/funcionarioRoutes');
const certificadoRoutes = require('./routes/certificadoRoutes');

// Middleware para parsear JSON
app.use(express.json());

// Middleware para logging
app.use((req, res, next) => {
  console.log(`${req.method} ${req.url}`);
  next();
});

// Usar as rotas
app.use('/users', userRoutes);
app.use('/admins', adminRoutes);
app.use('/clientes', clienteRoutes);
app.use('/equipamentos', equipamentoRoutes);
app.use('/funcionarios', funcionarioRoutes);
app.use('/certificados', certificadoRoutes);

// Sincronizar banco de dados e iniciar servidor
sequelize.sync().then(() => {
  app.listen(port, () => {
    console.log(`Servidor rodando em http://localhost:${port}`);
  });
}).catch(err => {
  console.error('Erro ao sincronizar banco de dados:', err);
});
