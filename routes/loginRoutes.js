const express = require('express');
const jwt = require('jsonwebtoken');
require('dotenv').config(); // Carregar variáveis de ambiente

const router = express.Router();

// Rota de login
router.post('/', (req, res) => { // Isso cria a rota POST /api/login
  const { username, password } = req.body;

  // Verificar se as credenciais são válidas
  if (username === 'admin' && password === '1234') {
    // Gerar o token JWT usando a chave secreta do .env
    const token = jwt.sign({ username }, process.env.JWT_SECRET, { expiresIn: '1h' });

    // Retornar o token no JSON
    return res.json({ token });
  } else {
    return res.status(401).json({ message: 'Credenciais inválidas' });
  }
});

module.exports = router;
