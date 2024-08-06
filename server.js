const express = require('express');
const path = require('path');
const app = express();
const port = process.env.PORT || 3001;

const sequelize = require('./config/database/sequelize');
const userRoutes = require('./routes/userRoutes');
const adminRoutes = require('./routes/adminRoutes');
const clienteRoutes = require('./routes/clienteRoutes');
const equipamentoRoutes = require('./routes/equipamentoRoutes');
const funcionarioRoutes = require('./routes/funcionarioRoutes');
const certificadoRoutes = require('./routes/certificadoRoutes');
const { User, Cliente, Equipamento, Funcionario, Certificado } = require('./config/database/sequelize');

// Middleware para parsear JSON
app.use(express.json());

// Middleware para logging
app.use((req, res, next) => {
    console.log(`${req.method} ${req.url}`);
    next();
});

// Servir arquivos estáticos da pasta views
app.use(express.static(path.join(__dirname, 'public')));

// Rota raiz para servir a página inicial
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public/views/index.html'));
});

// Rotas para as views
app.get('/users', (req, res) => {
    res.sendFile(path.join(__dirname, 'public/views/users.html'));
});

app.get('/clientes', (req, res) => {
    res.sendFile(path.join(__dirname, 'public/views/clientes.html'));
});

app.get('/equipamentos', (req, res) => {
    res.sendFile(path.join(__dirname, 'public/views/equipamentos.html'));
});

app.get('/funcionarios', (req, res) => {
    res.sendFile(path.join(__dirname, 'public/views/funcionarios.html'));
});

app.get('/certificados', (req, res) => {
    res.sendFile(path.join(__dirname, 'public/views/certificados.html'));
});
app.get('/certificadonr13', (req, res) => {
    res.sendFile(path.join(__dirname, 'public/views/certificadonr13.html'));
});

// Usar as rotas da API
app.use('/api/users', userRoutes);
app.use('/api/admins', adminRoutes);
app.use('/api/clientes', clienteRoutes);
app.use('/api/equipamentos', equipamentoRoutes);
app.use('/api/funcionarios', funcionarioRoutes);
app.use('/api/certificados', certificadoRoutes);

// Rota para exibir a lista de certificados com nomes correspondentes
app.get('/certificados', async (req, res) => {
    try {
        const certificados = await Certificado.findAll({
            include: [
                { model: Cliente, as: 'cliente' },
                { model: Equipamento, as: 'equipamento' },
                { model: Funcionario, as: 'funcionario' }
            ]
        });
        res.json(certificados); // Alterado para res.json(certificados) para retornar JSON
    } catch (error) {
        res.status(500).json({ error: 'Erro ao buscar certificados' });
    }
});

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
