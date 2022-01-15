
create table dbo.Products(
	ProductId int identity(1,1) primary key,
	ProductName varchar(100) not null,
	SupplierId int not null,
	SupplierName varchar(100) not null,
	ProductBrand varchar(100) not null,
	ProductDescription varchar(500) not null,
	AmountRs int not null,
	OriginalPrice int not null,
	Discount int not null,
	Category varchar(100) not null,
	Gender varchar(100) not null,
	PhotoUrl varchar(5000) not null,
	PhotoPublicId varchar(5000) not null
);

Alter Table dbo.Products add Quantity int null;