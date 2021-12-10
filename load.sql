DROP TABLE IF EXISTS demonstracoes_contabeis;
DROP TABLE IF EXISTS tmp;
DROP TABLE IF EXISTS operadoras;


CREATE TABLE operadoras (
    registro_ans int primary key,
    cnpj varchar(20),
    razao_social varchar(200),
    nome_fantasia varchar(100),
    modalidade varchar(100),
    logradouro varchar(200),
    numero varchar(50),
    complemento varchar(50),
    bairro varchar(50),
    cidade varchar(50),
    uf char(2),
    cep varchar(10),
    ddd char(2),
    telefone varchar(20),
    fax varchar(20),
    email varchar(50),
    representante varchar(50),
    cargo_representante varchar(50),
    regiao_de_comercializacao varchar(5),
    Data_Registro_ANS date
);

\copy operadoras from './Relatorio_cadop.csv' WITH (FORMAT CSV, HEADER, ENCODING windows1252, DELIMITER ';')

CREATE TABLE demonstracoes_contabeis (
	INDEX serial primary key,
    DATA date,
    REG_ANS int,
    CD_CONTA_CONTABIL int,
    DESCRICAO varchar(150),
    VL_SALDO_FINAL numeric(14,2)
);

CREATE TABLE IF NOT EXISTS tmp (
    DATA date,
    REG_ANS int,
    CD_CONTA_CONTABIL int,
    DESCRICAO varchar(150),
    VL_SALDO_FINAL text
);

\copy  tmp  FROM './2020/1T2020.csv' WITH (FORMAT CSV, HEADER, ENCODING 'WIN1252', DELIMITER ';') 
\copy  tmp  FROM './2020/2T2020.csv' WITH (FORMAT CSV, HEADER, ENCODING 'WIN1252', DELIMITER ';') 
\copy  tmp  FROM './2020/3T2020.csv' WITH (FORMAT CSV, HEADER, ENCODING 'WIN1252', DELIMITER ';') 
\copy  tmp  FROM './2020/4T2020.csv' WITH (FORMAT CSV, HEADER, ENCODING 'WIN1252', DELIMITER ';') 
\copy  tmp  FROM './2021/1T2021.csv' WITH (FORMAT CSV, HEADER, ENCODING 'WIN1252', DELIMITER ';') 
\copy  tmp  FROM './2021/2T2021.csv' WITH (FORMAT CSV, HEADER, ENCODING 'WIN1252', DELIMITER ';') 
\copy  tmp  FROM './2021/3T2021.csv' WITH (FORMAT CSV, HEADER, ENCODING 'WIN1252', DELIMITER ';') 

INSERT INTO  demonstracoes_contabeis  (data,REG_ANS,CD_CONTA_CONTABIL,DESCRICAO, VL_SALDO_FINAL)
	(SELECT
		data,REG_ANS,CD_CONTA_CONTABIL,DESCRICAO, cast(replace(VL_SALDO_FINAL,',','.') AS numeric) 
		FROM tmp);

DROP TABLE tmp;	