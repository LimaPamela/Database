use oficina;

#delete from cliente where telefone;
#ALTER TABLE cliente ADD telefone varchar(255);
insert into cliente (nome, telefone,cnh,endereco) values('Maria da Silva', '(11)987456312', '123456789','rua nome, 01, bairro - cidade,SP');
insert into cliente (nome, telefone,cnh,endereco) values('Pedro Alvares', '(11)92587-4597', '369852147','rua nome, 03, bairro - cidade,SP');
select * from cliente;

insert into veiculo (placa,renavan,marca,modelo) values ('BRA0S22','987456321', 'Volkswagen', 'Jetta');
insert into veiculo (placa,renavan,marca,modelo) values ('ARG0G00','123654789', 'Volkswagen', 'fusca');
select * from veiculo;

insert into mecanico (nome, telefone,cpf,endereco) values('Valentina', '(11)25874589', '96587412361','rua nome, 02, bairro - cidade,SP');
insert into mecanico (nome, telefone,cpf,endereco) values('Enzo', '(11)36985214', '78965412365','rua nome, 04, bairro - cidade,SP');
select * from mecanico;

insert into revisao (data_rev,horario,valor) values('2022-09-22','08:25:37',1000.00);
insert into revisao (data_rev,horario,valor) values('2022-09-21','23:59:59',18000.00);
select * from revisao;

insert into item_revisado(peca,troca,valor_mao_obra,valor_peca) values ('Pneu', '4', 800.21, 199.79);
insert into item_revisado(peca,troca,valor_mao_obra,valor_peca) values ('Motor', '4', 500.00, 17500.00);

select * from item_revisado;

insert into ordem_servico(data_emissao,valor_total,data_conclusao) values ('2022-09-22',1000.00,'2022-09-30');
insert into ordem_servico(data_emissao,valor_total,data_conclusao) values ('2022-09-23',18000.00,'2022-11-02');
select * from ordem_servico;
show tables;

select count(*) from cliente;
select * from cliente, ordem_servico where id_cliente = id_OS;
select * from cliente, ordem_servico, mecanico where  id_cliente = id_OS;

SELECT nome FROM  cliente
UNION ALL
SELECT nome FROM mecanico
ORDER BY nome;

SELECT id_cliente
FROM cliente
INNER JOIN mecanico
ON id_cliente = id_mecanico;

SELECT id_cliente
FROM cliente
left JOIN mecanico
ON id_cliente = id_mecanico;

SELECT id_cliente
FROM cliente
right JOIN mecanico
ON id_cliente = id_mecanico;

SELECT cnh
FROM cliente
full JOIN mecanico
ON id_cliente = id_mecanico;

SELECT cpf
FROM cliente
CROSS JOIN mecanico;