create table TRIAGENS_ESTUDANTES_FILTRO
(
    ID_ESTUDANTE           NUMBER(20)   not null,
    ENDERECO_GEOHASH       VARCHAR2(20) not null,
    CODIGO_CURSO_PRINCIPAL NUMBER(20)   not null,
    STATUS_ESCOLARIDADE    NUMBER(1)    not null,
    PONTUACAO_OBTIDA       NUMBER(3)    not null,
    PCD                    NUMBER(1)    not null,
    NIVEL_ENSINO           VARCHAR2(2)  not null,
    DATA_ALTERACAO         DATE         not null,
    constraint PK_TRIAGENS_ESTUDANTES_FILTRO
        primary key (ID_ESTUDANTE, ENDERECO_GEOHASH)
)
;

create index IDX_TRIAGENS_ESTUDANTES_FILTRO_APRENDIZ
    on TRIAGENS_ESTUDANTES_FILTRO (ENDERECO_GEOHASH asc, NIVEL_ENSINO asc, STATUS_ESCOLARIDADE asc, PCD desc,
                                   ID_ESTUDANTE asc)
;

create index IDX_TRIAGENS_ESTUDANTES_FILTRO_ESTUDANTE_DATA
    on TRIAGENS_ESTUDANTES_FILTRO (DATA_ALTERACAO asc, ENDERECO_GEOHASH asc, CODIGO_CURSO_PRINCIPAL asc,
                                   STATUS_ESCOLARIDADE asc, PONTUACAO_OBTIDA asc, PCD desc, ID_ESTUDANTE asc)
;

create index IDX_TRIAGENS_ESTUDANTES_FILTRO_APRENDIZ_DATA
    on TRIAGENS_ESTUDANTES_FILTRO (DATA_ALTERACAO asc, ENDERECO_GEOHASH asc, NIVEL_ENSINO asc, STATUS_ESCOLARIDADE asc,
                                   PCD desc, ID_ESTUDANTE asc)
;

create index IDX_TRIAGENS_ESTUDANTES_FILTRO_ESTUDANTE
    on TRIAGENS_ESTUDANTES_FILTRO (ENDERECO_GEOHASH asc, CODIGO_CURSO_PRINCIPAL asc, STATUS_ESCOLARIDADE asc,
                                   PONTUACAO_OBTIDA asc, PCD desc, ID_ESTUDANTE asc)
;
