-- cria réplica rep_indices_company

CREATE TABLE REP_MOTIVOS_BLOQUEIO_CONTRATOS_COMPANY (	
    ID NUMBER, 
	ID_CONTRATO NUMBER NOT NULL, 
	ID_MOTIVOS_BLOQUEIO NUMBER NOT NULL, 
	JUSTIFICATIVA_BLOQUEIO VARCHAR2(150 BYTE) NOT NULL, 
	JUSTIFICATIVA_DESBLOQUEIO VARCHAR2(150 BYTE), 
	DELETADO NUMBER(1,0), 
	RESPONSAVEL_BLOQUEIO VARCHAR2(150 CHAR),
	DATA_CRIACAO TIMESTAMP (6) NOT NULL, 
	DATA_ALTERACAO TIMESTAMP (6) NOT NULL, 
	CRIADO_POR VARCHAR2(255 CHAR), 
	MODIFICADO_POR VARCHAR2(255 CHAR)
);

ALTER TABLE REP_MOTIVOS_BLOQUEIO_CONTRATOS_COMPANY ADD CONSTRAINT krs_indice_10886 PRIMARY KEY ( id );
COMMENT ON TABLE REP_MOTIVOS_BLOQUEIO_CONTRATOS_COMPANY IS 'COMPANY_DEV:SERVICE_COMPANY_DEV:MOTIVOS_BLOQUEIO_CONTRATOS:id';