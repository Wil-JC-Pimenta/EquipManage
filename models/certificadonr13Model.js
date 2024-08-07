'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class CertificadoNR13 extends Model {
    static associate(models) {
      // define association here
    }
  }
  CertificadoNR13.init({
    registroEntrada: DataTypes.STRING,
    numeroPatrimonio: DataTypes.STRING,
    numeroContrato: DataTypes.STRING,
    cliente: DataTypes.STRING,
    instrumento: DataTypes.STRING,
    tag: DataTypes.STRING,
    tagVaso: DataTypes.STRING,
    fabricante: DataTypes.STRING,
    modelo: DataTypes.STRING,
    numeroSerie: DataTypes.STRING,
    pressaoAjuste: DataTypes.DECIMAL(10, 2),
    diametro: DataTypes.DECIMAL(10, 2),
    diametroOrificio: DataTypes.DECIMAL(10, 2),
    tipo: DataTypes.STRING,
    cor: DataTypes.STRING,
    fluido: DataTypes.STRING,
    vazao: DataTypes.DECIMAL(10, 2),
    contraPressao: DataTypes.DECIMAL(10, 2),
    temperaturaOperacao: DataTypes.DECIMAL(10, 2),
    certificado: DataTypes.STRING,
    equipamento: DataTypes.STRING,
    patrimonio: DataTypes.STRING,
    validade: DataTypes.DATE,
    procedimentosUtilizados: DataTypes.TEXT,
    temperaturaAmbiente: DataTypes.DECIMAL(10, 2),
    humidadeRelativa: DataTypes.DECIMAL(10, 2),
    local: DataTypes.STRING,
    dataEnsaio: DataTypes.DATE,
    proximoEnsaio: DataTypes.DATE,
    valorInicioAberturaKgf: DataTypes.DECIMAL(10, 2),
    valorAberturaKgf: DataTypes.DECIMAL(10, 2),
    valorAberturaRealKgf: DataTypes.DECIMAL(10, 2),
    valorFechamentoKgf: DataTypes.DECIMAL(10, 2),
    valorInicioAberturaMpa: DataTypes.DECIMAL(10, 2),
    valorAberturaMpa: DataTypes.DECIMAL(10, 2),
    valorAberturaRealMpa: DataTypes.DECIMAL(10, 2),
    valorFechamentoMpa: DataTypes.DECIMAL(10, 2),
    erro: DataTypes.DECIMAL(10, 2),
    u: DataTypes.DECIMAL(10, 2),
    k: DataTypes.DECIMAL(10, 2),
    numeroLacre: DataTypes.STRING,
    observacoes: DataTypes.TEXT,
    servicosExecutados: DataTypes.TEXT
  }, {
    sequelize,
    modelName: 'CertificadoNR13',
    tableName: 'certificadonr13',
  });
  return CertificadoNR13;
};
