--Select usando o Where para filtrar por nome
select a.*
  from Alunos a
  where a.NOME = 'Alvaro Queiroz'

--O <> junto com o where vai trazer todos, menos o Alvaro Queiroz
select a.*
  from Alunos a
  where a.NOME <> 'Alvaro Queiroz'

select A.* 
   from Alunos A
   WHERE a.data_nascimento >= '10/12/2000'

-- > Maior
-- < menor
-- >= maior ou igual
-- <= menor ou igual
-- <> diferente
-- = igual

select a.* 
  from Alunos a
  Where a.sexo = 'F'

select a.* 
  from Alunos a
  Where a.sexo = 'm'

--Filtrando duas informaçoes
select a.* 
  from Alunos A
  where a.sexo = 'M'
   and a.data_nascimento >= '01/01/2003'

select a.* 
  from Alunos A
  where a.sexo = 'M'
   and a.data_nascimento >= '01/01/2000'
   and a.id_aluno > 50

-- O comando year() vai trazer só o ano na filtragem
select a.NOME, a.sexo, year(a.data_nascimento) ano
   from Alunos a
   where a.data_nascimento >= '01/01/2000'

select * 
  from AlunosxTurmas

--Filtragem usando o AT para buscar varios dados de uma vez
 SELECT AT.* 
   FROM AlunosxTurmas AT
  WHERE AT.valor > 500

select AT.id_aluno, at.valor * at.valor_desconto as desconto
  from AlunosxTurmas at

select AT.id_aluno, at.valor * at.valor_desconto as desconto
  from AlunosxTurmas at
  where at.valor > 500

select at.valor * at.valor_desconto as desconto
  from AlunosxTurmas at
  where at.valor_desconto > 0
  and at.valor > 500

 -- O floor() vai Arrndondar as casas decomais
select floor(at.valor * at.valor_desconto) as desconto  
  from AlunosxTurmas at
  where at.valor_desconto > 0
  and at.valor > 500

--Extra

--Joins (Juntar ou Unir)
Select * 
  from AlunosxTurmas at, turmas t, cursos c
  where at.id_turma =t.id_turma
  and t.id_curso = c.id_curso

Select c.nome_curso, t.data_inicio, t.data_termino,
       at.valor, (at.valor * at.valor_desconto) as desconto,
	   at.valor - (at.valor * at.valor_desconto)
  from AlunosxTurmas at, turmas t, cursos c
  where at.id_turma =t.id_turma
  and t.id_curso = c.id_curso

Select c.nome_curso, t.data_inicio, t.data_termino,
       floor(at.valor) as "Valor Bruto", floor((at.valor * at.valor_desconto)) as desconto,
	   floor(at.valor) - floor((at.valor * at.valor_desconto)) "Valor Liquito"
  from AlunosxTurmas at, turmas t, cursos c
  where at.id_turma =t.id_turma
  and t.id_curso = c.id_curso
  and t.id_turma = 6;

-- Estrutura de uma consulta
 /*
SELECT
  FROM 
 wHERE
 */

 --Joins (Juntar ou Unir)
 --Total de Turmas por Curso 
 -- INNER JOIN "Unir"
 select c.id_curso, c.nome_curso, count(t.id_turma) "Total de Turmas"
   from dbo.Turmas t 
        inner join dbo.Cursos c on c.id_curso = t.id_curso
  group by c.id_curso, c.nome_curso --group by é um agrupamento 

--Todos os cursos, independente se há ou não turmas
--Padrão de escrita SQL ANSI
--right join
select c.nome_curso, count(t.id_turma) "Total de Turmas"
  from dbo.Turmas t
        right join dbo.Cursos c on c.id_curso = t.id_curso
  group by c.nome_curso
  
--CUIDADO SE NÃO FIZER A LIGAÇÃO DOS DADOS
select c.*
  from dbo.Turmas t,
       dbo.Cursos c

select c.nome_curso, count(t.id_turma)
  from dbo.Turmas t,
       dbo.Cursos c 
 where c.id_curso = t.id_curso 
 group by c.nome_curso 

--Lista completa de alunos
select c.nome_curso, at.valor, at.valor_desconto, t.data_inicio, t.data_termino,
       a.nome, a.sexo
 from AlunosxTurmas at
      inner join dbo.Turmas t on t.id_turma = at.id_turma
	  inner join dbo.Cursos c on c.id_curso = t.id_curso
	  inner join dbo.Alunos a on a.id_aluno = at.id_aluno

--Quantidade de Turmas com alunos
select c.nome_curso, t.id_turma, count(1) "Total de Alunos"
  from dbo.Turmas T
       inner join AlunosxTurmas at on at.id_turma = t.id_turma
	   inner join Cursos c on c.id_curso = t.id_curso
group by c.nome_curso, t.id_turma

--__________Aula 13__________

--soma
select 1 + 2 as "Resultado da soma"
SELECT 9998 + 998.5 + 1548.5 "Resultado da soma"

--subtração
select 233 - (78.99 + 333) R

--Divisão
select 50 / 2 as Resultado
select 49 / 2 as resultado --se fizer assim o resultado será arredendoda
select 49.0 / 2 as Resultado --correto

--Multiplicação
select 50 * 2 as Resultado
select 50.88 * 2 as resultado

--Potenciação
select square(7) as Resultado --Quadrado de um numero (ele x ele mesmo)

select power(3, 3) as Resultado -- 3^3
select power(2, 8) as Resultado -- 2^8

--Pocertagem
select 100 * 1.1 as Resultado          -- 1 / 10
select 100 + (100 * 0.1) as Resultado  -- 1 / 10
select 100 * 0.01 as Resultado         -- 1 / 100

--ABS
select abs(100-999) as Resultado
select abs(-100) as Resultado

--Raiz quadrada 
select sqrt(49) as Resultado
select sqrt(7) as Resultado

--PI
select pi() as Resultado

--Data Atual
select getdate() as Resultado

--Signal
select sign(10) as resultado 
select sign(-10) as resultado
select sign(null) as resultado
select sign(0) as resultado

--Soma
select sum(1.500 + 7777) as Resultado

--__________Aula 14__________

--Total de turmas por cursos
select c.id_curso, c.nome_curso, count(t.id_turma) as "Total de Turma"
  from dbo.Turmas t
       inner join dbo.cursos c on c.id_curso = t.id_curso
group by c.id_curso, c.nome_curso;

--Tirar a prova da quantidade de turmas por curso
select *
  from dbo.Turmas
  where id_curso = 1; --VBA

select *
  from dbo.Turmas
where id_curso = 5; --Excel Intermediário

--Utilizar a cláusula IN 
select * 
  from dbo.Turmas
  where id_curso in (1, 5);

--Utilizar a cláusula NOT IN 
select * 
  from dbo.Turmas
  where id_curso not in (1, 5);

--Ano de nascimento dos alunos
select DISTINCT DATEPART(YEAR, data_nascimento)
  from dbo.Alunos
 order by 1 ASC --Classificação de forma crescente

select DISTINCT DATEPART(YEAR, data_nascimento)
  from dbo.Alunos
 order by 1 DESC --Decrescente 

--Lista completa de alunos
Select c.id_curso,
       c.nome_curso,      
	   at.valor,
	   at.valor_desconto,
	   t.data_inicio,
	   t.data_termino,
	   a.nome,
	   a.sexo
 from AlunosxTurmas at
      inner join dbo.Turmas t on (t.id_turma = at.id_turma)
	  inner join dbo.Cursos c on (c.id_curso = t.id_curso)
	  inner join dbo.Alunos a on (a.id_aluno = at.id_aluno)
WHERE a.sexo = 'm'  
order by 2, A.sexo;

--__________Aula 15__________

--Operações de agregação no select

--Ganho por cada Turma
--1ª Quanto paga cada aluno

select c.nome_curso, t.id_turma, at.valor "Valor Bruto",
       at.valor * at.valor_desconto "Valor Desconto",
	   at.valor - (at.valor * at.valor_desconto) "Valor Liquido"
  from Turmas t
       inner join AlunosxTurmas at on at.id_turma = t.id_turma
	   inner join Cursos c on c.id_curso = t.id_curso

--2ª Somatório
select c.nome_curso, sum(at.valor) "Valor Bruto",
       sum(at.valor * at.valor_desconto) "Valor Desconto",
	   sum(at.valor - (at.valor * at.valor_desconto)) "Valor Liquido"
  from Turmas t
       inner join AlunosxTurmas at on at.id_turma = t.id_turma
	   inner join Cursos c on c.id_curso = t.id_curso
group by c.nome_curso

--3ª Somatório por curso x turma
select c.nome_curso, t.id_turma, sum(at.valor) "Valor Bruto",
       sum(at.valor * at.valor_desconto) "Valor Desconto",
	   sum(at.valor - (at.valor * at.valor_desconto)) "Valor Liquido"
  from Turmas t
       inner join AlunosxTurmas at on at.id_turma = t.id_turma
	   inner join Cursos c on c.id_curso = t.id_curso
group by c.nome_curso, t.id_turma

--4ª Arredondamento dos valores
select c.nome_curso, t.id_turma, sum(at.valor) "Valor Bruto",
       round(sum(at.valor * at.valor_desconto), 2) "Valor Desconto",
	   round(sum(at.valor - (at.valor * at.valor_desconto)), 2) "Valor Liquido"
  from Turmas t
       inner join AlunosxTurmas at on at.id_turma = t.id_turma
	   inner join Cursos c on c.id_curso = t.id_curso
group by c.nome_curso, t.id_turma

--5ª Ganhos por ano
select YEAR(t.data_inicio) Ano,
       sum(at.valor) "Valor Bruto",
       round(sum(at.valor * at.valor_desconto), 2) "Valor Desconto",
	   round(sum(at.valor - (at.valor * at.valor_desconto)), 2) "Valor Liquido"
  from Turmas t
       inner join AlunosxTurmas at on at.id_turma = t.id_turma
	   inner join Cursos c on c.id_curso = t.id_curso
group by YEAR(t.data_inicio)

--__________Aula 16__________
    --Funções de agregação

select * from AlunosxTurmas

--Somando os valores de todas as turmas
select sum(Valor) as "Total" from AlunosxTurmas

select t.id_turma, sum(at.Valor) as "Total" 
  from AlunosxTurmas at
       inner join dbo.Turmas t on t.id_turma = at.id_turma
group by t.id_turma

select t.id_turma, c.nome_curso, sum(at.Valor) as "Total" 
  from AlunosxTurmas at
       inner join dbo.Turmas t on t.id_turma = at.id_turma
	   inner join dbo.Cursos c on c.id_curso = t.id_curso
group by t.id_turma, c.nome_curso

--Subquery
select sum(v.total) from (
                           select t.id_turma, c.nome_curso, sum(at.Valor) as "Total" 
                             from AlunosxTurmas at
                                inner join dbo.Turmas t on t.id_turma = at.id_turma
	                            inner join dbo.Cursos c on c.id_curso = t.id_curso
                           group by t.id_turma, c.nome_curso 
						  ) v

--COUNT
select t.id_turma, COUNT(at.id_aluno) as "Total de alunos", SUM(AT.valor) "Valor total"
  from AlunosxTurmas at
       inner join dbo.Turmas t on t.id_turma = at.id_turma
group by t.id_turma
 
select t.id_turma, COUNT(1) as "Total de alunos"
  from AlunosxTurmas at
       inner join dbo.Turmas t on t.id_turma = at.id_turma
group by t.id_turma
 
--average / avg (MÉDIA)
select t.id_turma, c.nome_curso, avg(at.Valor) as "Total" 
  from AlunosxTurmas at
       inner join dbo.Turmas t on t.id_turma = at.id_turma
	   inner join dbo.Cursos c on c.id_curso = t.id_curso
group by t.id_turma, c.nome_curso

--Max
select t.id_turma, c.nome_curso, Max(at.Valor) as "Total" 
  from AlunosxTurmas at
       inner join dbo.Turmas t on t.id_turma = at.id_turma
	   inner join dbo.Cursos c on c.id_curso = t.id_curso
group by t.id_turma, c.nome_curso

--Min
select t.id_turma, c.nome_curso, Min(at.Valor) as "Minimo", Max(at.Valor) as "Maximo"  
  from AlunosxTurmas at
       inner join dbo.Turmas t on t.id_turma = at.id_turma
	   inner join dbo.Cursos c on c.id_curso = t.id_curso
group by t.id_turma, c.nome_curso

--Diferença
select t.id_turma, c.nome_curso, Min(at.Valor) as "Minimo", Max(at.Valor) as "Maximo",
       Max(at.valor) - Min(at.valor) as "Diferença"
  from AlunosxTurmas at
       inner join dbo.Turmas t on t.id_turma = at.id_turma
	   inner join dbo.Cursos c on c.id_curso = t.id_curso
group by t.id_turma, c.nome_curso

--__________Aula 17__________   
--Datetime       - a partir de 01/01/1753 - armazena até centésimos de segundos
--SmallDateTime  - a partir de 01/01/1900 - armazena até segundos

--Funções de Data: GetDate, DatePart, DateAdd e DateDiff
                   --unidades: year, month, day

--GETDATE()
select getdate() "Data e Hora"; --Data e hora

select convert(char, getdate(), 103) AS "Data"; -- Formato dd/mm/yyyy (dia, mes e ano)

select convert(char, getdate(), 103) AS "Data"; -- Formato aa.mm.dd (anos, mes e dia)

select convert(char, getdate(), 13) AS "Data"; --Tabela ANSI SQL

select day(getdate()) as Dias --Dia atual
select day('19/06/1996') as Dias --Dia atual

select month(getdate()) as Mês; --Mês atual
select month('19/06/1996') as Mês;

select year(getdate()) as Ano; --Ano atual
select YEAR('19/06/1996') as Ano; --Dessa forma ele tbm extrai o ano

--DATEPART
select DATEPART(year, getdate());  --Ano
select DATEPART(month, getdate()); --Mês
select DATEPART(day, getdate());   --Dia

select DATEPART(year, '19/06/1996');

select datepart(year, data_nascimento) as ano from dbo.Alunos
select distinct datepart(year, data_nascimento) as ano from dbo.Alunos;
select distinct datepart(year, data_nascimento) as ano from dbo.Alunos order by 1;

--DATEADD
select dateadd(year, -2, getdate()); --subtrai dois anos da data atual
select convert(date, dateadd(year, -2, getdate()));  

select dateadd(month, 3, getdate()); --soma 3 meses a data atual
select convert(date, dateadd(month, 3, getdate())); 

select dateadd(day, 28, getdate()); --soma 28 dias a data atual
select convert(date, dateadd(day, 28, getdate())); 

select dateadd(hour, 3, getdate()); --soma 3 horas a data atual
select convert(datetime, dateadd(hour, 3, getdate())); 
select convert(smalldatetime, dateadd(hour, 3, getdate())); 

select convert(datetime, dateadd(hour, 3, getdate())) as DateT,
       convert(smalldatetime, dateadd(hour, 3, getdate())) AS SmallD;

--DATEDIFF
select datediff(year, getdate(), dateadd(year, 4, getdate())) as  Anos;
select datediff(month, getdate(), dateadd(year, 2, getdate())) as Meses;
select datediff(day, getdate(), dateadd(year, 3, getdate())) as Dias;

select dateadd(year, 3, getdate());

select datediff(hour, '19/06/1996', getdate()) as "Horas de vida";
select datediff(minute, '19/06/1996', getdate()) as "Minutos de vida";
select datediff(second, '19/06/1996', getdate()) as "Segundos de vida";

--__________Aula 18__________  
--FUNÇÃO DE TEXTO NO SQL SERVER - Parte 01
--Funçôes: ASCII, NCHAR, CHAR, CHARINDEX, CONCAT, CONCAT_WS, DIFFERENCE

--ASCII (retorna o codigo numerico referente ao caractere que está sendo utilizado)
select ascii('a');
select ascii('A');
select ascii('9');
select ascii('Alessandro');

--NCHAR (Converte um código Ascii do tipo int em um valor de carater)
select nchar(65);
select nchar(97);
select nchar(57);

--CHAR (Converte um código Ascii do tipo int em um valor de carater)
select char(65);
select char(97);

--CHARINDEX (pesquisa um caractere em uma sequencia de até 8.000 caracteres)
select charindex('a', 'Messias');
select charindex('a', 'Messias', 7);
select charindex('Messias', 'Jose c. Messias');

select * from alunos;

select a.nome, charindex('Bruna', a.nome, 1)
  from Alunos a;

select a.nome, charindex('bruna', a.nome, 1)
  from Alunos a
 where convert(int, charindex('Bruna', a.nome, 1)) > 0;

select a.nome, charindex('Bruna', a.nome, 1)
  from Alunos a
 where charindex('bruna', a.nome, 1) <> '0';

--CONCAT (concatena nomes)
select concat('Jose',' ', 'Messias');
select concat('Jose', ' || ', 'Messias');

select 'Jose' + ' ' + ' Messias';

select concat(a.nome, ' - ', c.nome_curso) "Nome do aluno - Curso"
  from alunos a
       inner join AlunosxTurmas at on at.id_aluno = a.id_aluno
	   inner join Turmas t on t.id_turma = at.id_turma
	   inner join Cursos c on c.id_curso = t.id_curso;

--CONCAT_WS
select concat_ws(' - ', 'Messias', 'Jose', 'C.');

select concat_ws(' - ', a.nome, c.nome_curso,
                 'Início : ' + convert(char, t.data_inicio),
				 'Término : ' + convert(char, t.data_termino))
  from Alunos a
       inner join AlunosxTurmas at on at.id_aluno = a.id_aluno
	   inner join Turmas t on t.id_turma = at.id_turma
	   inner join Cursos c on c.id_curso = t.id_curso;

--Trim (Elimina os espaçamenos desnecessários)
select concat_ws(' - ', a.nome, c.nome_curso,
                 'Início : ' + trim(convert(char, t.data_inicio)),
				 'Término : ' + trim(convert(char, t.data_termino)))
  from Alunos a
       inner join AlunosxTurmas at on at.id_aluno = a.id_aluno
	   inner join Turmas t on t.id_turma = at.id_turma
	   inner join Cursos c on c.id_curso = t.id_curso;

--DIFFERENCE (escala de 0 a 4 de similaridade)
select DIFFERENCE('Messias', 'Messias');
select DIFFERENCE('Messias', 'Mess');
select DIFFERENCE('Messias', 'Sias');
select DIFFERENCE('Messias', 'Excel');
select DIFFERENCE('Messias', 'Youtube');
select DIFFERENCE('Messias', 'Caderno');

--__________Aula 19__________  
--FUNÇÃO DE TEXTO NO SQL SERVER - Parte 02
--FUNÇÔES FORMAT, LEFT, RIGHT, LEN, LOWER e UPPER
--Comentario em bloco

--FORMAT
--Retorna um valor formatado e a cultura opcional (especificar)
--Para dados dos tipos gerais usar CAST ou CONVERT

--select convert(char, getdate(), 103);

--declare @dt DATETIME = getdate();

--select format(@dt, 'd', 'en-US') as Americano,
--       format(@dt, 'd', 'zh-cn') as Chine_Simplificado,
--	   format(@dt, 'd', 'de-de') as Alemão,
--	   format(@dt, 'D', 'en-US') as Americano,
--	   format(@dt, 'D', 'zh-cn') as Chines_Simplificado,
--	   format(@dt, 'D', 'de-de') as Alemão;


declare @dt DATETIME = getdate();

select format(1001500, '##-####-##') as cod_prod;

select format(at.valor, 'N', 'en-US') Formato_Americano,
       format(at.valor, 'G', 'en-US') Formato_Geral,
	   format(at.valor, 'C', 'pt-BR') Formato_Monetario_BR,
	   format(at.valor, 'C', 'en-US') Formato_Monetario_US,
	   format(at.valor, 'C', 'de-de') Formato_Monetario_AL,
	   format(at.valor, 'C', 'de-de') Formato_Monetario_AUS
  from AlunosxTurmas at

--LEFT
--Extrai carcateres a esquerda de um texto ou campo
select left('Jose Messias', 4); 
select left('Este é um curso de SQL Server', 22);

select distinct left(a.nome, 5)
  from Alunos a;

--RIGHT
--Extrai caracateres a direita de um texto
select right('Jose Messias', 7);
select right('Este é um curso de SQL Server', 11);

select right(a.nome, 5)
  from Alunos a;

select right(a.nome, 5) + right(a.nome, 5)
  from Alunos a;

--LEN
--Retorna o tamnho do campo
select len('Jose Messias');
select len('Este é um curso de SQL Server');

select a.nome, len(a.nome) Tamanho
  from Alunos a;

select max(len(a.nome)) as Maior_nome
  from Alunos a;

select min(len(a.nome)) as Menor_nome
  from Alunos a;

--UPPER
--Converte os caracteres para maiúsculo
select upper('Jose Messias');

select upper(a.nome) Nome_Aluno
  from Alunos a;

--LOWER
--Converte os caracteres para minúsculo
select lower('JOSE MESSIas');

select lower(a.nome) Nome_Aluno
  from Alunos a;

--__________Aula 20__________  
--FUNÇÃO DE TEXTO NO SQL SERVER - Parte 03
--FUNÇÔES: LTRIM, RTRIM, PATINDEX, REPLACE, REPLICATE e REVERSE

--LTRIM (retira os espaços desnecessarios da esquerda)
select ltrim('          Messias');
select ltrim('x          Messias'); --N funciona

declare @varText varchar(50);
    set @varText = '        Este é um textp para teste do LTRIM';

	select ltrim(@varText) as Teste;
	select resultado = ltrim(@varText);

--RTRIM (retira os espaços desnecessarios da direita)
select rtrim('Messias    ');

select len('Messias    ');
select len(rtrim('Messias    '));

declare @varTexto2 varchar(50);
    set @varTexto2 = 'Este é um texto para teste dp RTRIM     ';

select rtrim(@varTexto2);

--Funão PATINDEX
--Retorna a posição inicial da primeira ocorrência de um padrão

select patindex('%ss%', 'Jose Messias');
select patindex('%a%', 'Messias');
select patindex('%a%', 'Terça');

select posicao = patindex('%i%', 'Terça feira');
select posicao = patindex('%ça_fei%','Terça feira');

declare @varTexto3 varchar(100);
    set @varTexto3 = 'Aqui é canal do Alessandro Trovato no YouTube';

--SUBSTRING (Procura os cacteres desejados)
select substring(@varTexto3, 1, 7);
select substring(@varTexto3, patindex('%Trovato%', @varTexto3), 7);
select patindex('%Trovato%', @varTexto3)

--REPLACE (Fazer a substituição de cacteres)
select replace('Jose Messias','a','@a');
select replace(replace('Jose Messias','a','@'),'s','5');
select replace(replace(replace('Jose Messias','a','@'),'s','5'),'e','p');
--A função REPLACE não da muito certo em colunas
--Ex:
select a.nome, a.data_nascimento, replace(a.sexo,'M', 'Masculino') sexo
  from Alunos a;

--Funciona bem com cpf
declare @cpf varchar(15);
    set @cpf = '555.222.333-44';

select replace(replace(@cpf,'.',''),'-','');

--REPLICATE (Replicar)
select replicate('x', 20); --(O 'x' 20 vezes)

--Tamanho de colunas fixo em 50 posições
--Passo 1
select * from Alunos;
select len(nome) from Alunos

--Passo 2
select nome + replicate('x', 50 - len(nome))
  from alunos;

--Passo 3
select len(nome + replicate('x', 50 - len(nome))) as Tamanho
  from alunos;

select nome + replicate('x', 50 - len(nome))
  from alunos;

--REVERSE (inverte os nomes)
select reverse('Jose Messias');
select reverse(nome) from Alunos;

--__________Aula 20__________  
--FUNÇÃO DE TEXTO NO SQL SERVER - Parte 04
--FUNÇÔES: STRING_AGG, SPACE e STUFF

--SPACE (Gera um conjunto de espaços)
select 'Messias' + space(25);
select 'Messias' + space(25) + 'x';

declare @vNome varchar(50);
    set @vNome = 'jose Messias';
 select @vNome + space(50 - len(@vNome));

select a.nome + space(60 - len(a.nome)) + a.sexo
   from Alunos a;

select a.nome + space(60 - len(a.nome)) + a.sexo, len(nome + space(60 - len(a.NOME)) + a.sexo)
   from Alunos a;

--Porque o resultado da query acima tem o tamanho de 61 caracteres?

--STRING_AGG
--Concatena os valores das expressões de cadeia de caracteres e 
--coloca os valores do separador entre eles.
--O separador não é adicionado ao final da cadeia de caracteres.
--OBS: Os valores Nulls não são exibidos. 

select string_agg(convert(nvarchar(max), sexo),',') as registros
  from alunos;

select string_agg(convert(nvarchar(max), isnull(sexo,'N')), '-') as registros
  from alunos;

select datepart(year, data_nascimento) as ano,
       string_agg(convert(nvarchar(max), isnull(sexo,'0')),'-') as registros
  from Alunos
group by datepart(year, data_nascimento)
order by 1;

--within
select datepart(year, data_nascimento) as ano,
       string_agg(convert(nvarchar(max), isnull(sexo,'0')),'-')
	     within group (order by datepart(year, data_nascimento) asc) as registros
  from Alunos
group by datepart(year, data_nascimento)

--STUFF 
--Subistitui um conjunto de caracteres em uma determinada posição
select stuff('abcdefghi',3,5,'12345');

declare @vProcura varchar(50);
declare @vsubstit varchar(30);
    set @vProcura = 'Eu, xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
	set @vSubstit = 'Jose Messias';

select stuff(@vProcura,5,30,@vsubstit + space(30 - len(@vsubstit)));
select stuff(@vProcura,5,30,trim(@vsubstit + space(30 - len(@vSubstit)))) as termo;

--__________Aula 21__________  
--FUNÇÃO DE TEXTO NO SQL SERVER - Parte 05
--FUNÇÔES: SUBSTRING, TRANSLATE, UPPER, TRIM
--EXTRAS: CASE, IIF, WHILE, REPLACE

--SUBSTRING
select substring('Jose Messias', 1, 4) as Nome;

select a.nome, SUBSTRING(a.nome, 1, 20) "Nome parcial"
  from Alunos a;

--Dois primeiros nomes
--CASE / WHEN
select a.nome,
       case SUBSTRING(a.nome, 1, CHARINDEX(' ', a.nome, charindex('', a.nome)+1))
	        when '' then
	             a.nome
	        else
	             SUBSTRING(a.nome, 1, CHARINDEX(' ', a.nome, charindex('', a.nome)+1))
	   end as "Nome Extraido"
  from Alunos a;

--IIF
select a.nome,
       iif(substring(a.nome, 1, charindex(' ', a.nome, charindex(' ', a.nome) +1)) = '',
	       a.nome,
		   substring(a.nome, 1, charindex(' ', a.nome, charindex(' ', a.nome) +1)))
  from Alunos a;

--TRANSLATE
select translate('2*[3+2]/{7-2}','[]{}','()()');
select translate('abcdefghi','abc','123');
--Pode usar o REPLACE também, porém, o translate é mais performatico.

--TRIMM
select trim('Jose Messias');
select trim('    Jose   Messias     ');
select trim('      SQL     SERVER    |');

--WHILE
declare @vString varchar(100);
    set @vString = 'SQL       Server   |';

  while charindex(' ', @vString) > 0
  begin
        set @vString = replace(@vString, ' ', ' ')
  end

  select @vString;

--UPPER / LOWER
select a.nome, upper(a.nome) as Maiúsculo, lower(a.nome) as minúsculo
  from Alunos a;

--__________Aula 22__________  
  --Banco AdventureWorkS
  -- Mesmo número de colunas
  -- O Uso do null pra contornar limitação
  -- Nome das coluna sera o primeiro select
  -- Executar um distinct quando utilizado

select * from dimproduct;

select p.EnglishProductName, p.SafetyStockLevel, p.DaysToManufacture, p.class, p.color
  from dimproduct P

select p.EnglishProductName, p.SafetyStockLevel, p.DaysToManufacture, p.class, p.color
  from dimproduct P
 Where p.color = 'NA'

union --Junta um select com outro select.

select p.EnglishProductName, p.SafetyStonckLevel, p.DaysToManufacture, p.class, p.color
  from dimproduct P
 where p.comor <> 'NA'

--IGNORAR ESSA LIMITAÇÃO

select p.EnglishProductName, p.SafetyStockLevel, p.DaysToManufacture, NULL, NULL
  from dimproduct P
 Where p.color = 'NA'

union 

select p.EnglishProductName, p.SafetyStockLevel, p.DaysToManufacture, p.class, p.color
  from dimproduct P
 where p.Color <> 'NA'

--ORDEM DOS CAMPOS

select p.SafetyStockLevel /*<--AQUI*/, p.EnglishProductName, p.DaysToManufacture, NULL, NULL
  from dimproduct P
 Where p.color = 'NA'

union 

select p.EnglishProductName /*<--AQUI*/, p.SafetyStockLevel, p.DaysToManufacture, p.class, p.color
  from dimproduct P
 where p.Color <> 'NA'

--ALIAS PARA COLUNAS
select p.EnglishProductName, p.SafetyStockLevel, p.DaysToManufacture, p.Class, p.Color
  from dimproduct p
 where color = 'NA'
   and Class is not null

union

select p.EnglishProductName, p.SafetyStockLevel, p.DaysToManufacture, p.Class, p.Color
  from dimproduct p 
 where color = 'Black'
   and Class = 'L'

--Para nomear tem que ser no primeiro select
select p.EnglishProductName as "Produto nome", 
       p.SafetyStockLevel as "Estoque seguro", 
	   p.DaysToManufacture as "Dias de produção", 
	   p.Class as "Classe", 
	   p.Color as "Cor"
  from dimproduct p
 where color = 'NA'
   and Class is not null

union

select p.EnglishProductName, p.SafetyStockLevel, p.DaysToManufacture, p.Class, p.Color
  from dimproduct p 
 where color = 'Black'
   and Class = 'L'

--UNION (DISTINCT) / UNION ALL (TODOS OS REGISTROS)
select EnglishProductName, Class, Color
  from dimproduct 

union

select EnglishProductName, Class, Color
  from dimproduct 

 order by 1;

 --Uniu duas tableas
 select EnglishProductName, Class, Color
  from dimproduct 

union all

select EnglishProductName, Class, Color
  from dimproduct 

 order by 1;

--__________Aula 23__________  
  --Banco AdventureWorkS
  -- O que são sequences
  -- Como cria-las
  -- Alterar sequences
  -- Apagar sequences

select * from Alunos;

select max(id_aluno) from Alunos; -- Para obter o maximo da coluna
select max(id_aluno) + 1 from Alunos; 

--SEQUENCES

CREATE SEQUENCE seq_Teste01;

SELECT NEXT VALUE FOR seq_Teste01;

--TIPOS DE INCREMENTO
-- tinynt - intervalo de 0 a 255
-- smallint - intervalo de -32.768. a 32.767
-- int - intervalo de -2.147.483.648 a 2.147.483.647
/* bigint - intervalo de  -9.223.372.036.854.775.808 a 9.223.372.036.854.775.807 
** PADRÃO decimal e numeric com uma escla de 0.*/

CREATE SEQUENCE seq_Teste02
     AS NUMERIC
	 START WITH 1
	 INCREMENT BY 1;

SELECT NEXT VALUE FOR seq_Teste02 "Valores"; -- sempre vai incrementando +1

--AS SEQUENCES PODEM SER TAMBÉM MANIPULADAS NEGATIVAMENTE
CREATE SEQUENCE seq_Teste03
     START WITH 100
	 INCREMENT BY 1;

SELECT NEXT VALUE FOR seq_Teste03;

--APAGAR SEQUENCES 
DROP SEQUENCE seq_Teste04;

--VALORES MÍNIMOS E MÁXIMOS
CREATE SEQUENCE seq_Teste04
    START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 1000 --Quando chegar no 5 ele volta para 1
	CYCLE
	CACHE 3;

SELECT NEXT VALUE FOR seq_Teste04;

--ALTERAR UMA SEQUENCE
ALTER SEQUENCE seq_Teste04
    RESTART WITH 100
	MAXVALUE 10000
	NO CACHE;

SELECT NEXT VALUE FOR seq_Teste04;

-- CONSULTAR SEQUENCE
select last_used_value from sys.sequences where name = 'seq_Teste04';
select * from sys.sequences

--APAGAR SEQUENCES 
DROP SEQUENCE seq_Teste04;

--REINICIAR UMA SEQUENCE
ALTER SEQUENCE seq_Teste04 RESTART WITH 100;

SELECT NEXT VALUE FOR seq_Teste04;

--Teste para aluns

DECLARE @vIDAluno01 int;
    SET @vIDAluno01 = NEXT VALUE FOR seq_Teste04;

select @vIDAluno01;

---------------------------

DECLARE @vIDAluno int;
    SET @vIDAluno = NEXT VALUE FOR seq_Teste04;

	insert ...
	@vIDAluno;

--__________Aula 24__________ 
--INSERT em tabelas
  -- Insert com descrição dos campos
  -- Insert para uma nova tabela
  -- Insert com select

select * from alunos;
select max(id_aluno) from alunos;
select max(id_aluno) +1 from alunos;

CREATE SEQUENCE seq_tbAlunos
    START WITH 102
	INCREMENT BY 1;

select next value for seq_tbAlunos;

DROP SEQUENCE seq_tbAlunos;

--Identificar campos em tabelas
exec sp_columns Alunos;

---------------------------------
--INSERT com a descrição dos campos
--Exemplo 1

INSERT INTO dbo.Alunos
       (id_aluno, nome, data_nascimento, sexo, data_cadastro, login_cadastro)
VALUES
       (NEXT VALUE FOR dbo.seq_tbAlunos,'Jose C Messias', '11/11/1996',
	   'M', getdate(), 'MESS');

SELECT *
  FROM Alunos
 WHERE data_cadastro >= CONVERT(DATE, GETDATE());

--Exemplo 2 
EXEC SP_COLUMNS CURSOS;

SELECT * FROM Cursos;

INSERT INTO Cursos
     (id_curso, nome_curso, data_cadastro, login_cadastro)
VALUES
     (12, 'VBA Avançado I', getdate(), 'MESS');

--Exemplo 3
SELECT * FROM Cursos;

DECLARE @vID int;
SELECT @vID = max(id_curso) +1 from dbo.Cursos;

INSERT INTO Cursos 
       (id_curso, nome_curso, data_cadastro, login_cadastro)
VALUES 
       (@vID, 'VBA Avançado II', getdate(), 'MESS');

--INSERT com a criação de uma nova tabela
SELECT *
   INTO dbo.tbNova
   FROM dbo.Cursos;

select * from dbo.tbNova;
--apagando tabela
DROP TABLE dbo.tbNova;

--INSERT COM SELECT
DELETE FROM dbo.tbNova;

exec sp_columns tbNova;

select * from dbo.tbNova;

INSERT INTO tbNova
       (id_curso, nome_curso, data_cadastro, login_cadastro)
SELECT id_curso,
       nome_curso,
	   getdate(),
	   'MESSIAS'
  FROM Cursos
 WHERE id_curso > 5;

select * from dbo.tbNova;

DELETE FROM dbo.tbNova;

--PARA FIXAR
INSERT INTO tbNova
       (id_curso, nome_curso, data_cadastro, login_cadastro)
SELECT id_curso,
       nome_curso,
	   getdate(),
	   'MESSIAS'
  FROM Cursos
 WHERE id_curso > 5;

select * from dbo.tbNova;

--__________Aula 25__________ 
--DELETE 
  -- Apagar TODOS os dados de uma tabela
  -- Apagar dados selecionados
------------------------------------------

select *
   into dbo.tbDELETE
   from dbo.cursos;

DELETE FROM dbo.tbDELETE; -- Vai apagar os dados da tabela

SELECT * FROM tbDELETE;
  DROP TABLE tbDELETE; -- Vai apagar o banco

DELETE FROM DBO.tbDELETE
    WHERE nome_curso like '%Avançado%';  -- Vai apagar por filtro

DELETE FROM DBO.tbDELETE
    WHERE nome_curso = 'VBA I'; 

---------------------------------------------
select *
   INTO AlunosTemp
   FROM Alunos;

select * from AlunosTemp;

-- Apagar os alunos que não estão em nenhum curso
-- Opção 1

select a.nome, a.sexo, t.valor
  from AlunosTemp A
       inner join AlunosxTurmas t on t.id_aluno = a.id_aluno

	   select * from AlunosTemp --104 registros 

DELETE FROM AlunosTemp
WHERE id_aluno not in
(
    select a.id_aluno
      from AlunosTemp A
           inner join AlunosxTurmas t on t.id_aluno = a.id_aluno
);

-- OPção 2
DROP TABLE AlunosTemp; --1

select *   --2
  into Alunostemp
  from Alunos;

select a.nome, a.sexo --3
  from AlunosTemp A
 where a.id_aluno not in
       (
	       select t.id_aluno from AlunosxTurmas t where a.id_aluno = t.id_aluno
	   )

--Apagar todos os registros de alunos
--que tenham mais de 30 anos

--1) Identificar os registros
SELECT nome,
       datediff(year, data_nascimento, getdate()) as idade,
	   a.sexo
  FROM Alunos a
WHERE datediff(year, data_nascimento, getdate()) > 30
ORDER BY 2

--2) Apagar os registros
DELETE FROM Alunostemp
 where datediff(year, data_nascimento, getdate()) > 30;

 --3) Query unificada
 DELETE FROM Alunostemp
  WHERE id_aluno IN 
        (
		  SELECT id_aluno
		    FROM Alunostemp a
		   WHERE datediff(year, data_nascimento, getdate()) > 20
         );

SELECT * FROM Alunostemp;

--__________Aula 26__________ 
--DROP 
  -- Apagar itens do Banco de dados
------------------------------------

-- Apagar tabelas

select * from sys.tables; --Todas as tabelas criadas no Banco de dados 

select * 
  into tbDELETE
  from cursos;

drop table tbdelete;

select * from tbdelete;

--Apagar Sequences

select * from sys.sequences;

DROP SEQUENCE seq_Teste02;

--Apagar indices 

create index indAlunosTeste on Alunos(id_aluno);

Drop index Alunos.indAlunosTeste;

--Apagar Procedures

CREATE PROCEDURE prcListaAlunosTeste
AS
    SELECT al.nome, al.data_nascimento
	  FROM alunos al
	 WHERE al.nome like 'G%';

exec prcListaAlunosTeste;

DROP PROCEDURE prcListaAlunosTeste;

--Apagar Constraints

select name from sys.key_constraints where name like 'pk%'

select *
  into tbdelete
  from cursos;

select * from Alunos;

USE SQL_DB_1
GO
alter table tbdelete
ADD CONSTRAINT pk_idcurso UNIQUE (id_curso);

select name from sys.key_constraints where name like 'pk%'

ALTER TABLE tbdelete
 DROP CONSTRAINT PK_idcurso;

--Apagar views
CREATE VIEW vwAlunosTrumasTeste
AS 
   SELECT nome, data_nascimento, datediff(year, data_nascimento, getdate()) idade
    from Alunos
   where datediff(year, data_nascimento, getdate()) <= 18;

select * from vwAlunosTrumasTeste;

DROP VIEW vwAlunosTrumasTeste;

--Apagar Banco de dados

CREATE DATABASE dbTesteDrop; --criar.

DROP DATABASE dbTesteDrop; --Apagar.

--__________Aula 27__________ 
--ALTER TABLE

--Alteração das características dos campos de uma tabela
--Utilizado para adcionar, delete ou modificar colunas de uma tabela existente 
-------------------------------------------------------------------------------

SELECT * 
  INTO TTEMP
  FROM Alunos;

exec sp_columns ttemp;

--Adicionar coluna

SELECT * FROM TTEMP;

ALTER TABLE ttemp
  ADD cpf NUMERIC(11);

UPDATE TTEMP
   SET CPF = 11122233344
  WHERE id_aluno = 1;

UPDATE TTEMP
   SET cpf = 11122233355
  WHERE id_aluno = 100;

ALTER TABLE TTEMP
  ADD EMAIL VARCHAR(100);

--Apagar um coluna

ALTER TABLE TTEMP
 drop column email;
 
select * from ttemp;

--Alterar tipo de dados de uma coluna

ALTER TABLE TTEMP
 drop column CPF;

ALTER TABLE ttemp
  add cpf varchar(100);

EXEC SP_COLUMNS tTEMP;

ALTER TABLE tTEMP
ALTER COLUMN CPF NUMERIC(11);

EXEC SP_COLUMNS tTEMP;

DROP TABLE TTEMP;

--__________Aula 28__________ 
--UPDATE

--Alteração dos dados armazenados em uma tabela
----------------------------------------------------

select *
  into tbtemp
  from Alunos;

select * from tbtemp;

update tbtemp
   set sexo = 'M';

drop table tbtemp;

select *
  into tbtemp
  from Alunos;

select * from tbtemp where sexo is null;

update tbtemp
   set sexo = 'F' 
 where id_aluno between 50 and 55;

update tbtemp
   set sexo = 'M'
  where id_aluno in (71,72,73)
and sexo is null;

update tbtemp
   set sexo = null
 where id_aluno = 71

drop table tbtemp;

--__________Aula 29__________ 
--TRANSACTION

--BEGIN TRANSACTION
--ROLLBACK TRANSACTION
--COMMIT;
----------------------------------------------------

select *
  INTO TTEMP
  FROM ALUNOS;

SELECT * FROM TTEMP;

BEGIN TRANSACTION 
    UPDATE TTEMP
	   SET SEXO = LOWER(SEXO);
COMMIT;

BEGIN TRANSACTION;
    UPDATE TTEMP SET SEXO = UPPER(SEXO);
ROLLBACK; --VAI VOLTAR OS REGISTROS ALTERADOS

BEGIN TRANSACTION;
   DROP TABLE TTEMP;
ROLLBACK;

----------------------------------------------
DECLARE @TR1 VARCHAR(20);
 SELECT @TR1 = 'Transação Delete';

BEGIN TRANSACTION @TR1;

  DELETE FROM tTEMP
   WHERE NOME LIKE 'J%';

COMMIT TRANSACTION @TR1;

SELECT * FROM tTEMP;

--Múltiplos pontos de Transaction
--Nomeando as transações 
/*
O exemplo a seguir cria uma tabela, gera três níveis de transaçôes aninhadas e, 
em seguida, confirma a transação aninhada. Embora cada instrução COMMIT TRANSACTION
tenha um parâmetro transaction_name, não há nenhuma relação entre as instruçôes
COMMIT TRANSACTION E BEGIN TRANSCTION. Os parâmetros transaction_name ajudam o 
programador a assegurar que o número corretp de confirmação seja codificado para
decrementar @@TRANCOUNT para 0 e, assim, confirmar a transação externa.
*/
-------------------------------------------------------------------------------------

IF OBJECT_ID('TabelaTeste','U') is not null
   DROP TABLE TabelaTeste;
GO

CREATE TABLE TabelaTeste (ID int Primary key, LETRA char(1));
GO

--Iniciar a variável de controle de transctions @@TRANCOUNT para 1

BEGIN TRANSACTION TR1;
      PRINT 'Transaction : contador depois do BEGIN = ' + CAST(@@TRANCOUNT as NVARCHAR(10));
	  INSERT INTO TabelaTeste VALUES (1, 'A');

BEGIN TRANSACTION TR2;
	  PRINT 'Transaction : contador depois do 2º BEGIN = ' + CAST(@@TRANCOUNT as NVARCHAR(10));
      INSERT INTO TabelaTeste VALUES (2, 'B');

BEGIN TRANSACTION TR3;
	  PRINT 'Transaction : contador depois do 3º BEGIN = ' + CAST(@@TRANCOUNT as NVARCHAR(10));
      INSERT INTO TabelaTeste VALUES (3, 'C');

COMMIT TRANSACTION TR2;
       PRINT 'Transaction : contador depois do COMMIT TR2 = ' + CAST(@@TRANCOUNT as NVARCHAR(10));

COMMIT TRANSACTION TR1;
       PRINT 'Transaction : contador depois do COMMIT TR1 = ' + CAST(@@TRANCOUNT as NVARCHAR(10));

COMMIT TRANSACTION TR3;
       PRINT 'Transaction : contador depois do COMMIT TR3 = ' + CAST(@@TRANCOUNT as NVARCHAR(10));

--__________Aula 30__________ 
--IF... ELSE...
----------------------------------------------------

DROP TABLE TTEMP;
select * into TTemp FROM ALUNOS;
SELECT * FROM TTEMP
IF 10 > 20
    select '10 é maior que 20'
ELSE
    select '10 é menor que 20';

-- DATENAME - Dia atual da semana 
select datename(weekday, getdate())

IF DATENAME(weekday, getdate()) in ('Sábado', 'Domingo')
   SELECT 'Estamos no fim de semana. hoje é' + datename(weekday, getdate())
ELSE
   SELECT 'Estamos em um dia de semana. Hoje é' + DATENAME(weekday, getdate());

--Variáveis Globais do SQL

SELECT @@SERVERNAME; -- Nome do servidor
SELECT @@LANGUAGE; -- Linguagem definida aqui no ambiente
SELECT @@LANGID; -- O ID da linguagem
SELECT @@TRANCOUNT; -- Mostra  a transação ativa

IF @@LANGUAGE <> 'Português (Brasil)'
   SELECT 'Today is ' + datename(weekday, getdate())
ELSE
   SELECT 'Hoje é ' + datename(weekday, getdate());

IF OBJECT_ID('DBO.ALUNOS', 'U') IS NULL -- Se Bota uma tabela que não existe dentro das aspas 
   SELECT 'Esta tabela não existe!'     -- simples ele vai EXIBIR a mensagem
ELSE 
   EXEC sp_columns Alunos;

/*
Você pode ter visto o código Transct-SQL que trasmite cadeias de caracteres usando um prefixo N.
Isso indica que a sequencia sebsequente está em Unicode (o N realmente significa conjunto de
caracteres do idioma nacional). O que significa que você está pessando um valor
NCHAR, NVARCHAR ou NTEXT, em oposição a CHAR, VARCHAR ou TEXT.

Prefixo constantes da cadeia de caracteres Unicode com a letra N. Sem o profexo N, a cadeia é
convertida na página de códigos padrão do banco de dados. Esta página de código padrão pode
não reconhecer certos caracteres.
*/

DECLARE @vIdadeMax INT;
DECLARE @vParam    INT;
    SET @vIdadeMax = 16;
	SET @vParam = 15;

IF @vIdadeMax >= @vParam
   SELECT NOME, DATA_NASCIMENTO, DATEDIFF(YEAR, DATA_NASCIMENTO, GETDATE()) IDADE
     FROM TTemp
	WHERE DATEDIFF(YEAR, DATA_NASCIMENTO, GETDATE()) >= @vIdadeMax
	ORDER BY 3 ASC
ELSE
    SELECT NOME, DATA_NASCIMENTO, DATEDIFF(YEAR, DATA_NASCIMENTO, GETDATE()) IDADE
     FROM TTemp
	WHERE DATEDIFF(YEAR, DATA_NASCIMENTO, GETDATE()) < @vIdadeMax
	ORDER BY 3 ASC;

DROP TABLE TTEMP;


--__________Aula 31__________ 
--WHILE
----------------------------------------------------
select * into ttemp from Alunos;
select * from ttemp;

--Substituição de valor com while

DECLARE @vSTRING VARCHAR(100);
    SET @vSTRING = 'Jose        Messias           |';

WHILE CHARINDEX('  ', @vSTRING) > 0
BEGIN
      SET @vSTRING = REPLACE(@vSTRING, '  ',' ')
END

SELECT @vSTRING;

--------------------

DECLARE @vCONT INT;
    SET @vCONT = 1;

WHILE (@vCONT <= 10)
BEGIN
     PRINT 'O contador está em : ' + convert(varchar,@vCont)
	   SET @vCONT = @vCONT + 1
END;

---------------------

DECLARE @vCONT1 INT;
    SET @vCONT1 = 1;

WHILE (@vCONT1 <= 10)
BEGIN
     PRINT 'O contador está em : ' + convert(varchar,@vCont1)
	   IF @vCONT1 = 7 --Para no 7
	      BREAK
	   SET @vCONT1 = @vCONT1 + 1
END;

--Número impares e pares

DECLARE @vCONT2 INT;
    SET @vCONT2 = 1;

WHILE (@vCONT2 <= 17)
BEGIN
     IF @vCONT2 % 2 =0
	 BEGIN
	   SET @vCONT2 = @vCONT2 + 1
	   CONTINUE
	 END
	 PRINT 'O valor é : ' + convert(varchar, @vCONT2)

	 SET @vCONT2 = @vCONT2 +1
END;

DROP TABLE TTEMP;

-- Ler resistros em uma tabela 
------------------------------

select x.*
  into tTemp
  from (
         select row_number() over(order by id_aluno) linha,
		         y.id_aluno,y.nome, y.nome_curso, y.data_inicio, y.data_termino
		 from (
		       select a.id_aluno, a.nome, c.nome_curso, t.data_inicio, t.data_termino
			     from AlunosxTurmas at
				      inner join Turmas t on (t.id_turma = at.id_turma)
					  inner join Cursos c on (c.id_curso = t.id_curso)
					  inner join Alunos a on (a.id_aluno = at.id_aluno)
			   ) y
         ) x

DECLARE @Contador INT,
        @MaxLinhas INT,
		@CursoProcura NVARCHAR(100),
		@CursoNome    NVARCHAR(100),
		@NomeAluno    NVARCHAR(100)

	SET @CursoProcura = 'Excel';

SELECT @Contador = min(linha), @MaxLinhas = max(linha) from tTemp;

WHILE(@Contador is not null and @Contador <= @MaxLinhas)
BEGIN

     SELECT @CursoNome = nome_curso, @NomeAluno = nome
	   from tTemp
	  WHERE linha = @Contador

	     IF CHARINDEX(@cursoprocura, @cursoNome) > 0
		    PRINT CONVERT(VARCHAR, @Contador) + '> Curso: ' + @CursoNome + ' Aluno : ' + @NomeAluno

      SET @Contador = @Contador + 1
END;

--__________Aula 32__________ 
-- CASE ... ELSE ... END
----------------------------------------------------

DROP TABLE TTEMP;

SELECT a.id_aluno, a.nome, a.sexo,
       c.nome_curso,
	   t.data_inicio, t.data_termino,
	   at.valor
  FROM AlunosxTurmas at
       inner join turmas t on (t.id_turma = at.id_turma) 
	   inner join Cursos c on (c.id_curso = t.id_curso)
	   inner join Alunos a on (a.id_aluno = at.id_aluno)

-------------------------------- 

SELECT ROW_NUMBER() OVER(ORDER BY ID_ALUNO) AS LINHA,
            Y.ID_ALUNO, Y.NOME, Y.SEXO, Y.NOME_CURSO, Y.DATA_INICIO, Y.DATA_TERMINO, Y.VALOR
  FROM(
     SELECT a.id_aluno, a.nome, a.sexo,
            c.nome_curso,
	        t.data_inicio, t.data_termino,
	        at.valor
       FROM AlunosxTurmas at
            inner join turmas t on (t.id_turma = at.id_turma) 
	        inner join Cursos c on (c.id_curso = t.id_curso)
	        inner join Alunos a on (a.id_aluno = at.id_aluno)
		) Y

---------------------------------

SELECT X.*
  INTO tTEMP
  FROM(
        SELECT ROW_NUMBER() OVER(ORDER BY ID_ALUNO) AS LINHA,
               Y.ID_ALUNO, Y.NOME, Y.SEXO, Y.NOME_CURSO, Y.DATA_INICIO, Y.DATA_TERMINO, Y.VALOR
  FROM(
        SELECT a.id_aluno, a.nome, a.sexo,
               c.nome_curso,
	           t.data_inicio, t.data_termino,
	        at.valor
         FROM AlunosxTurmas at
               inner join turmas t on (t.id_turma = at.id_turma) 
	           inner join Cursos c on (c.id_curso = t.id_curso)
	           inner join Alunos a on (a.id_aluno = at.id_aluno)
		   ) Y
      ) X

SELECT * FROM tTEMP;

-- CASE - Ele troca o resultado do retorno da query
-- ELSE - Caso não ache as informaçôes, cai nele "Caso contrário".

SELECT NOME, 
       CASE SEXO 
	        WHEN 'M' THEN 'Masculino'
			WHEN 'F' THEN 'Feminino'
	ELSE 'Verifique' END as Sexo, 
	nome_curso
  FROM tTEMP;

--Checagem de sexo

select x.* from(
                  SELECT id_aluno, nome, 
                       CASE SEXO 
	                   WHEN 'M' THEN 'Masculino'
			           WHEN 'F' THEN 'Feminino'
	                ELSE 'Verifique' END as Sexo, 
	               nome_curso
                    FROM tTEMP
               ) x
where sexo = 'M';

--------

SELECT nome, nome_curso, valor, convert(date, data_inicio) dt_inicio,
       case year(data_inicio)
	        when 2020 then 'Ano Anterior'
			when 2021 then 'Ano Atual'
			when 2022 then 'Proximo Ano'
	   else 'Ano inválido' end "Análise anos"
  FROM tTEMP;

---------

select nome, data_nascimento, datediff(year, data_nascimento, getdate()) idade,
       case 
	        when datediff(year, data_nascimento, getdate()) < 18 then 'Menor de Idade'
			when datediff(year, data_nascimento, getdate()) >= 18 then 'Maior de Idade'
		end Status_idade
  from Alunos;

----------

select nome, nome_curso, sexo
  from tTemp
 Order by
       case sexo when 'F' then 'Feminino'
	             when 'M' then 'Masculino'
	   else 
	             'sexo' end asc; --ou desc
				 
--__________Aula 33__________ 
-- BEGIN ... END
-- Controle de Fluxo das instrução T-SQL (Transaction SQL)
----------------------------------------------------

SELECT X.*
  INTO tTEMP
  FROM(
        SELECT ROW_NUMBER() OVER(ORDER BY ID_ALUNO) AS LINHA,
               Y.ID_ALUNO, Y.NOME, Y.SEXO, Y.NOME_CURSO, Y.DATA_INICIO, Y.DATA_TERMINO, Y.VALOR
  FROM(
        SELECT a.id_aluno, a.nome, a.sexo,
               c.nome_curso,
	           t.data_inicio, t.data_termino,
	        at.valor
         FROM AlunosxTurmas at
               inner join turmas t on (t.id_turma = at.id_turma) 
	           inner join Cursos c on (c.id_curso = t.id_curso)
	           inner join Alunos a on (a.id_aluno = at.id_aluno)
		   ) Y
      ) X

SELECT * FROM tTEMP;

--__________Aula 34__________ 
-- BEGIN ... END
-- Controle de Fluxo das instrução T-SQL (Transaction SQL)
----------------------------------------------------

DECLARE @vCONTADOR INT = 1;

WHILE @vCONTADOR < 10
BEGIN 
    PRINT 'Contador : ' + convert(varchar, @vContador)
	set @vCONTADOR += 1
END;

-- Sem o BEGIN Aninhado

BEGIN TRANSACTION;

IF @@TRANCOUNT = 0

    SELECT nome, nome_curso, sexo
	FEOM tTEMP
	WHERE sexo = 'M';

ROLLBACK TRANSACTION;

PRINT 'Executar Dois Rollbacks Geraria um erro de execução do segundo';

ROLLBACK TRANSACTION;

PRINT 'Transação defeita'

--Com o BEGIN Aninhado

BEGIN TRANSACTION;

IF @@TRANCOUNT = 0

      BEGIN
	     select nome, nome_curso, sexo
		   from tTemp Where sexo = 'M';		   
	  ROLLBACK TRANSACTION;
	  PRINT 'Executar dois rollbacs gera um erro no segundo'; 
	END;

ROLLBACK TRANSACTION;

PRINT 'Trasação desfeita';

DROP TABLE TTEMP;


--__________Aula 35__________ 
-- TRY ... CATCH
-- Implamentação de tratamento de erros no SQL
----------------------------------------------

SELECT X.*
  INTO tTEMP
  FROM(
        SELECT ROW_NUMBER() OVER(ORDER BY ID_ALUNO) AS LINHA,
               Y.ID_ALUNO, Y.NOME, Y.SEXO, Y.NOME_CURSO, Y.DATA_INICIO, Y.DATA_TERMINO, Y.VALOR
  FROM(
        SELECT a.id_aluno, a.nome, a.sexo,
               c.nome_curso,
	           t.data_inicio, t.data_termino,
	        at.valor
         FROM AlunosxTurmas at
               inner join turmas t on (t.id_turma = at.id_turma) 
	           inner join Cursos c on (c.id_curso = t.id_curso)
	           inner join Alunos a on (a.id_aluno = at.id_aluno)
		   ) Y
      ) X

SELECT * FROM tTEMP;


--Exemplo 1 
--Tabela não existe

BEGIN TRY 
     select * from tempTable;
END TRY 
BEGIN CATCH
    SELECT
	       ERROR_NUMBER() as Numero_erro,
		   ERROR_MESSAGE() as Mensage_erro;
BEGIN CATCH;

--Exemplo 2
--Utilizando em um procedure

CREATE PROCEDURE prc_Exmeplo
AS
      select * from temTable;
GO

BEGIN TRY
   execute prc_Exemplo;
END TRY
BEGIN CATCH
    SELECT 
	       ERROR_MESSAGE() AS Numero_erro,
		   ERROR_MESSAGE() AS Mesangem_erro;
END CATCH;

*--Exemplo 3

BEGIN
    BEGIN TRY 
          SELECT 1/0;
	END TRY
	BEGIN CATCH
	    PRINT 'Erro número   : ' + convert(varchar, error_number());
		PRINT 'Erro mensagem : ' + error_message():
		PRINT 'Erro severy   : ' + convert(varchar, error_severity());
		PRINT 'Erro state    : ' + convert(varchar, error_state());
		PRINT 'Erro line     : ' + convert(varchar, error_line());
		PRINT 'Erro proc     : ' + error_procedure();
	END CATCH;

END
		 


































