
create table dbo.OrderManagement(
	OrderId int identity(1,1) primary key,
	BuyerId int not null,
    BuyerName varchar(100) not null,
    BuyerRole varchar(100) not null,
    ProductId int not null,
    ProductName varchar(100) not null,
    ProductBrand varchar(100) not null,
    ProductDescription varchar(500) not null,
    AmountRs int not null,
    Discount int not null,
    Category varchar(100) not null,
    ProductGender varchar(100) not null,
    PhotoUrl varchar(500) not null,
    AddedTime DateTime not null,
    IsCart int not null,
	OrderedTime DateTime,
	IsBuyed int
);