-- Banco de dados acesso para exemplo de conexão por login em PHP
-- Criado em 01/10/2020, author GILBERTO JUAREZ FARIAS ÁVILA
-- Será usado a Função MD5 () para geração de senha criptografada
-- MySQL MD5() Calcula um checksum MD5 de 128 bits para uma string. 
-- O valor é retornado como uma string binária de 32 dígitos hexadecimais ou NULL 
-- se o argumento for NULL. O valor de retorno pode, por exemplo, ser usado como uma chave hash.
-- Algumas metodologias de Funções de criptografia
SELECT MD5('123');  
SELECT OLD_PASSWORD('123');
SELECT SHA1('123');

-- Criar tabela USUÁRIOS--
Create table usuarios (
		ID Int UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
        nome Varchar(70),
        email Varchar(100),
		usuario Varchar(30),
		senha Varchar(40),
        data_geracao DATETIME Default NOW(),
		Primary Key (ID)) ENGINE = MyISAM;
        
-- Seleciona e exibe dados da tabela
select * from usuarios;  

-- povoando a tabela USUÁRIOS --
INSERT INTO usuarios 
			(nome, email, usuario, senha, data_geracao) 
	 values 
			('Cirlania Lindinha'     , 'lindinha@gmail.com'         , 'lane'          , md5('123'), now()),
            ('GILBERTO DA SILVA SAURO', 'gibadasilvasauro@gmail.com', 'Gilberto_Avila', md5('123'), now());




-- Exclusão da tabela
drop table usuarios;
        
        
-- Banco de dados e scripts para calculo de digito verificador CPF/CNPJ
-- Criado em 06/10/2020, author GILBERTO JUAREZ FARIAS ÁVILA
-- ver scripts Valida_dig-CNPJ e  Valida_dig-CPF --
        
-- Criar tabela CNPJ/CPF--        
create table tb_cpf_cnpj(
	ID Int UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	razaosocial Varchar(70),
    pes char(2) check (pes IN('J', 'F')),
	cpfcnpjraiz Varchar(12) null,
    dv Varchar(2) null,
    data_geracao DATETIME DEFAULT CURRENT_TIMESTAMP,
    Primary Key (ID)) ENGINE = MyISAM;
    
select * from tb_cpf_cnpj;  

SELECT NOW(), data_geracao FROM tb_cpf_cnpj;


select cast(data_geracao as date) from tb_cpf_cnpj;

-- povoando a tabela tb_cpf_cnpj ---
INSERT INTO tb_cpf_cnpj (razaosocial, cpfcnpjraiz, pes, data_geracao)
	values 
			('EMPRESA MODELO'                               , '114447770001', 'J', now()),
			('EMPRESA DISCRETA'                             , '728577290001', 'J', now()),
			('EMPRESA SUPER-DISCRETA'                       , '830238230001', 'J', now()),
			('EMPRESA MUITO-DISCRETA'                       , '230571470001', 'J', now()),
			('EMPRESA ALTAMENTE-DISCRETA'                   , '488943990001', 'J', now()),
			('EMPRESA POUCA-DISCRETA'                       , '187812030001', 'J', now()),
			('Giba Dinossauro Jurassico Triassico Cretaceo' , '875365982'   , 'F', now()),
            ('Matuzalem the oldest man in the world'        , '456753124'   , 'F', now());
            
/* para conferencia 
ID	PES	CNPJ			DV
1	J	114447770001	61
2	J	728577290001	90
3	J	830238230001	60
4	J	230571470001	13
5	J	488943990001	28
6	J	187812030001	28
7	F	875365982		11
8	F	456753124		80
*/
            
alter table tb_cpf_cnpj
ADD pes char(2) CHECK (pes IN ('F', 'J'));

drop table tb_cpf_cnpj;

SHOW TABLES;
   
