const express = require('express');
const path = require('path');
const app = express();
const port = process.env.PORT || 3001;

const sequelize = require('./models/index');
const userRoutes = require('./routes/userRoutes');
const adminRoutes = require('./routes/adminRoutes');
const clienteRoutes = require('./routes/clienteRoutes');
const equipamentoRoutes = require('./routes/equipamentoRoutes'); 
const funcionarioRoutes = require('./routes/funcionarioRoutes');
const certificadoRoutes = require('./routes/certificadoRoutes');
const { User, Cliente, Equipamento, Certificado } = require('./models');

app.use(express.json());

app.post('/users', (req, res) => {
    // Lógica para adicionar usuario
    res.status(201).send(req.body);
});


app.post('/clientes', (req, res) => {
  // Lógica para adicionar cliente
  res.status(201).send(req.body);
});

app.post('/equipamentos', (req, res) => {
  // Lógica para adicionar equipamento
  res.status(201).send(req.body);
});


app.post('/funcionario', (req, res) => {
  // Lógica para adicionar funcionário
  res.status(201).send(req.body);
});


app.post('/certificados', (req, res) => {
  // Lógica para adicionar funcionário
  res.status(201).send(req.body);
});


// Middleware para parsear JSON
app.use(express.json());

// Middleware para logging
app.use((req, res, next) => {
  console.log(`${req.method} ${req.url}`);
  next();
});

// Servir arquivos estáticos da pasta views
app.use(express.static(path.join(__dirname, 'views')));

// Rota raiz para servir a página inicial
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'views/index.html'));
});

// Rotas para as views
app.get('/users', (req, res) => {
  res.sendFile(path.join(__dirname, 'views/users.html'));
});

app.get('/clientes', (req, res) => {
  res.sendFile(path.join(__dirname, 'views/clientes.html'));
});

app.get('/equipamentos', (req, res) => {
  res.sendFile(path.join(__dirname, 'views/equipamentos.html'));
});

app.get('/funcionarios', (req, res) => {
  res.sendFile(path.join(__dirname, 'views/funcionarios.html'));
});

app.get('/certificados', (req, res) => {
  res.sendFile(path.join(__dirname, 'views/certificados.html'));
});

// Usar as rotas da API
app.use('/api/users', userRoutes);
app.use('/api/admins', adminRoutes);
app.use('/api/clientes', clienteRoutes);
app.use('/api/equipamentos', equipamentoRoutes);
app.use('/api/funcionarios', funcionarioRoutes);
app.use('/api/certificados', certificadoRoutes);

// Rotas de contagem
app.get('/api/users/count', async (req, res) => {
  try {
    const count = await User.count();
    res.json({ count });
  } catch (error) {
    res.status(500).json({ error: 'Erro ao buscar contagem de usuários' });
  }
});

app.get('/api/clientes/count', async (req, res) => {
  try {
    const count = await Cliente.count();
    res.json({ count });
  } catch (error) {
    res.status(500).json({ error: 'Erro ao buscar contagem de clientes' });
  }
});

app.get('/api/equipamentos/count', async (req, res) => {
  try {
    const count = await Equipamento.count();
    res.json({ count });
  } catch (error) {
    res.status(500).json({ error: 'Erro ao buscar contagem de equipamentos' });
  }
});

app.get('/api/certificados/count', async (req, res) => {
  try {
    const count = await Certificado.count();
    res.json({ count });
  } catch (error) {
    res.status(500).json({ error: 'Erro ao buscar contagem de certificados' });
  }
});

// Sincronizar banco de dados e iniciar servidor
sequelize.sync({ alter: true }).then(() => {
  app.listen(port, () => {
    console.log(`Servidor rodando em http://localhost:${port}`);
  });
}).catch(err => {
  console.error('Erro ao sincronizar banco de dados:', err);
});
