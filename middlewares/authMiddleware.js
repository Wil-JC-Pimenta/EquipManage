const jwt = require('jsonwebtoken');
const { User } = require('../models/userModel');
const jwtSecret = require('../config/jwt');

const authMiddleware = async (req, res, next) => {
    const token = req.headers.authorization?.split(' ')[1];
    if (!token) {
        return res.status(401).json({ message: 'Token não fornecido' });
    }
    
    try {
        const decoded = jwt.verify(token, jwtSecret);
        const user = await User.findByPk(decoded.id);
        
        if (!user) {
            return res.status(401).json({ message: 'Usuário não encontrado' });
        }
        
        req.user = user; // Adiciona o usuário à requisição
        next();
    } catch (error) {
        return res.status(403).json({ message: 'Token inválido' });
    }
};

module.exports = authMiddleware;
