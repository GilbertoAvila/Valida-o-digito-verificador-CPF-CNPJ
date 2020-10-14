/*
Validador do digíto verificador do CNPJ - Pessoa Jurídica
*/
UPDATE tb_cpf_cnpj 
set dv =(CONCAT(@dig1:=(
			SUBSTR(cpfcnpjraiz,   1,1) * 6 + 
			SUBSTR(cpfcnpjraiz,   2,1) * 7 + 
			SUBSTR(cpfcnpjraiz,   3,1) * 8 +  
			SUBSTR(cpfcnpjraiz,   4,1) * 9 + 
			SUBSTR(cpfcnpjraiz,   5,1) * 2 + 
			SUBSTR(cpfcnpjraiz,   6,1) * 3 +    
			SUBSTR(cpfcnpjraiz,   7,1) * 4 + 
			SUBSTR(cpfcnpjraiz,   8,1) * 5 + 
			SUBSTR(cpfcnpjraiz,   9,1) * 6 +   
			SUBSTR(cpfcnpjraiz,  10,1) * 7 + 
			SUBSTR(cpfcnpjraiz,  11,1) * 8 + 
			SUBSTR(cpfcnpjraiz,  12,1) * 9)  %11,
		(
			SUBSTR(cpfcnpjraiz,   1,1) * 5 +
			SUBSTR(cpfcnpjraiz,   2,1) * 6 + 
			SUBSTR(cpfcnpjraiz,   3,1) * 7 +  
			SUBSTR(cpfcnpjraiz,   4,1) * 8 + 
			SUBSTR(cpfcnpjraiz,   5,1) * 9 + 
			SUBSTR(cpfcnpjraiz,   6,1) * 2 +    
			SUBSTR(cpfcnpjraiz,   7,1) * 3 + 
			SUBSTR(cpfcnpjraiz,   8,1) * 4 + 
			SUBSTR(cpfcnpjraiz,   9,1) * 5 +   
			SUBSTR(cpfcnpjraiz,  10,1) * 6 + 
			SUBSTR(cpfcnpjraiz,  11,1) * 7 + 
			SUBSTR(cpfcnpjraiz,  12,1) * 8 + 
			@dig1 * 9) %11  %10
		))
		WHERE pes = 'J';
        
select * from tb_cpf_cnpj where pes = 'J';
