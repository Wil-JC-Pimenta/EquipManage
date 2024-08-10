const express = require('express');
const bodyParser = require('body-parser');
const puppeteer = require('puppeteer');
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
const certificadonr13Routes = require('./routes/certificadonr13Routes'); 



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

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'public/views/certificadoview.ejs'));

// Usar as rotas da API
app.use('/api/users', userRoutes);
app.use('/api/admins', adminRoutes);
app.use('/api/clientes', clienteRoutes);
app.use('/api/equipamentos', equipamentoRoutes);
app.use('/api/funcionarios', funcionarioRoutes);
app.use('/api/certificados', certificadoRoutes);
app.use('/api/certificadonr13', certificadonr13Routes);



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
// Endpoint para consultar os dados
app.get('/certificadonr13', async (req, res) => {
    try {
      const result = await pool.query('SELECT * FROM certificadonr13');
      res.status(200).json(result.rows);
    } catch (err) {
      console.error(err.message);
      res.status(500).send('Erro ao consultar os dados');
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
