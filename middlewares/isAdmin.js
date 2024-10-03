const isAdmin = (req, res, next) => {
    // Verifica se o usuário está autenticado e se o seu papel é 'admin'
    if (req.user && req.user.role === 'admin') {
        next(); // O usuário é admin, permite o acesso
    } else {
        return res.status(403).json({ message: 'Acesso negado' }); // Acesso negado
    }
};

module.exports = isAdmin;
