// routes/uploadHandler.js
const express = require('express');
const multer = require('multer');
const path = require('path');
const router = express.Router();

// Configuração do multer para upload de imagens
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/');
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + path.extname(file.originalname));
  }
});

const upload = multer({ storage });

// Rota para lidar com o upload de imagens
router.post('/upload', upload.array('images', 4), (req, res) => {
  const files = req.files;
  const data = req.body;

  console.log('Dados recebidos:', data);
  console.log('Arquivos recebidos:', files);

  res.send('Dados e imagens enviados com sucesso!');
});

module.exports = router;
