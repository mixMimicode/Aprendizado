ALTER TABLE REP_PARAMETROS_PROGRAMA_EST RENAME COLUMN DATA_PROCESSO_CSE TO DIA_PROCESSO_CSE;

-- Mês default = Fevereiro
ALTER TABLE REP_PARAMETROS_PROGRAMA_EST ADD MES_PROCESSO_CSE NUMBER(2) DEFAULT 2;

ALTER TABLE REP_LOCAIS_ENDERECOS ADD ENDERECO_PRINCIPAL NUMBER(1);