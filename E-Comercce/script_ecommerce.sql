-- criação do banco de dados para o cenário de e-commerce
create database ecommerce;
use ecommerce;

-- drop database ecommerce;
show tables;
-- show databases;
-- use information_schema;
-- desc table_constraints;
-- desc referential_constraints;
-- select * from referential_constraints where constraint_schema = 'ecommerce';

-- criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    address varchar(255),
    constraint unique_cpf_client unique (CPF)
);
alter table clients auto_increment=1;

-- desc clients;

-- criar tabela produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(20) not null,
    classification_kids bool default false,
    category enum('Eletronico','Vestimenta','Brinquedos','Alimentos','Moveis') not null,
    avaliação float,
    size varchar(10)
);
alter table product auto_increment=1;

-- desc product;

-- criar tabela pagamentos
create table payments(
	idClient int,
    idPayment int,
    typePayment enum('Cartão de credito','Boleto','Pix'),
    limitAvaliable float,
    paymentStatus enum('Aprovado','Aguardando','Negado'),
    primary key(idClient, idPayment)
);

-- criar tabela pedido
create table orders(
	idOrder int auto_increment,
    idOrderClient int,
    -- idOrderPayment int,
    orderStatus enum('Cancelado','Confirmado','Processando') default 'Processando',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash boolean default false,
    primary key (idOrder),
    constraint fk_order_client foreign key(idOrderClient) references clients(idClient)
    -- constraint fk_order_payment foreign key(idOrderPayment) references payments(idPayment)
);
alter table orders auto_increment=1;
-- desc orders;

-- criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default(0)
); 
alter table productStorage auto_increment=1;

-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(15) not null,
    contact varchar(11) not null,
    constraint unique_supplier unique (CNPJ)
); 
alter table supplier auto_increment=1;

-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    abstractName varchar(255),
    CNPJ varchar(15),
    CPF varchar(9),
    location varchar (255),
    contact varchar(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
); 
alter table seller auto_increment=1;

create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int not null,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);
-- desc productSeller;

create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponivel','Indisponivel') default 'Disponivel',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
    constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
);

create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

create table productSupplier(
	idLPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idLPsSupplier, idPsproduct),
    constraint fk_product_supplier_product foreign key (idLPsSupplier) references supplier(idSupplier),
    constraint fk_product_location_product foreign key (idPsProduct) references product(idProduct)
);

