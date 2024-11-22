USE CarDealership;

CREATE TABLE Dealerships (
DealershipID int NOT NULL AUTO_INCREMENT,
`Name` varchar(50),
Address varchar(50),
Phone varchar(15),
PRIMARY KEY (DealershipID)
);

CREATE TABLE Vehicles (
VIN varchar(17) NOT NULL,
Make varchar(30),
Model varchar(30),
Color varchar(10),
VehicleType varchar(20),
Sold boolean,
PRIMARY KEY (VIN)
);

CREATE TABLE Inventory (
InventoryID INT NOT NULL AUTO_INCREMENT,
DealershipID INT NOT NULL,
VIN VARCHAR(17) NOT NULL,
PRIMARY KEY (InventoryID),
FOREIGN KEY (DealershipID) REFERENCES Dealerships(DealershipID),
FOREIGN KEY (VIN) REFERENCES Vehicles(VIN)
);

CREATE TABLE SalesContract (
ContractID int NOT NULL AUTO_INCREMENT,
CustomerFirstName varchar(50),
CustomerLastName varchar(50),
PRIMARY KEY (ContractID),
FOREIGN KEY (VIN) REFERENCES Vehicles(VIN)
);

-- Input data into dealership table using insert statements. 
INSERT INTO Dealerships (`Name`, Address, Phone)
VALUES 
('Tay\'s Auto', '2020 Vision St.', '817-444-2020'), 
('Auto World', '1515 Loco Dr.', '682-502-1515'),
('Affordable Drive', '204 Cruising Ln', '222-999-5551'),
('Speedy Autos', '123 Main St, Springfield', '555-123-4567'),
('Luxury Rides', '456 Elm St, Shelbyville', '555-987-6543'),
('Economy Wheels', '789 Oak St, Capital City', '555-321-9876');

-- Insert data into vehiles table
INSERT INTO Vehicles (VIN, Make, Model, Color, VehicleType, Sold)
VALUES
('1HGCM82633A123456', 'Honda', 'Civic', 'Blue', 'Sedan', FALSE),
('2FTRX18W1XCA54321', 'Ford', 'F-150', 'Black', 'Truck', TRUE),
('5XYZT3LB0DG456789', 'Hyundai', 'Santa Fe', 'Red', 'SUV', FALSE),
('3VWPL7AJ9EM765432', 'Volkswagen', 'Jetta', 'White', 'Sedan', TRUE),
('1J4FA49S8YP987654', 'Jeep', 'Wrangler', 'Green', 'SUV', FALSE);

-- Input data into inventory table
INSERT INTO Inventory (DealershipID, VIN)
VALUES
(1, '1HGCM82633A123456'), -- Tay's Auto owns Honda Civic
(1, '2FTRX18W1XCA54321'), -- Tay's Auto owns Ford F-150
(2, '5XYZT3LB0DG456789'), -- Auto World owns Hyundai Santa Fe
(2, '3VWPL7AJ9EM765432'), -- Auto World owns Volkswagen Jetta
(3, '1J4FA49S8YP987654'); -- Affordable Drive owns Jeep Wrangler


-- Insert data to SalesContrat
INSERT INTO SalesContract (CustomerFirstName, CustomerLastName, VIN)
VALUES
('John', 'Doe', '2FTRX18W1XCA54321'), -- Ford F-150 sold by Tay's Auto
('Jane', 'Smith', '3VWPL7AJ9EM765432'); -- Volkswagen Jetta sold by Auto World



