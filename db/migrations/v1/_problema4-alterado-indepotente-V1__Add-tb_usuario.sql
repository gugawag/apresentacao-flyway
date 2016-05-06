CREATE OR REPLACE FUNCTION fn_executa() RETURNS void AS $$
  DECLARE
    v_verifica_existencia smallint;

BEGIN

	IF  (fn_tabela_nao_existe('public', 'tb_usuario')) THEN
		create table tb_usuario(
		   cpf varchar(11)              not null,
		   nome    varchar(50)              not null			
		);
	END IF;	
END; $$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_tabela_nao_existe(nome_schema varchar, nome_tabela varchar) RETURNS boolean AS $$
  DECLARE
    var_table_exists smallint;

BEGIN
        SELECT 1 INTO var_table_exists
        FROM information_schema.TABLES
        WHERE table_schema = nome_schema
        AND table_name     = nome_tabela;
    
        return (var_table_exists is null);
END; $$
 LANGUAGE plpgsql;
 
SELECT fn_executa();
 
DROP FUNCTION fn_executa();
DROP FUNCTION fn_tabela_nao_existe(character varying, character varying);