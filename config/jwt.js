// authMiddleware.js
const jwt = require('jsonwebtoken');
const secretKey = require('./jwt'); // Importa sua chave secreta

// Middleware de autenticação
function verificarToken(req, res, next) {
    const token = req.headers['authorization'];

    if (!token) {
        return res.status(403).json({ message: 'Token não fornecido' });
    }

    // Verificar o token
    jwt.verify(token.split(' ')[1], secretKey, (err, decoded) => {
        if (err) {
            return res.status(401).json({ message: 'Token inválido' });
        }
        req.user = decoded; // Anexar os dados decodificados do usuário à requisição
        next();
    });
}

module.exports = verificarToken;
