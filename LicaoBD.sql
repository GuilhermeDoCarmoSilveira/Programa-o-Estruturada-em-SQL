-- Dado um número inteiro. Calcule e mostre o seu fatorial. (Não usar entrada superior a 12)
Declare @num int,
	@fat int

Set @num = 13
Set @fat = @num-1
While(@fat>0 and @fat<12)
Begin
set @num=@num*@fat
set @fat = @fat -1
end
if(@fat<12)
begin
print @num
end
else
begin
print 'Estouro de memoria'
end

/*Dados A, B, e C de uma equação do 2o grau da fórmula AX2+BX+C=0. Verifique e mostre a 
existência de raízes reais e se caso exista, calcule e mostre. Caso não existam, exibir mensagem.*/

declare @a int, @b int, @c int, @x1 decimal(7,2), @x2 decimal(7,2), @d int
set @a = -1
set @b = 1
set @c = -6

set @d = (@b * @b) - (4 * @a * @c)

if(@d < 0) begin
	print 'Nao existe raizes reais'
end

if(@d = 0) begin
	set @x1 = -@b/(2 * @a) 
	print 'So exite apenas uma raiz real de valor ' + cast(@x1 as varchar(5))
end

if(@d > 0) begin
	set @x1 = (-@b + sqrt(@d)) /(2 * @a)
	set @x2 = (-@b - sqrt(@d)) /(2 * @a)
	print 'As raizes foram ' + cast(@x1 as varchar(5)) + ' ' + cast(@x2 as varchar(5))
end

/*Calcule e mostre quantos anos serão necessários para que Ana seja maior que Maria sabendo
que Ana tem 1,10 m e cresce 3 cm ao ano e Maria tem 1,5 m e cresce 2 cm ao ano.*/

declare @ana decimal(7,2), @maria decimal(7,2), @anos int
set @ana = 1.10
set @maria = 1.5
set @anos = 0

while(@ana < @maria) begin
	set @ana = @ana + 0.3
	set @maria = @maria + 0.2
	set @anos = @anos + 1
end
	print @anos

/*Seja a seguinte série: 1, 4, 4, 2, 5, 5, 3, 6, 6, 4, 7, 7, ...*/

declare @num1 int, @num2 int, @n int, @resultado varchar(100)
set @num1 = 1
set @num2 = 4
set @n = 10
set @resultado = ''

while(@num2 <= @n)begin
	
	set @resultado = @resultado + ', ' + cast(@num1 as varchar(2)) + ', ' + cast(@num2 as varchar(2)) + ', ' + cast(@num2 as varchar(2))
	set @num1 = @num1 + 1
	set @num2 = @num2 + 1
end
	print @resultado

/*Considerando a tabela abaixo, gere uma massa de dados, com 50 registros, para fins de teste
com as regras estabelecidas (Não usar constraints na criação da tabela)*/
	
create table Produto (
	codigo int not null,
	nome varchar(30) not null,
	valor decimal(7,2) not null,
	vencimento date not null
)

declare @cod int, @num int, @venc int, @valor int 
set @cod = 50001
set @num = 1

while(@num <= 50)begin
	set @venc = CAST(RAND() * 7 + 3 AS INT)
	set @valor = CAST(RAND() * 100.00 + 10.00 AS INT)
	insert into Produto values (@cod, 'produto ' + cast(@num as varchar(3)), @valor, dateadd(day, @venc, GETDATE())) 
	set @cod = @cod + 1
	set @num = @num + 1
end

select * from Produto	
