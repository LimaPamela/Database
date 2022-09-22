#inserção de dados e queries
use ecommerce;

#idClient, Fname,Lname,CPF,Adress
insert into clients (Fname,Minit, Lname,cpf,address)
values('Maria', 'M','Silva', '123456789','rua nome, 01, bairro - cidade,SP');
insert into clients (Fname,Minit, Lname,cpf,address)
values('José', 'S','Santos', '369852147','rua nome, 02, bairro - cidade,RJ');
select * from clients;

insert into payments(idClient,idPayment,typePayment,limitAvailable,dataValid) values(3,1,'Cartão',5000.0, '2030-09-30');
select * from payments;

#idProduct, Pname, classification_kids boolean,category 'Eletrônico', 'Vestimenta', 'Brinquedo', 'Alimento','Móveis','livros'), avaliação size
insert into product(Pname,classification_kids,category,avaliacao,size) values ('Mesa', true, 'Móveis', 5,'200x210x60');
insert into product(Pname,classification_kids,category,avaliacao,size) values ('Cadeira', false, 'Móveis', 3,'200x210x60');
select * from product;

insert into orders(idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
values (1, null, 'compra via aplicativo', null, 1);
insert into orders(idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
values (1, null, 'compra via aplicativo', 10.0, 2);

select * from orders;
delete from orders where idOrderClient in (1);

insert into productOrder(idPOproduct,idPOorder,prodQuantity,poStatus) values (1,3,1,null);
insert into productOrder(idPOproduct,idPOorder,prodQuantity,poStatus) values (2,4,1,'Disponível');
insert into productOrder(idPOproduct,idPOorder,prodQuantity,poStatus) values (1,4,1,'Disponível');
select * from productOrder;

insert into productStorage (storagelocation,quantity) values ('São Paulo', '1000');
insert into productStorage (storagelocation,quantity) values ('Rio de Janeiro', '500');
select * from productStorage;

insert into storageLocation(idLproduct, idLstorage,location) values (1,1,'SP');
insert into storageLocation(idLproduct, idLstorage,location) values (2,1,'RJ');
select * from storageLocation;

insert into supplier (socialName, cnpj,contact) values ('Almeida e Filhos', '123456145236154','11-98765-4252');
insert into supplier (socialName, cnpj,contact) values ('Coelho e Filhos', '123147258963123','(21)98745-6321');
select * from supplier;

insert into product_supplier (idPsSupplier,idPsProduct,quantity) values (1,1,500);
insert into product_supplier (idPsSupplier,idPsProduct,quantity) values (2,2,1000);
select * from product_supplier;

insert into seller (socialName,abstName,cnpj,cpf,contact,location) values ('Tech eletronics', null, '3214569871452', '15241547823', 'São Paulo', '11-3245-7885');
insert into seller (socialName,abstName,cnpj,cpf,contact,location) values ('ABC eletronics', null, '36985214785236', '98745632144', 'Rio de Janeiro', '(21)6547-8936');
select * from seller;

insert into productSeller(idPseller,idProduct,prodQuantity) values (1,1,80);
insert into productSeller(idPseller,idProduct,prodQuantity) values (2,2,800);
select * from productSeller;

#Ver as queries
select * from clients;
show tables;

#deletar um dado da tabela -sempre o WHERE
delete from clients where idClient in (1);

#recuperar os números dos clientes cadastrados
select count(*) from clients;
select count(*) from product;


#recuperar os pedidos por idcliente
select * from clients c, orders o where c.idClient = idOrderClient;

#recuperar os pedidos por nome
select Fname, Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;
#recuperar os pedidos por nome
select concat(Fname, ' ',Lname) as Client, idOrder as request,  orderStatus  
as status from clients c, orders o where c.idClient = idOrderClient;

#Agrupar 
#select count(*) from clients c, orders o where c.idClient = idOrderClient;
select count(*) from clients c, orders o 
where c.idClient = idOrderClient
group by idOrderClient;

#Recuperar quantos pedidos foram realizados pelos clientes - juntar as tables
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
inner join orders o  ON c.idClient = o.idOrderClient
group by idClient;

#Buscar os id dos Fornecedores e Vendedores
select supplier.idSupplier, seller.idSeller
from supplier,seller 
where supplier.idSupplier = seller.idSeller;

select socialName from supplier where idSupplier;
select socialName from seller where idSeller;

# Algum vendedor também é fornecedor?
SELECT socialName FROM  seller
UNION ALL
SELECT socialName FROM supplier
ORDER BY socialName;

#Relação de nomes dos fornecedores e nomes dos produtos;
SELECT socialName FROM supplier
UNION ALL
SELECT Pname FROM product
ORDER BY socialName;

#Relação de nomes dos fornecedores e nomes dos produtos;
SELECT socialName FROM supplier
UNION ALL
SELECT quantity FROM product_supplier
ORDER BY socialName;

#Relação de nomes dos vendedores e nomes dos produtos;
SELECT socialName FROM seller
UNION ALL
SELECT prodQuantity FROM productseller
ORDER BY socialName;