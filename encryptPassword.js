const bcrypt = require('bcrypt');

// Função para criptografar uma senha
const encryptPassword = async (plainPassword) => {
    const saltRounds = 10;
    try {
        const hashedPassword = await bcrypt.hash(plainPassword, saltRounds);
        console.log('Senha criptografada:', hashedPassword);
        return hashedPassword;
    } catch (error) {
        console.error('Erro ao criptografar a senha:', error);
    }
};

// Exemplo de uso
const password = 'nova_senha'; // Senha em texto claro
encryptPassword(password);
