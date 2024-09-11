const express = require('express');
const path = require('path');
const app = express();
const port = process.env.PORT || 3001;

const sequelize = require('./config/database/sequelize');
const authRoutes = require('./routes/authRoutes');
const userRoutes = require('./routes/userRoutes');
const adminRoutes = require('./routes/adminRoutes');
const clienteRoutes = require('./routes/clienteRoutes');
const equipamentoRoutes = require('./routes/equipamentoRoutes');
const funcionarioRoutes = require('./routes/funcionarioRoutes');
const certificadoRoutes = require('./routes/certificadoRoutes');
const errorHandler = require('./middlewares/errorHandler');  // Middleware de tratamento de erros
const authMiddleware = require('./middlewares/authMiddleware');  // Middleware de autenticação


// Middleware para JSON e logging
app.use(express.json());
app.use((req, res, next) => {
    console.log(`${req.method} ${req.url}`);
    next();
});

// Rotas de autenticação
app.use('/api/auth', authRoutes);

// Rotas protegidas por autenticação
app.use('/api/users', authMiddleware, userRoutes);
app.use('/api/admins', authMiddleware, adminRoutes);
app.use('/api/clientes', authMiddleware, clienteRoutes);
app.use('/api/equipamentos', authMiddleware, equipamentoRoutes);
app.use('/api/funcionarios', authMiddleware, funcionarioRoutes);
app.use('/api/certificados', authMiddleware, certificadoRoutes);

// Servir arquivos estáticos e views
app.use(express.static(path.join(__dirname, 'public')));
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public/views/index.html'));
});

// Rota de exemplo com erro
app.get('/erro', (req, res, next) => {
    const erro = new Error('Algo deu errado!');
    erro.status = 500;
    next(erro);
});

// Middleware de tratamento de erros
app.use(errorHandler);

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
