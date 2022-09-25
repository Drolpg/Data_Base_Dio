-- inserção de dados e queries
use ecommerce;

show tables;
-- idClient, Fname, Minit, CPF, Address
insert into Clients (Fname, Minit, Lname, CPF, Address)
	values('Maria','M','Silva','12345678978','Avenida Sapopenmpa 123, São Mateus - São paulo'),
		  ('Leandro','N','Santos','38262545610','Travessa Projetada 63, Promorar - São Paulo'),
          ('Miguel','N','Barbosa','25698745625','Rua Francisco Mingnone 122, Teotonio Vilella - São Paulo'),
          ('Leonidas','B','Santos','36869845878','rua joao das quantas 12, Peruibe -  São Paulo'),
          ('Laura','N','Souza','26859845896','Rua São Sebastião 45, jd Santo Andre');
  select * from clients;
  
-- idProduct, Pname, Classification_kids boolean, category('Eletronico', 'Vestimenta', 'Brinquedos', 'Alimentos','Moveis'), avaliação, size
insert into product (Pname, Classification_kids, category, avaliação, size)
	values	('Fone de ouvido',false,'Eletronico','4',null),
			('Barbie',true,'Brinquedos','3',null),
            ('Camiseta',true,'Vestimenta','5',null),
            ('Cesta basica',false,'Alimentos','5',null),
            ('Sofa',false,'Moveis','3','3x57x80');
select * from product;

-- idClient, idPayment, typePayment('Cartão de credito','Boleto','Pix'), limitAvaliable float, paymentStatus enum('Aprovado','Aguardando','Negado'),
insert into payments (idClient, idPayment, typePayment, limitAvaliable, paymentStatus)
	values	('1','1','Boleto','10000','Aguardando'),
			('2','2','Cartão de credito','25000','Aprovado'),
            ('3','3','Cartão de credito','7500','Negado'),
            ('4','4','Boleto','5000','Aprovado'),
            ('5','5','Pix','12000','Aguardando');
            
-- idOrder, idOrderClient, orderStatus('Cancelado','Confirmado','Processando'), orderDescription, sendValue, paymentCash
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
	values	('1','Cancelado','Produto legal','50', false),
			('2','Confirmado','Produto legal','13332', true),
            ('3','Processando','Produto legal','25', true),
            ('4','Processando','Produto legal','358',false),
            ('5','Confirmado','Produto legal','1252', true);
            
            
-- idProdStorage, storageLocation, quantity
insert into productStorage (storageLocation, quantity)
	values	('São Paulo','170000'),
			('Peruibe','10000'),
            ('Bahia','20000'),
            ('Osasco','10200'),
            ('São Paulo','10000');
            
-- idSupplier, socialName, CNPJ char(15), contact varchar(11)
insert into supplier (socialName, CNPJ, contact)
	values	('Barateiro','123254879852365','11959854587'),
			('SuperStore','236985478521265','26589563574'),
            ('Chinebox','258852258852258','12332112332'),
            ('Page','228985478521765','26598523574'),
            ('Bras','123254879853366','11979854587');
            
-- idSeller, socialName, abstractName, CNPJ(15), CPF(9), location, contact (11)
insert into seller (socialName, abstractName, CNPJ, CPF, location, contact)
	values	('Jorge João','JJ Vendas', null,'256987456','Bahia','25987562598'),
			('Maria T','Tres marias Store','236985689574598', null,'Pernanbuco','36985974589'),
            ('Roger M','RM Inports','159875896369956', null,'Acre','35986544744'),
            ('Juliana','Jujubas', null,'125987589','Piaui','326985626'),
            ('Kids Word', null, null,'987654321','São Paulo','11926589633');
            
-- idPseller, idPproduct, prodQuantity,

    insert into productSeller (idPseller, idPproduct, prodQuantity)
		values	(6, 11, 25),
				(7, 12, 21),
                (8, 13, 33),
                (9, 14, 54),
                (10, 15, 75);

-- idPOproduct, idPOorde, poQuantity, poStatus enum('Disponivel','Indisponivel')              
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
	values	(11, 1, 100, 'Disponivel'),
			(12, 2, 0, 'Indisponivel'),
            (13, 3, 75, 'Disponivel'),
            (14, 4, 125, 'Disponivel'),
            (15, 5, 69, 'Disponivel');
            

insert into storageLocation (idLproduct, idLstorage, location)
	values	(11, 1, 'São paulo'),
			(12, 2, 'Parana'),
            (13, 3, 'Bahia'),
            (14, 4, 'Peruibe'),
            (15, 5, 'Maua');
            
 -- idLPsSupplier, idPsProduct, quantity 
insert into productSupplier (idLPsSupplier, idPsProduct, quantity)
	values	(6, 11, 150),
			(7, 12, 152),
            (8, 13, 99),
            (9, 14, 12),
            (10, 15, 7);
            
            
	select * from productStorage;
    select * from productSupplier;
    select * from productSeller;
    select count(*) from clients;
    select * from clients c, orders o where c.idClient = idOrderClient;
    select Fname, Lname idOrder, orderstatus from clients c, orders o where c.idClient = idorderClient;
    select concat(Fname, ' ', Lname) as Client, idOrder as Orders, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;
    
    select * from orders;
    select c.idClient, Fname, count(*) as Number_of_orders from clients c
			inner join orders o ON c.idClient = o.idOrderClient
		group by idclient;