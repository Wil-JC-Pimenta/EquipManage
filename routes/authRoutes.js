const express = require('express');
const bcrypt = require('bcrypt');
const User = require('../models/userModel');
const gerarToken = require('../config/jwt');
const router = express.Router();

// Rota de login
router.post('/login', async (req, res) => {
    const { email, password } = req.body;

    try {
        // Encontrar o usuário pelo email
        const user = await User.findOne({ where: { email } });
        
        if (!user) {
            return res.status(404).json({ message: 'Usuário não encontrado' });
        }

        // Verificar se a senha está correta
        const senhaValida = await bcrypt.compare(password, user.password);
        if (!senhaValida) {
            return res.status(401).json({ message: 'Senha incorreta' });
        }

        // Gerar o token JWT
        const token = gerarToken(user);

        // Retornar o token no response
        res.json({ token });
    } catch (err) {
        res.status(500).json({ message: 'Erro no servidor', error: err.message });
    }
});

module.exports = router;
