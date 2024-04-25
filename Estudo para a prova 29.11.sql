-- PDF AULA 04/10/23

-- 1. Liste todos os registros da tabela Medicos
	select * 
	from Medicos

-- 2. Liste o nome e especialidade de todos os m�dicos do hospital
	select nome, especialidade 
	from Medicos

-- 3. Liste o nome e idade dos m�dicos com mais 55 anos
	select nome, idade 
	from Medicos
	where idade > 55

-- 4. Liste o nome e idade dos m�dicos Ortopedistas com mais 55 anos
	select nome, idade 
	from Medicos
	where especialidade = 'Ortopedia' and idade > 55

-- 5. Liste as especialidades dispon�veis no hospital
	select distinct especialidade 
	from Medicos

------------------------------------------------------------------------

-- PDF AULTA 11/10/23

-- 1. Quais m�dicos tem a mesma especialidade do medico Daniel?
	select nome, especialidade 
	from Medicos
	where especialidade = ( select especialidade from medicos where nome = 'Daniel')

-- 2. Qual o nome do Ortopedista mais novo?
	select top(1) min(idade) as Idade, nome 
	from Medicos 
	where especialidade = 'Ortopedia'
	group by nome

-- 3. Quantos cardiologistas existem no hospital?
	select count(distinct nome) as Cardiologistas 
	from Medicos
	where especialidade = 'Cardiologia'

-- 4. Qual a capacidade de leitos do 5� andar?
	select sum(capacidade) as "Capacidade Leitos 5� Andar"
	from Ambulatorio
	where andar = 5

-- 5. Quais ambulat�rios n�o tem m�dicos alocados?
	select nroa, andar
	from ambulatorio a
	where not exists (select * from medicos m where a.nroa = m.nroa)

---------------------------------------------------------------------

-- PDF AULTA 18/10/23

-- 1. Quantos pacientes existem por doen�a?
	select Doen�a, count(*) as "Qtd Pacientes"
	from Pacientes
	group by doen�a	
	order by [Qtd Pacientes] DESC

-- 2. Listar m�dicos e especialidades em ordem crescente de especialidade;
	select nome, especialidade
	from medicos 
	order by especialidade

-- 3. Listar Pacientes e sua doen�a em ordem crescente de doen�a
	select Nome, Doen�a
	from Pacientes
	order by doen�a

-- 4. Listar quantidade de m�dicos por Especialidade
	select especialidade, count(*) as "Qtd M�dicos"
	from medicos
	group by especialidade
	order by [Qtd M�dicos]

-- 5. Quais especialidades tem mais de um m�dico?
	select especialidade, count(*) as "Qtd M�dicos"
	from medicos
	group by especialidade
	having (count(*) > 1 )
	order by [Qtd M�dicos]


-- 6. Quais doen�as aparecem mais de 3 vezes?
	select Doen�a, count(*) as "Qtd Pacientes"
	from Pacientes
	group by doen�a	
	having (count(*) > 3)
	order by [Qtd Pacientes] 

---------------------------------------------------------------------

-- PDF AULTA 25/10/23

-- 1. Listar o nome do medico, o andar e n�mero de ambulat�rio onde presta atendimento, 
-- ordenado por andar
	select m.Nome, a.Andar, a.nroa as Ambulat�rio
	from medicos m inner join Ambulatorio a on m.nroa = a.nroa
	order by a.andar

-- 2. Buscar o nome dos pacientes que t�m consulta marcada, com a respectiva data e hora, 
-- ordenado por data/hora
	select p.Nome,c.Data,c.hora
	from pacientes p inner join consultas c on p.codp = c.codp
	order by c.Data, C.hora

-- 3. Buscar o nome do m�dico, o nome do paciente e a data&hora da consulta ordenado por data/hora
	select m.Nome as NomeM�dico, c.Data, c.Hora, p.Nome as NomePaciente 
	from medicos m inner join consultas c on m.codm = c.codm inner join Pacientes p on p.codp = c.codp
	order by c.data, c.hora

-- 4. Buscar, para as consultas marcadas para o per�odo da manh� (7hs-12hs) do dia 07/10/2015,
-- o nome do m�dico, o nome do paciente e a data&hora da consulta
	select m.Nome as NomeM�dico, c.Data, c.Hora, p.Nome as NomePaciente 
	from medicos m inner join consultas c on m.codm = c.codm inner join Pacientes p on p.codp = c.codp
	where data = '07/10/2015' and hora between '07:00' and '12:00'
	order by c.data, c.hora

-- 5. Buscar, para as consultas marcadas para o per�odo da manh� (7hs-12hs) do dia 07/10/2015, 
-- o nome do m�dico, o nome do paciente e a data&hora da consulta 
-- e o ambulat�rio e respectivo andar onde ser� realizada a consulta
	select m.Nome as NomeM�dico, c.Data, c.Hora, p.Nome as NomePaciente, a.nroa as Ambulat�rio, a.Andar 
	from medicos m inner join consultas c on m.codm = c.codm inner join Pacientes p on p.codp = c.codp inner join Ambulatorio a on a.nroa = m.nroa
	where data = '07/10/2015' and hora between '07:00' and '12:00'
	order by c.data, c.hora

---------------------------------------------------------------------

-- PDF AULTA 08/11/23

-- 1. Listar TODOS os m�dicos e suas respectivas consultas, incluindo aqueles SEM consulta marcada
	select m.nome as NomeMedico, c.Data, c.Hora
	from medicos m left outer join consultas c on m.codm = c.codm

-- 2. Listar TODOS os Pacientes e suas respectivas consultas, incluindo aqueles SEM consulta marcada
	select p.nome as NomePaciente, c.Data, c.Hora
	from pacientes p left outer join consultas c on p.codp = c.codp
	
-- 3. Listar TODOS os m�dicos e TODOS os paciente e suas respectivas consultas, incluindo aqueles SEM consulta marcada
	select m.nome as NomeMedico, p.nome as NomePaciente, c.Data, c.Hora
	from medicos m full outer join consultas c on m.codm = c.codm full outer join pacientes p on p.codp = c.codp

-- 4. Listar TODOS os m�dicos e os ambulat�rios (incluindo o andar) onde atendem, inclusive aqueles que n�o tem ambulat�rio associado 
	select m.nome as NomeMedico, a.nroa as Ambulat�rio, a.Andar
	from medicos m left outer join Ambulatorio a on m.nroa = a.nroa


-- 5. Listar Todos os ambulat�rios incluindo o andar, inclusive aqueles vazios, isto �, que n�o tem m�dicos associados 
	select a.nroa as Ambulat�rio, a.Andar, m.nome as NomeMedico
	from Ambulatorio a left outer join medicos m on a.nroa = m.nroa

