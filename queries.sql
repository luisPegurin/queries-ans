-- 10 operadoras que mais tiveram despesas no último trimestre
select o.razao_social, d.reg_ans, sum(d.VL_SALDO_FINAL)
	from demonstracoes_contabeis d
	inner join operadoras o on d.reg_ans = o.registro_ans
	where d.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
	    and d.data >= '2021-07-01'
	group by d.reg_ans, o.razao_social
	order by sum(d.VL_SALDO_FINAL) DESC
	limit 10;

-- 10 operadoras que mais tiveram despesas no último ano
select o.razao_social, d.reg_ans, sum(d.VL_SALDO_FINAL)
	from demonstracoes_contabeis d
	inner join operadoras o on d.reg_ans = o.registro_ans
	where d.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
	    and d.data >= '2020-07-01'
	group by d.reg_ans, o.razao_social
	order by sum(d.VL_SALDO_FINAL) DESC
	limit 10;

 