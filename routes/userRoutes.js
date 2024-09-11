const express = require('express');
const router = express.Router();
const authMiddleware = require('../middlewares/authMiddleware');
const roleMiddleware = require('../middlewares/roleMiddleware');

// Rota para ver detalhes do usuário (disponível para todos os logados)
router.get('/me', authMiddleware, (req, res) => {
    res.json(req.user);
});

// Rota para Admins gerenciarem usuários
router.delete('/:id', authMiddleware, roleMiddleware(['admin']), async (req, res) => {
    try {
        await User.destroy({ where: { id: req.params.id } });
        res.status(204).json({ message: 'Usuário removido' });
    } catch (error) {
        res.status(500).json({ message: 'Erro ao remover usuário' });
    }
});

// Usuários podem editar suas próprias informações
router.put('/me', authMiddleware, roleMiddleware(['user', 'admin']), async (req, res) => {
    try {
        await req.user.update(req.body);
        res.json(req.user);
    } catch (error) {
        res.status(500).json({ message: 'Erro ao atualizar informações' });
    }
});

// Clientes podem consultar certificados (apenas leitura)
router.get('/certificados', authMiddleware, roleMiddleware(['cliente']), async (req, res) => {
    // lógica para buscar certificados
    res.json({ certificados: [] });
});

module.exports = router;
