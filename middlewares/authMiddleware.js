const jwt = require('jsonwebtoken');
const secretKey = process.env.JWT_SECRET || 'seuSegredoJWT'; // Defina um valor padrão para testes

module.exports = (req, res, next) => {
    const token = req.headers.authorization?.split(' ')[1];

    if (!token) {
        return res.status(401).json({ message: 'Token não fornecido' });
    }

    jwt.verify(token, secretKey, (err, decoded) => {
        if (err) {
            return res.status(401).json({ message: 'Token inválido' });
        }

        req.user = decoded; // Adiciona o usuário decodificado à requisição
        next();
    });
};
