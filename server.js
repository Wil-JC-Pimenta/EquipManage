const express = require('express');
const app = express();
const port = process.env.PORT || 3000; // Alterar a porta para 3001
const userRoutes = require('./routes/userRoutes');

// Middleware para parsear JSON
app.use(express.json());

// Usar as rotas de usuário
app.use('/', userRoutes);

app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});
