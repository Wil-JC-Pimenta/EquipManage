const express = require('express');
const path = require('path');
const app = express();
const port = process.env.PORT || 3001;

const sequelize = require('./models/index');
const userRoutes = require('./routes/userRoutes');
const adminRoutes = require('./routes/adminRoutes');
const clienteRoutes = require('./routes/clienteRoutes');
const equipamentoRoutes = require('./routes/equipamentoRoutes'); // Importação das rotas de equipamentos
const funcionarioRoutes = require('./routes/funcionarioRoutes');
const certificadoRoutes = require('./routes/certificadoRoutes');

// Middleware para parsear JSON
app.use(express.json());

// Middleware para logging
app.use((req, res, next) => {
  console.log(`${req.method} ${req.url}`);
  next();
});

// Rota raiz para servir a página inicial
app.get('/', (req, res) => {
  res.send('Bem-vindo à página inicial!');
});

// Rota direta para /about
app.get('/about', (req, res) => {
  const filePath = path.join(__dirname, 'views/about.html');
  console.log(`Servindo o arquivo: ${filePath}`);
  res.sendFile(filePath, (err) => {
    if (err) {
      console.error(`Erro ao servir o arquivo ${filePath}:`, err);
      res.status(err.status).end();
    }
  });
});

// Usar as rotas
app.use('/users', userRoutes);
app.use('/admins', adminRoutes);
app.use('/clientes', clienteRoutes);
app.use('/equipamentos', equipamentoRoutes); // Uso das rotas de equipamentos
app.use('/funcionarios', funcionarioRoutes);
app.use('/certificados', certificadoRoutes);

// Sincronizar banco de dados e iniciar servidor
sequelize.sync({ alter: true }).then(() => {
  app.listen(port, () => {
    console.log(`Servidor rodando em http://localhost:${port}`);
  });
}).catch(err => {
  console.error('Erro ao sincronizar banco de dados:', err);
});
