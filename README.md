# queries-ans

Preparação:

Baixar as pastas '2020' e '2021' do link http://ftp.dadosabertos.ans.gov.br/FTP/PDA/demonstracoes_contabeis/ e descompactar os arquivos 'zip'

Usando Postgres 12.9:

Executar o script 'load.sql' para criar as tabelas e inserir os dados

	psql -d database -f load.sql

Executar o script 'queries.sql' 

	psql -d database -f queries.sql
