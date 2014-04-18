DROP TABLE ProdFilter CASCADE
;
DROP TABLE CatFilter CASCADE
;
DROP TABLE Address CASCADE
;
DROP TABLE Filter CASCADE
;
DROP TABLE Category CASCADE
;
DROP TABLE Department CASCADE
;
DROP TABLE Review CASCADE
;
DROP TABLE OrderLine CASCADE
;
DROP TABLE Product CASCADE
;
DROP TABLE Transporter CASCADE
;
DROP TABLE State CASCADE
;
DROP TABLE Order CASCADE
;
DROP TABLE Buyer CASCADE
;
DROP TABLE User CASCADE
;

CREATE TABLE ProdFilter ( 
	idProduct serial NOT NULL,
	idFilter integer NOT NULL,
	value_string varchar(50),
	value_int integer,
	type integer NOT NULL
)
;

CREATE TABLE CatFilter ( 
	idCategory integer NOT NULL,
	idFilter integer NOT NULL
)
;

CREATE TABLE Address ( 
	idAddress serial NOT NULL,
	street text NOT NULL,
	door_nr text NOT NULL,
	postcode text NOT NULL,
	formatted_address text,
	idBuyer integer NOT NULL
)
;

CREATE TABLE Filter ( 
	idFilter serial NOT NULL,
	filter_name varchar(50) NOT NULL
)
;

CREATE TABLE Category ( 
	idCategory serial NOT NULL,
	name varchar(50) NOT NULL,
	idDepartment integer NOT NULL
)
;

CREATE TABLE Department ( 
	idDepartment serial NOT NULL,
	name varchar(50) NOT NULL
)
;

CREATE TABLE Review ( 
	idReview serial NOT NULL,
	rating integer NOT NULL,
	text text,
	reported boolean DEFAULT false NOT NULL,
	idOrder integer NOT NULL,
	idProduct integer NOT NULL
)
;

CREATE TABLE OrderLine ( 
	idProduct integer NOT NULL,
	idOrder integer NOT NULL,
	quantity integer NOT NULL,
	price_per_unit number NOT NULL
)
;

CREATE TABLE Product ( 
	idProduct serial NOT NULL,
	title varchar(50) NOT NULL,
	description text,
	price number NOT NULL,
	stock integer NOT NULL,
	removed boolean DEFAULT false NOT NULL,
	img text
)
;

CREATE TABLE Transporter ( 
	idTransporter serial NOT NULL,
	name varchar(50) NOT NULL,
	description text
)
;

CREATE TABLE State ( 
	idState serial NOT NULL
)
;

CREATE TABLE Order ( 
	idOrder serial NOT NULL,
	date_placed timestamp NOT NULL,
	date_shipped timestamp,
	observations text,
	idState integer NOT NULL,
	idTransporter integer NOT NULL,
	idAddress integer NOT NULL,
	idBuyer integer NOT NULL
)
;

CREATE TABLE Buyer ( 
	idUser integer NOT NULL,
	banned boolean DEFAULT false NOT NULL,
	nif bigint NOT NULL
)
;

CREATE TABLE User ( 
	idUser serial NOT NULL,
	email varchar(50) NOT NULL,
	password text NOT NULL,
	name varchar(50) NOT NULL,
	phone varchar(20),
	date_signed timestamp,
	birthdate timestamp,
	user_type integer NOT NULL
)
;


ALTER TABLE ProdFilter
	ADD CONSTRAINT CK_type CHECK (type between 0 and 1)
;
ALTER TABLE Category
	ADD CONSTRAINT UQ_Category_name UNIQUE (name)
;
ALTER TABLE Department
	ADD CONSTRAINT UQ_Department_name UNIQUE (name)
;
ALTER TABLE OrderLine
	ADD CONSTRAINT CK_quantity CHECK (quantity>0)
;
ALTER TABLE OrderLine
	ADD CONSTRAINT CK_price_per_unit CHECK (price_per_unit>=0)
;
ALTER TABLE Buyer
	ADD CONSTRAINT UQ_Buyer_nif UNIQUE (nif)
;
ALTER TABLE User
	ADD CONSTRAINT UQ_User_email UNIQUE (email)
;
ALTER TABLE User
	ADD CONSTRAINT CK_user_type CHECK (user_type between 0 and 2)
;
ALTER TABLE ProdFilter ADD CONSTRAINT PK_ProdFilter 
	PRIMARY KEY (idProduct, idFilter)
;


ALTER TABLE CatFilter ADD CONSTRAINT PK_CatFilter 
	PRIMARY KEY (idCategory, idFilter)
;


ALTER TABLE Address ADD CONSTRAINT PK_Address 
	PRIMARY KEY (idAddress)
;


ALTER TABLE Filter ADD CONSTRAINT PK_Filter 
	PRIMARY KEY (idFilter)
;


ALTER TABLE Category ADD CONSTRAINT PK_Category 
	PRIMARY KEY (idCategory)
;


ALTER TABLE Department ADD CONSTRAINT PK_Department 
	PRIMARY KEY (idDepartment)
;


ALTER TABLE Review ADD CONSTRAINT PK_Review 
	PRIMARY KEY (idReview)
;


ALTER TABLE OrderLine ADD CONSTRAINT PK_OrderLine 
	PRIMARY KEY (idProduct, idOrder)
;


ALTER TABLE Product ADD CONSTRAINT PK_Product 
	PRIMARY KEY (idProduct)
;


ALTER TABLE Transporter ADD CONSTRAINT PK_Transporter 
	PRIMARY KEY (idTransporter)
;


ALTER TABLE State ADD CONSTRAINT PK_State 
	PRIMARY KEY (idState)
;


ALTER TABLE Order ADD CONSTRAINT PK_Order 
	PRIMARY KEY (idOrder)
;


ALTER TABLE Buyer ADD CONSTRAINT PK_Buyer 
	PRIMARY KEY (idUser)
;


ALTER TABLE User ADD CONSTRAINT PK_User 
	PRIMARY KEY (idUser)
;




ALTER TABLE ProdFilter ADD CONSTRAINT FK_ProdFilter_Filter 
	FOREIGN KEY (idFilter) REFERENCES Filter (idFilter)
;

ALTER TABLE ProdFilter ADD CONSTRAINT FK_ProdFilter_Product 
	FOREIGN KEY (idProduct) REFERENCES Product (idProduct)
;

ALTER TABLE CatFilter ADD CONSTRAINT FK_CatFilter_Category 
	FOREIGN KEY (idCategory) REFERENCES Category (idCategory)
;

ALTER TABLE CatFilter ADD CONSTRAINT FK_CatFilter_Filter 
	FOREIGN KEY (idFilter) REFERENCES Filter (idFilter)
;

ALTER TABLE Address ADD CONSTRAINT FK_Address_Buyer 
	FOREIGN KEY (idBuyer) REFERENCES Buyer (idUser)
;

ALTER TABLE Category ADD CONSTRAINT FK_Category_Department 
	FOREIGN KEY (idDepartment) REFERENCES Department (idDepartment)
;

ALTER TABLE Review ADD CONSTRAINT FK_Review_Order 
	FOREIGN KEY (idOrder) REFERENCES Order (idOrder)
;

ALTER TABLE Review ADD CONSTRAINT FK_Review_Product 
	FOREIGN KEY (idProduct) REFERENCES Product (idProduct)
;

ALTER TABLE OrderLine ADD CONSTRAINT FK_OrderLine_Order 
	FOREIGN KEY (idOrder) REFERENCES Order (idOrder)
;

ALTER TABLE OrderLine ADD CONSTRAINT FK_OrderLine_Product 
	FOREIGN KEY (idProduct) REFERENCES Product (idProduct)
;

ALTER TABLE Order ADD CONSTRAINT FK_Order_Address 
	FOREIGN KEY (idAddress) REFERENCES Address (idAddress)
ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE Order ADD CONSTRAINT FK_Order_Buyer 
	FOREIGN KEY (idBuyer) REFERENCES Buyer (idUser)
ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE Order ADD CONSTRAINT FK_Order_State 
	FOREIGN KEY (idState) REFERENCES State (idState)
;

ALTER TABLE Order ADD CONSTRAINT FK_Order_Transporter 
	FOREIGN KEY (idTransporter) REFERENCES Transporter (idTransporter)
;

ALTER TABLE Buyer ADD CONSTRAINT FK_Buyer_User 
	FOREIGN KEY (idUser) REFERENCES User (idUser)
;
