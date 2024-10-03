const express = require('express');
const path = require('path');
const app = express();
const port = process.env.PORT || 3001;
require('dotenv').config();

const sequelize = require('./config/database/sequelize');
const loginRoutes = require('./routes/loginRoutes');
const authRoutes = require('./routes/authRoutes');
const userRoutes = require('./routes/userRoutes');
const adminRoutes = require('./routes/adminRoutes');
const clienteRoutes = require('./routes/clienteRoutes');
const equipamentoRoutes = require('./routes/equipamentoRoutes');
const funcionarioRoutes = require('./routes/funcionarioRoutes');
const certificadoRoutes = require('./routes/certificadoRoutes');
const errorHandler = require('./middlewares/errorHandler');
const authMiddleware = require('./middlewares/authMiddleware');
const isAdmin = require('./middlewares/isAdmin');

// Middleware para JSON e logging
app.use(express.json());
app.use((req, res, next) => {
    console.log(`${req.method} ${req.url}`);
    next();
});

// Rotas de autenticação
app.use('/api/auth', authRoutes);

// Rota de login
app.use('/api/login', loginRoutes); 

// Rota inicial com verificação de autenticação
app.get('/', authMiddleware, (req, res) => {
    // Se o usuário estiver autenticado, redireciona para a página inicial
    res.sendFile(path.join(__dirname, 'public/views/index.html'));
});

// Rotas protegidas por autenticação
app.use('/api/admins', authMiddleware, isAdmin, adminRoutes); // Apenas admin pode acessar
app.use('/api/users', authMiddleware, userRoutes);
app.use('/api/clientes', authMiddleware, clienteRoutes);
app.use('/api/equipamentos', authMiddleware, equipamentoRoutes);
app.use('/api/funcionarios', authMiddleware, funcionarioRoutes);
app.use('/api/certificados', authMiddleware, certificadoRoutes);

// Tratamento de erros
app.use(errorHandler);

// Servir arquivos estáticos
app.use(express.static(path.join(__dirname, 'public')));

// Sincronizar banco de dados e iniciar servidor
sequelize.sync({ alter: true })
    .then(() => {
        app.listen(port, () => {
            console.log(`Servidor rodando em http://localhost:${port}`);
        });
    })
    .catch(err => {
        console.error('Erro ao sincronizar banco de dados:', err);
    });
