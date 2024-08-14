const db = require('../config/database/sequelize');

exports.getAllCertificates = () => {
    return db.query('SELECT * FROM certificadonr13');
};

exports.getCertificateById = (id) => {
    return db.query('SELECT * FROM certificadonr13 WHERE id = ?', [id]);
};

exports.createCertificate = (certificate) => {
    const {
        registroEntrada, numeroPatrimonio, numeroContrato, cliente, instrumento, tag, tagVaso,
        fabricante, modelo, numeroSerie, pressaoAjuste, diametro, diametroOrificio, tipo, cor,
        fluido, vazao, contraPressao, temperaturaOperacao, certificado, equipamento, patrimonio,
        validade, procedimentosUtilizados, temperaturaAmbiente, humidadeRelativa, local,
        dataEnsaio, proximoEnsaio, valorInicioAberturaKgf, valorAberturaKgf, valorAberturaRealKgf,
        valorFechamentoKgf, valorInicioAberturaMpa, valorAberturaMpa, valorAberturaRealMpa,
        valorFechamentoMpa, erro, u, k, numeroLacre, observacoes, servicosExecutados
    } = certificate;

    return db.query(
        `INSERT INTO certificadonr13 (
            registroEntrada, numeroPatrimonio, numeroContrato, cliente, instrumento, tag, tagVaso,
            fabricante, modelo, numeroSerie, pressaoAjuste, diametro, diametroOrificio, tipo, cor,
            fluido, vazao, contraPressao, temperaturaOperacao, certificado, equipamento, patrimonio,
            validade, procedimentosUtilizados, temperaturaAmbiente, humidadeRelativa, local,
            dataEnsaio, proximoEnsaio, valorInicioAberturaKgf, valorAberturaKgf, valorAberturaRealKgf,
            valorFechamentoKgf, valorInicioAberturaMpa, valorAberturaMpa, valorAberturaRealMpa,
            valorFechamentoMpa, erro, u, k, numeroLacre, observacoes, servicosExecutados
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
        [
            registroEntrada, numeroPatrimonio, numeroContrato, cliente, instrumento, tag, tagVaso,
            fabricante, modelo, numeroSerie, pressaoAjuste, diametro, diametroOrificio, tipo, cor,
            fluido, vazao, contraPressao, temperaturaOperacao, certificado, equipamento, patrimonio,
            validade, procedimentosUtilizados, temperaturaAmbiente, humidadeRelativa, local,
            dataEnsaio, proximoEnsaio, valorInicioAberturaKgf, valorAberturaKgf, valorAberturaRealKgf,
            valorFechamentoKgf, valorInicioAberturaMpa, valorAberturaMpa, valorAberturaRealMpa,
            valorFechamentoMpa, erro, u, k, numeroLacre, observacoes, servicosExecutados
        ]
    );
};

exports.updateCertificate = (id, certificate) => {
    const {
        registroEntrada, numeroPatrimonio, numeroContrato, cliente, instrumento, tag, tagVaso,
        fabricante, modelo, numeroSerie, pressaoAjuste, diametro, diametroOrificio, tipo, cor,
        fluido, vazao, contraPressao, temperaturaOperacao, certificado, equipamento, patrimonio,
        validade, procedimentosUtilizados, temperaturaAmbiente, humidadeRelativa, local,
        dataEnsaio, proximoEnsaio, valorInicioAberturaKgf, valorAberturaKgf, valorAberturaRealKgf,
        valorFechamentoKgf, valorInicioAberturaMpa, valorAberturaMpa, valorAberturaRealMpa,
        valorFechamentoMpa, erro, u, k, numeroLacre, observacoes, servicosExecutados
    } = certificate;

    return db.query(
        `UPDATE certificadonr13 SET
            registroEntrada = ?, numeroPatrimonio = ?, numeroContrato = ?, cliente = ?, instrumento = ?, tag = ?, tagVaso = ?,
            fabricante = ?, modelo = ?, numeroSerie = ?, pressaoAjuste = ?, diametro = ?, diametroOrificio = ?, tipo = ?, cor = ?,
            fluido = ?, vazao = ?, contraPressao = ?, temperaturaOperacao = ?, certificado = ?, equipamento = ?, patrimonio = ?,
            validade = ?, procedimentosUtilizados = ?, temperaturaAmbiente = ?, humidadeRelativa = ?, local = ?, dataEnsaio = ?,
            proximoEnsaio = ?, valorInicioAberturaKgf = ?, valorAberturaKgf = ?, valorAberturaRealKgf = ?, valorFechamentoKgf = ?,
            valorInicioAberturaMpa = ?, valorAberturaMpa = ?, valorAberturaRealMpa = ?, valorFechamentoMpa = ?, erro = ?, u = ?, k = ?,
            numeroLacre = ?, observacoes = ?, servicosExecutados = ?
        WHERE id = ?`,
        [
            registroEntrada, numeroPatrimonio, numeroContrato, cliente, instrumento, tag, tagVaso,
            fabricante, modelo, numeroSerie, pressaoAjuste, diametro, diametroOrificio, tipo, cor,
            fluido, vazao, contraPressao, temperaturaOperacao, certificado, equipamento, patrimonio,
            validade, procedimentosUtilizados, temperaturaAmbiente, humidadeRelativa, local,
            dataEnsaio, proximoEnsaio, valorInicioAberturaKgf, valorAberturaKgf, valorAberturaRealKgf,
            valorFechamentoKgf, valorInicioAberturaMpa, valorAberturaMpa, valorAberturaRealMpa,
            valorFechamentoMpa, erro, u, k, numeroLacre, observacoes, servicosExecutados, id
        ]
    );
};

exports.deleteCertificate = (id) => {
    return db.query('DELETE FROM certificadonr13 WHERE id = ?', [id]);
};
