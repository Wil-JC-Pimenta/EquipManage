// middlewares/errorHandler.js
const errorHandler = (err, req, res, next) => {
    console.error(err.stack); // Log do erro no servidor

    // Envia uma resposta genérica para o cliente
    res.status(err.status || 500).json({
        message: err.message || 'Ocorreu um erro no servidor.',
        error: process.env.NODE_ENV === 'development' ? err : {}, // Envia detalhes apenas em ambiente de desenvolvimento
    });
};

module.exports = errorHandler;
