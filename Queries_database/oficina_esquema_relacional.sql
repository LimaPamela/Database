create database oficina;
use oficina;

create table cliente (
id_cliente int auto_increment primary key,
nome varchar (255) not null,
telefone varchar (20),
cnh varchar (20) not null,
endereco varchar(255) not null,
constraint unique_cnh_client unique (cnh)
);

create table veiculo (
id_veiculo int auto_increment primary key,
placa varchar (10) not null,
renavan varchar (10) not null,
marca varchar (10) not null,
modelo varchar (10) not null,
constraint unique_placa_veiculo unique (placa),

constraint fk_veiculo foreign key (id_veiculo)
references cliente(id_cliente)
);

create table mecanico (
id_mecanico int auto_increment primary key,
nome varchar (255) not null,
telefone varchar (15),
cpf varchar (20) not null,
endereco varchar (255) not null,
constraint unique_cpf_mecanico unique (cpf)
);

create table revisao (
id_revisao int auto_increment primary key,
data_rev date,
horario time,
valor float,

constraint fk_revisao foreign key (id_revisao)
references veiculo(id_veiculo)
);

create table item_revisado(
id_itemRevisado int auto_increment primary key,
peca varchar (255) not null,
troca varchar (255) not null,
valor_mao_obra float,
valor_peca float,

constraint fk_item_revisado foreign key (id_itemRevisado)
references mecanico(id_mecanico)
);

create table ordem_servico(
id_OS int auto_increment primary key,
data_emissao date,
valor_total float,
data_conclusao date,

constraint fk_ordem_servico foreign key (id_OS)
references item_revisado(id_itemRevisado)
);

