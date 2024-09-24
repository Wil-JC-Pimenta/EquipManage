// authController.js
require('dotenv').config(); // Carrega variáveis de ambiente, incluindo a chave JWT
const jwt = require('jsonwebtoken');
const secretKey = process.env.JWT_SECRET; // Usando a variável de ambiente

// Função de login que gera o token
function gerarToken(user) {
    const payload = {
        id: user.id,
        name: user.name,
        email: user.email,
        roleId: user.roleId,
    };

    // Geração do token
    const token = jwt.sign(payload, secretKey, { expiresIn: '1h' });
    return token;
}

module.exports = { gerarToken };
