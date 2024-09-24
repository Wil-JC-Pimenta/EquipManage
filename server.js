const express = require('express');
const path = require('path');
const app = express();
const port = process.env.PORT || 3001;

const sequelize = require('./config/database/sequelize');
const loginRoutes = require('./routes/loginRoutes'); // Certifique-se de que o caminho está correto
const authRoutes = require('./routes/authRoutes');
const userRoutes = require('./routes/userRoutes');
const adminRoutes = require('./routes/adminRoutes');
const clienteRoutes = require('./routes/clienteRoutes');
const equipamentoRoutes = require('./routes/equipamentoRoutes');
const funcionarioRoutes = require('./routes/funcionarioRoutes');
const certificadoRoutes = require('./routes/certificadoRoutes');
const errorHandler = require('./middlewares/errorHandler');
const authMiddleware = require('./middlewares/authMiddleware');

// Middleware para JSON e logging
app.use(express.json()); // Certifique-se de que o express está habilitado para lidar com JSON
app.use((req, res, next) => {
    console.log(`${req.method} ${req.url}`);
    next();
});

// Rotas de autenticação
app.use('/api/auth', authRoutes);

// Rota de login
app.use('/api/login', loginRoutes); 

// Rotas protegidas por autenticação
app.use('/api/users', authMiddleware, userRoutes);
app.use('/api/admins', authMiddleware, adminRoutes);
app.use('/api/clientes', authMiddleware, clienteRoutes);
app.use('/api/equipamentos', authMiddleware, equipamentoRoutes);
app.use('/api/funcionarios', authMiddleware, funcionarioRoutes);
app.use('/api/certificados', authMiddleware, certificadoRoutes);

// Tratamento de erros
app.use(errorHandler);

// Servir arquivos estáticos e views
app.use(express.static(path.join(__dirname, 'public')));
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public/views/index.html'));
});

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
