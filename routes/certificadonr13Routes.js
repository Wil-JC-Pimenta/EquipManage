const express = require('express');
const router = express.Router();
const CertificadoNR13 = require('../models/certificadonr13Model');

// Criar um novo certificado
router.post('/', async (req, res) => {
  const certificado = new CertificadoNR13(req.body);
  try {
    const novoCertificado = await certificado.save();
    res.status(201).json(novoCertificado);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

// Obter todos os certificados
router.get('/', async (req, res) => {
  try {
    const certificados = await CertificadoNR13.find();
    res.json(certificados);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Obter um certificado específico
router.get('/:id', getCertificadoNR13, (req, res) => {
  res.json(res.certificado);
});

// Atualizar um certificado
router.put('/:id', getCertificadoNR13, async (req, res) => {
  Object.assign(res.certificado, req.body);
  try {
    const certificadoAtualizado = await res.certificado.save();
    res.json(certificadoAtualizado);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

// Excluir um certificado
router.delete('/:id', getCertificadoNR13, async (req, res) => {
  try {
    await res.certificado.remove();
    res.json({ message: 'Certificado removido' });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Middleware para obter um certificado pelo ID
async function getCertificadoNR13(req, res, next) {
  let certificado;
  try {
    certificado = await CertificadoNR13.findById(req.params.id);
    if (certificado == null) {
      return res.status(404).json({ message: 'Certificado não encontrado' });
    }
  } catch (err) {
    return res.status(500).json({ message: err.message });
  }
  res.certificado = certificado;
  next();
}

module.exports = router;
