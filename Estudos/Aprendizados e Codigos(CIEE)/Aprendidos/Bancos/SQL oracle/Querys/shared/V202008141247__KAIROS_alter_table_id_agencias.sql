--alteracao de estrutura da tabela AGENCIAS
ALTER TABLE AGENCIAS ADD ID NUMBER(20);
UPDATE AGENCIAS SET ID=ID_AGENCIA;
ALTER TABLE AGENCIAS DROP PRIMARY KEY CASCADE;
ALTER TABLE AGENCIAS ADD CONSTRAINT KRS_INDICE_08340 PRIMARY KEY(ID);
CREATE SEQUENCE SEQ_AGENCIAS MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 100000 CACHE 20 ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL;
ALTER TABLE AGENCIAS ADD CONSTRAINT KRS_INDICE_01941 UNIQUE(ID_BANCO, ID_AGENCIA);
ALTER TABLE PRE_CONTRATOS_ESTUDANTES_EMPRESA ADD CONSTRAINT KRS_INDICE_01961 FOREIGN KEY (ID_AGENCIA) REFERENCES AGENCIAS (ID);
ALTER TABLE DADOS_PAGAMENTOS_CONTRATOS_ESTUDANTES_EMPRESAS ADD CONSTRAINT KRS_INDICE_07945 FOREIGN KEY (ID_AGENCIA) REFERENCES AGENCIAS (ID);
ALTER TABLE CONTRATOS_ESTUDANTES_EMPRESA ADD CONSTRAINT KRS_INDICE_01957 FOREIGN KEY (ID_AGENCIA) REFERENCES AGENCIAS (ID);