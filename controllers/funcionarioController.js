const Funcionario = require('../models/funcionarioModel');

exports.createFuncionario = async (req, res) => {
    try {
        const funcionario = await Funcionario.create(req.body);
        res.status(201).send(funcionario);
    } catch (error) {
        res.status(400).send({ error: error.message });
    }
};

exports.getFuncionarios = async (req, res) => {
    try {
        const funcionarios = await Funcionario.findAll();
        res.status(200).send(funcionarios);
    } catch (error) {
        res.status(500).send({ error: error.message });
    }
};

exports.getFuncionario = async (req, res) => {
    try {
        const funcionario = await Funcionario.findByPk(req.params.id);
        if (!funcionario) {
            return res.status(404).send({ error: 'Funcionario não encontrado' });
        }
        res.status(200).send(funcionario);
    } catch (error) {
        res.status(500).send({ error: error.message });
    }
};

exports.updateFuncionario = async (req, res) => {
    try {
        const [updated] = await Funcionario.update(req.body, {
            where: { id: req.params.id }
        });

        if (updated) {
            const updatedFuncionario = await Funcionario.findByPk(req.params.id);
            return res.status(200).send(updatedFuncionario);
        }
        res.status(404).send({ error: 'Funcionario não encontrado' });
    } catch (error) {
        res.status(400).send({ error: error.message });
    }
};

exports.deleteFuncionario = async (req, res) => {
    try {
        const deleted = await Funcionario.destroy({
            where: { id: req.params.id }
        });

        if (deleted) {
            return res.status(204).send();
        }
        res.status(404).send({ error: 'Funcionario não encontrado' });
    } catch (error) {
        res.status(500).send({ error: error.message });
    }
};
