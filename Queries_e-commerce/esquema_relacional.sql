#criação de banco de dados para o cenário de E-commerce
create database ecommerce;
use ecommerce;

#criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10) not null,
    Minit char(3),
    lname varchar(20),
    cpf char(11) not null,
    address varchar(50),
	constraint unique_cpf_client unique (CPF)
);
alter table clients auto_increment=1;
#desc clients;

#criar tabela produto
#size equivale a dimensão do produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(255) not null,
    classification_kids bool default false,
    category enum('Eletrônico', 'Vestimenta', 'Brinquedo', 
    'Alimento','Móveis','livros') not null,
    avaliacao float default 0,
    size varchar(10)
    );
    
    
#criar tabela pagamento
create table payments(
idClient int,
idPayment int,
typePayment enum('Boleto', 'Cartão','Dois cartões', 'Pix'),
limitAvailable float,
dataValid date,
primary key (idClient, idPayment)
);   
   
   
#criar tabela pedido
create table orders(
idOrder int auto_increment primary key,
idOrderClient int,
orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
orderDescription varchar(255),
sendValue float default 10,
paymentCash bool default false,
idPayment int,
constraint fk_orders_client foreign key(idOrderClient)
references clients(idClient)
		on update cascade
);
#desc orders;

#criar tabela estoque
create table productStorage( 
idProdStorage int auto_increment primary key,
storagelocation varchar (255) not null,
quantity int default 0 not null
);


#criar tabela fornecedor
create table supplier(
idSupplier int auto_increment primary key,
socialName varchar (255) not null,
cnpj char(15) not null,
contact char(15) not null,
constraint unique_supplier unique (cnpj)
);
#desc supplier;

#criar tabela estoque
create table seller( 
idSeller int auto_increment primary key,
socialName varchar (255) not null,
abstName varchar (255),
cnpj char(15) not null,
cpf char(11) not null,
contact char(15) not null,
location varchar (255),
constraint unique_cpf_seller unique (cnpj),
constraint unique_cnpj_seller unique (cpf)
);


#criar tabela produto vendedor
create table productSeller( 
idPseller int,
idProduct int,
prodQuantity int default 1,
primary key (idPseller, idProduct),
constraint fk_product_seller foreign key (idPseller)
references seller(idSeller),

constraint fk_product_product foreign key (idProduct)
references product(idProduct)
);
#desc productSeller;

#criar tabela produto ordem
create table productOrder( 
idPOproduct int,
idPOorder int,
prodQuantity int default 1,
poStatus enum ('Disponível', 'Sem estoque') default 'Disponível',
primary key (idPOproduct, idPOorder),
constraint fk_productorder_seller foreign key (idPOproduct)
references product(idProduct),

constraint fk_productorder_product foreign key (idPOorder)
references orders(idOrder)
);

#criar tabela produto Local Estoque
create table storageLocation( 
idLproduct int,
idLstorage int,
location varchar(255) not null,
primary key (idLproduct, idLstorage),
constraint fk_storage_location_product foreign key (idLproduct)
 references product(idProduct),
 
 constraint fk_storage_location_storage foreign key (idLstorage)
 references productStorage(idProdStorage)
);
#desc storageLocation;

#criar tabela produto Vendedor-Produto
create table product_supplier( 
idPsSupplier int,
idPsProduct int,
quantity int not null,
primary key (idPsSupplier, idPsProduct),
constraint fk_product_supplier_supplier foreign key (idPsSupplier)
references supplier(idSupplier),

constraint fk_product_supplier_product foreign key (idPsProduct)
references product(idProduct)
);

show tables;