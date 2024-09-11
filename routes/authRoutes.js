const express = require('express');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { User } = require('../models/userModel');
const router = express.Router();
const jwtSecret = require('../config/jwt');

// Rota de login
router.post('/login', async (req, res) => {
    const { email, password } = req.body;
    
    const user = await User.findOne({ where: { email } });
    if (!user) {
        return res.status(401).json({ message: 'Usuário não encontrado' });
    }
    
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
        return res.status(401).json({ message: 'Senha inválida' });
    }
    
    const token = jwt.sign({ id: user.id, role: user.role }, jwtSecret, { expiresIn: '1h' });
    res.json({ token });
});

// Rota de registro (somente Admins podem criar outros admins)
router.post('/register', async (req, res) => {
    const { name, email, password, role } = req.body;
    
    const hash = await bcrypt.hash(password, 10);
    
    const user = await User.create({
        name,
        email,
        password: hash,
        role: role || 'user' // Usuário normal por padrão
    });
    
    res.status(201).json(user);
});

module.exports = router;
