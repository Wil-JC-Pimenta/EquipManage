const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

const userRoutes = require('./routes/userRoutes');
const adminRoutes = require('./routes/adminRoutes');
const clienteRoutes = require('./routes/clienteRoutes');
const equipamentoRoutes = require('./routes/equipamentoRoutes');
const funcionarioRoutes = require('./routes/funcionarioRoutes');

// Middleware para parsear JSON
app.use(express.json());

// Middleware para logging
app.use((req, res, next) => {
  console.log(`${req.method} ${req.url}`);
  next();
});

// Usar as rotas
app.use('/', userRoutes);
app.use('/', adminRoutes);
app.use('/', clienteRoutes);
app.use('/', equipamentoRoutes);
app.use('/', funcionarioRoutes);

app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});
