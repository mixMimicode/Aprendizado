-- Adiciona coluna id_legado para tabelas de migração via ETL
ALTER TABLE VAGAS_APRENDIZ ADD ID_LEGADO VARCHAR2(200 CHAR);  
ALTER TABLE TURMAS ADD ID_LEGADO VARCHAR2(200 CHAR);  
ALTER TABLE VAGA_APRENDIZ_RESERVA ADD ID_LEGADO VARCHAR2(200 CHAR);  
ALTER TABLE CONTRATOS_CURSOS_CAPACITACAO ADD ID_LEGADO VARCHAR2(200 CHAR);  
ALTER TABLE VAGAS_ESTAGIO ADD ID_LEGADO VARCHAR2(200 CHAR);  