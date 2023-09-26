
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "SERVICE_VAGAS_DEV"."VIEW_EMPRESAS_QUALIFICACOES_VENCIDAS" ("ID_CONTRATO", "DESCRICAO_CARTEIRA", "DESCRICAO_UNIDADE", "CONSULTOR_NOME", "ID_ENDERECO", "END_ENDERECO", "END_NUMERO", "END_BAIRRO", "END_COMPLEMENTO", "END_CEP", "END_CIDADE", "END_UF", "ID_EMPRESA", "ID_LOCAL_CONTRATO", "DATA_VENCIMENTO", "ID_QUALIFICACAO_PARAMETRO_EMPRESA", "INDICADOR", "CLASSIFICACAO_OBTIDA", "NOME", "RAZAO_SOCIAL", "CPF_CNPJ") AS
  SELECT
    -- CONTRATO
    RC.ID AS ID_CONTRATO,

    -- CARTEIRA
    RCART.DESCRICAO AS DESCRICAO_CARTEIRA,

     -- UNIDADE
    RU.DESCRICAO AS DESCRICAO_UNIDADE,

    -- CONSULTOR
    RP.NOME AS CONSULTOR_NOME,

    -- LOCAL
    RE.ID AS ID_ENDERECO,
    RE.ENDERECO AS END_ENDERECO,
    RE.NUMERO AS END_NUMERO,
    RE.BAIRRO AS END_BAIRRO,
    RE.COMPLEMENTO AS END_COMPLEMENTO,
    RE.CEP AS END_CEP,
    RE.CIDADE AS END_CIDADE,
    RE.UF AS END_UF,

    -- QUALIFICACAO
    T.ID_EMPRESA,
    T.ID_LOCAL_CONTRATO,
    T.DATA_VENCIMENTO,
    T.ID_QUALIFICACAO_PARAMETRO_EMPRESA,
    T.INDICADOR,
    T.CLASSIFICACAO_OBTIDA,
    T.NOME,
    T.RAZAO_SOCIAL,
    T.CPF_CNPJ
FROM(
    SELECT

        CONSOLIDADO.ID_EMPRESA,
        CONSOLIDADO.ID_LOCAL_CONTRATO,
        ANALITICOS.DATA_VENCIMENTO,
        PARAMETROS.ID ID_QUALIFICACAO_PARAMETRO_EMPRESA,
        PARAMETROS.INDICADOR,
        CONSOLIDADO.CLASSIFICACAO_OBTIDA,
        RE.NOME,
        RE.RAZAO_SOCIAL,
        CASE WHEN RE.CNPJ IS NULL THEN RE.CPF ELSE RE.CNPJ END AS CPF_CNPJ

    FROM QUALIFICACOES_EMPRESAS_CONSOLIDADO CONSOLIDADO

    INNER JOIN REP_EMPRESAS RE ON RE.ID = CONSOLIDADO.ID_EMPRESA

    INNER JOIN QUALIFICACOES_EMPRESAS_ANALITICOS ANALITICOS ON
    ANALITICOS.ID_QUALIFICACAO_EMPRESA_CONSOLIDADO = CONSOLIDADO.ID

    INNER JOIN QUALIFICACOES_PARAMETROS_EMPRESAS PARAMETROS ON
    PARAMETROS.ID = ANALITICOS.ID_QUALIFICACAO_PARAMETRO_EMPRESA

    WHERE
    ANALITICOS.DATA_VENCIMENTO <= (SYSDATE - 1)
) T

LEFT JOIN ( SELECT ID_EMPRESA, CAST(COLLECT(ID_CONTRATO) AS IDS_TYP) AS IDS_CONTRATOS FROM REP_INFO_CONTRATO_EMPRESAS GROUP BY ID_EMPRESA )
RICE ON  RICE.ID_EMPRESA = T.ID_EMPRESA

LEFT JOIN (SELECT ID FROM REP_CONTRATOS WHERE SITUACAO_CONTRATO = 'ATIVO')
RC ON RC.ID IN( (SELECT COLUMN_VALUE ID_ESTUDANTE FROM TABLE(RICE.IDS_CONTRATOS)) )

LEFT JOIN REP_LOCAIS_CONTRATO RLC ON RLC.ID_CONTRATO = RC.ID AND RLC.ID = T.ID_LOCAL_CONTRATO

LEFT JOIN REP_LOCAIS_ENDERECOS RLE ON RLE.ID_LOCAL_CONTRATO = RLC.ID

LEFT JOIN REP_ENDERECOS RE ON RE.ID = RLE.ID_ENDERECO

LEFT JOIN REP_CONFIGURACAO_CONTRATOS RCC ON RCC.ID = RC.ID

LEFT JOIN REP_CARTEIRAS RCART ON RCART.ID = RCC.ID_CARTEIRA

LEFT JOIN REP_UNIDADES_CIEE RU ON RU.ID = RCC.ID_UNIDADE_CIEE

LEFT JOIN REP_ASSISTENTES RA ON RA.ID = RCART.ID_ASSISTENTE

LEFT JOIN REP_PESSOAS RP ON RP.ID = RA.ID_PESSOA;