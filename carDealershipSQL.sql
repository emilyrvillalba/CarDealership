CREATE TABLE GenericCar (
	GenericCarID INT PRIMARY KEY,
    Make VARCHAR(30) NOT NULL,
    Model VARCHAR(30) NOT NULL,
    YearMade INT NOT NULL,
    CarDescription VARCHAR(100),
    BodyStyle VARCHAR(30),
    CHECK (BodyStyle = 'sedan' OR BodyStyle = 'convertible' OR BodyStyle='van' OR BodyStyle = 'truck' OR BodyStyle = 'suv' OR BodyStyle = 'coupe'),
    Quantity INT DEFAULT 0,
    OnOrder BOOLEAN DEFAULT 0
);
CREATE TABLE CarOnLot (
    VIN VARCHAR(17) PRIMARY KEY,
    GenericCarID INT,
    MinPrice INT,
    Color VARCHAR(30),
    CarCondition VARCHAR(30),
    CHECK (CarCondition = 'Used' OR CarCondition = 'New'),
    Mileage INT,
    YearsOnLot INT DEFAULT 0,
    FOREIGN KEY (GenericCarID) REFERENCES GenericCar (GenericCarID)
);
CREATE TABLE SoldCar (
    VIN VARCHAR(17) PRIMARY KEY,
    GenericCarID INT,
    OwnerName VARCHAR(30),
    DateSold VARCHAR(30),
    FOREIGN KEY (GenericCarID) REFERENCES GenericCar (GenericCarID)
);
CREATE TABLE SalesAccount (
	SalesID INT PRIMARY KEY,
    SalesPassword VARCHAR(30),
    SalesName VARCHAR(30),
    address VARCHAR(50),
    phoneNumber VARCHAR(10),
    email VARCHAR(30)
);
CREATE TABLE Commission(
	VIN VARCHAR(17),
    SalesID INT,
    Commission FLOAT(2),
    CHECK (Commission > 0 AND Commission <= 1),
    PRIMARY KEY (VIN, SalesID),
    FOREIGN KEY (VIN) REFERENCES SoldCar (VIN),
    FOREIGN KEY (SalesID) REFERENCES SalesAccount (SalesID)
);
CREATE TABLE Warranty(
	VIN VARCHAR(17) PRIMARY KEY,
    expiration DATE,
    FOREIGN KEY (VIN) REFERENCES CarOnLot (VIN)
);
CREATE TABLE ServiceRecord(
	VIN VARCHAR(17) PRIMARY KEY,
    service VARCHAR(30),
    dateServiced DATE,
    cost FLOAT,
    mileage INT,
    FOREIGN KEY (VIN) REFERENCES CarOnLot (VIN)
);
SELECT*FROM Genericcar;
SELECT*FROM caronlot;
SELECT*FROM soldCar;
SELECT*FROM salesaccount;