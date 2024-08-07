const mongoose = require('mongoose');

const CertificadoNR13Schema = new mongoose.Schema({
  registroEntrada: String,
  numeroPatrimonio: String,
  numeroContrato: String,
  cliente: String,
  instrumento: String,
  tag: String,
  tagVaso: String,
  fabricante: String,
  modelo: String,
  numeroSerie: String,
  pressaoAjuste: String,
  diametro: String,
  diametroOrificio: String,
  tipo: String,
  cor: String,
  fluido: String,
  vazao: String,
  contraPressao: String,
  temperaturaOperacao: String,
  certificado: String,
  equipamento: String,
  patrimonio: String,
  validade: String,
  procedimentosUtilizados: String,
  temperaturaAmbiente: String,
  humidadeRelativa: String,
  local: String,
  dataEnsaio: Date,
  proximoEnsaio: Date,
  resultadosEnsaio: {
    antesAjuste: {
      valorInicioAberturaKgf: String,
      valorAberturaKgf: String,
      valorAberturaRealKgf: String,
      valorFechamentoKgf: String,
      valorInicioAberturaMpa: String,
      valorAberturaMpa: String,
      valorAberturaRealMpa: String,
      valorFechamentoMpa: String,
      erroKgf: String,
      uKgf: String,
      kKgf: String
    },
    depoisAjuste: {
      valorInicioAberturaKgf: String,
      valorAberturaKgf: String,
      valorAberturaRealKgf: String,
      valorFechamentoKgf: String,
      valorInicioAberturaMpa: String,
      valorAberturaMpa: String,
      valorAberturaRealMpa: String,
      valorFechamentoMpa: String,
      erroKgf: String,
      uKgf: String,
      kKgf: String
    }
  },
  numeroLacre: String,
  observacoes: String,
  servicosExecutados: [String]
});

module.exports = mongoose.model('CertificadoNR13', CertificadoNR13Schema);
