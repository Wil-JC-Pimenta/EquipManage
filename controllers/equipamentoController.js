const Equipamento = require('../models/equipamentoModel');

exports.createEquipamento = async (req, res) => {
    try {
        const equipamento = await Equipamento.create(req.body);
        res.status(201).send(equipamento);
    } catch (error) {
        res.status(400).send(error);
    }
};

exports.getEquipamentos = async (req, res) => {
    try {
        const equipamentos = await Equipamento.findAll();
        res.status(200).send(equipamentos);
    } catch (error) {
        res.status(500).send(error);
    }
};

exports.getEquipamento = async (req, res) => {
    try {
        const equipamento = await Equipamento.findByPk(req.params.id);
        if (!equipamento) {
            return res.status(404).send({ error: 'Equipamento não encontrado' });
        }
        res.status(200).send(equipamento);
    } catch (error) {
        res.status(500).send(error);
    }
};

exports.updateEquipamento = async (req, res) => {
    try {
        const [updated] = await Equipamento.update(req.body, {
            where: { id: req.params.id }
        });

        if (updated) {
            const updatedEquipamento = await Equipamento.findByPk(req.params.id);
            return res.status(200).send(updatedEquipamento);
        }
        res.status(404).send({ error: 'Equipamento não encontrado' });
    } catch (error) {
        res.status(400).send(error);
    }
};

exports.deleteEquipamento = async (req, res) => {
    try {
        const deleted = await Equipamento.destroy({
            where: { id: req.params.id }
        });

        if (deleted) {
            return res.status(204).send();
        }
        res.status(404).send({ error: 'Equipamento não encontrado' });
    } catch (error) {
        res.status(500).send(error);
    }
};
