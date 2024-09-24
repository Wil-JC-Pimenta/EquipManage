const express = require('express');
const jwt = require('jsonwebtoken');

const router = express.Router();

// Rota de login
router.post('/', (req, res) => {  // Isso cria a rota POST /api/login
  const { username, password } = req.body;

  // Verificar se as credenciais são válidas
  if (username === 'admin' && password === '1234') {
    // Gerar o token JWT
    const token = jwt.sign({ username }, 'seuSegredoJWT', { expiresIn: '1h' });

    // Retornar o token no JSON
    return res.json({ token });
  } else {
    return res.status(401).json({ message: 'Credenciais inválidas' });
  }
});

module.exports = router;
