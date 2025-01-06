## Create a new database for "proappdata"
DROP DATABASE IF EXISTS `proappdata`;
CREATE DATABASE `proappdata`; 
USE `proappdata`;

## Create tables

# Create the table "customers"
CREATE TABLE `customers` (
    `Customer_ID` INT NOT NULL AUTO_INCREMENT,
    `Customer_FName` VARCHAR(50) NOT NULL,
    `Customer_LName` VARCHAR(50) NOT NULL,
    `Phone_Number` VARCHAR(20) NOT NULL,
    `Email` VARCHAR(100) NOT NULL UNIQUE,
    `Registration_Date` DATE NOT NULL,
    `Postal_Code` VARCHAR(20) NOT NULL,
    `City` VARCHAR(50) NOT NULL,
    `Country` VARCHAR(50) NOT NULL,
     PRIMARY KEY (`Customer_ID`)
);

# Create the table "tasks"
CREATE TABLE `tasks` (
    `Task_ID` INT NOT NULL AUTO_INCREMENT,
    `Customer_ID` INT NOT NULL,
    `Task_Type` VARCHAR(50) NOT NULL,
    `Details` TEXT,
    `Budget` DECIMAL(10,2) NOT NULL,
    `Task_Status` ENUM('Open', 'In Progress', 'Completed', 'Cancelled') DEFAULT 'Open' NOT NULL,
    `Creation_Date` DATE NOT NULL,
	 PRIMARY KEY (`Task_ID`),
     FOREIGN KEY (`Customer_ID`) REFERENCES customers(`Customer_ID`)
        ON UPDATE CASCADE
);

# Create the table "tradespeople"
CREATE TABLE `tradespeople` (
    `Tradesperson_ID` INT NOT NULL AUTO_INCREMENT ,
    `Tradesperson_FName` VARCHAR(50) NOT NULL,
    `Tradesperson_LName` VARCHAR(50) NOT NULL,
    `Occupation` VARCHAR(100) NOT NULL,
    `Experience_Level` ENUM('Apprentice', 'Master', 'Specialist') NOT NULL,
    `Email` VARCHAR(100) NOT NULL UNIQUE,
    `Phone_Number` VARCHAR(20) NOT NULL,
    `Registration_Date` DATE NOT NULL,
    `Postal_Code` VARCHAR(20) NOT NULL,
    `City` VARCHAR(50) NOT NULL,
    `Country` VARCHAR(50) NOT NULL,
	 PRIMARY KEY (`Tradesperson_ID`)
);

# Create the table "suppliers"
CREATE TABLE `suppliers` (
    `Supplier_ID` INT NOT NULL AUTO_INCREMENT,
    `Supplier_Name` VARCHAR(100) NOT NULL,
    `Contact_Person` VARCHAR(100) NOT NULL,
    `Phone_Number` VARCHAR(20) NOT NULL,
    `Email` VARCHAR(100) NOT NULL UNIQUE,
    `Registration_Date` DATE NOT NULL,
    `Postal_Code` VARCHAR(20) NOT NULL,
    `City` VARCHAR(50) NOT NULL,
    `Country` VARCHAR(50) NOT NULL,
     PRIMARY KEY (`Supplier_ID`)
);

# Create the table "materials"
CREATE TABLE `materials` (
    `Material_ID` INT NOT NULL AUTO_INCREMENT,
    `Supplier_ID` INT NOT NULL,
    `Material_Name` VARCHAR(100) NOT NULL,
    `Unit` VARCHAR(20) NOT NULL,
    `Unit_Price` DECIMAL(10,2) NOT NULL,
     PRIMARY KEY (`Material_ID`),
     FOREIGN KEY (`Supplier_ID`) REFERENCES suppliers(`Supplier_ID`)
        ON UPDATE CASCADE
);


# Create the table "training_providers"
CREATE TABLE `training_providers` (
    `Training_Provider_ID` INT NOT NULL AUTO_INCREMENT,
    `Provider_Name` VARCHAR(100) NOT NULL,
    `Contact_Person` VARCHAR(100) NOT NULL,
    `Phone_Number` VARCHAR(20) NOT NULL,
    `Email` VARCHAR(100) NOT NULL UNIQUE,
    `Postal_Code` VARCHAR(20) NOT NULL,
    `City` VARCHAR(50) NOT NULL,
    `Country` VARCHAR(50) NOT NULL,
     PRIMARY KEY (`Training_Provider_ID`)
);

# Create the table "certificates"
CREATE TABLE `certificates` (
    `Certificate_ID` INT NOT NULL AUTO_INCREMENT,
    `Certificate_Level` ENUM('Certificate I','Certificate II' , 'Certificate III', 'Certificate IV') NOT NULL,
	`Certificate_Description` VARCHAR(100) NOT NULL,
    `Validity_Period` INT NOT NULL DEFAULT 2,  # Default validity period is 2 years
    `Training_Provider_ID` INT NOT NULL,
     PRIMARY KEY (`Certificate_ID`),
     FOREIGN KEY (`Training_Provider_ID`) REFERENCES training_providers(`Training_Provider_ID`)
        ON UPDATE CASCADE
);

# Create the table "transactions" (Associative Entity)
CREATE TABLE `transactions` (
    `Offer_ID` INT NOT NULL AUTO_INCREMENT,
    `Task_ID` INT NOT NULL,
    `Tradesperson_ID` INT NOT NULL,
    `Offer_Amount` DECIMAL(10,2) NOT NULL,
    `Offer_Status` ENUM('Pending', 'Accepted', 'Rejected') DEFAULT 'Pending' NOT NULL,
    `Offer_Date` DATE NOT NULL,
    `Accepted_Date` DATE,
    `Completion_Date` DATE,
    `Rating_for_Tradesperson` INT CHECK (`Rating_for_Tradesperson` BETWEEN 1 AND 5),
    `Rating_for_Customer` INT CHECK (`Rating_for_Customer` BETWEEN 1 AND 5),
    `Feedback_from_Customer` TEXT,
    `Feedback_from_Tradesperson` TEXT,
     PRIMARY KEY (`Offer_ID`),
     FOREIGN KEY (`Task_ID`) REFERENCES tasks(`Task_ID`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (`Tradesperson_ID`) REFERENCES tradespeople(`Tradesperson_ID`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

# Create the table "task_materials" (Associative Entity)
CREATE TABLE `task_materials` (
    `Resource_ID` INT NOT NULL AUTO_INCREMENT,
    `Task_ID` INT NOT NULL,
    `Material_ID` INT NOT NULL,
    `Required_Quantity` DECIMAL(10,2) NOT NULL,
     PRIMARY KEY (`Resource_ID`),
     FOREIGN KEY (`Task_ID`) REFERENCES tasks(`Task_ID`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
     FOREIGN KEY (`Material_ID`) REFERENCES materials(`Material_ID`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
     UNIQUE (`Task_ID`, `Material_ID`)
);

# Create the table “tradesperson_certificates” (Associative Entity)
CREATE TABLE `tradesperson_certificates` (
    `CertHolder_ID` INT NOT NULL AUTO_INCREMENT,
    `Tradesperson_ID` INT NOT NULL,
    `Certificate_ID` INT NOT NULL,
    `Certificate_Number` VARCHAR(50),
    `Date_Obtained` DATE NOT NULL,
    `Expiry_Date` DATE,
     PRIMARY KEY (`CertHolder_ID`),
     FOREIGN KEY (`Tradesperson_ID`) REFERENCES tradespeople(`Tradesperson_ID`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
     FOREIGN KEY (`Certificate_ID`) REFERENCES certificates(`Certificate_ID`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
     UNIQUE (`Tradesperson_ID`, `Certificate_ID`)
);


## Insert dummy data (with the support of ChatGPT) into tables

# customers
INSERT INTO customers (Customer_ID, Customer_FName, Customer_LName, Phone_Number, Email, Registration_Date, Postal_Code, City, Country)
VALUES
(1, 'John', 'Smith', '0412345678', 'john.smith@example.com', '2024-01-15', '3000', 'Melbourne', 'Australia'),
(2, 'David', 'Lee', '0298765432', 'david.lee@example.com', '2024-03-05', '2000', 'Sydney', 'Australia'),
(3, 'Emily', 'Brown', '0887654321', 'emily.brown@example.com', '2024-05-25', '5000', 'Adelaide', 'Australia'),
(4, 'Olivia', 'Martin', '0488997766', 'olivia.martin@example.com', '2024-06-02', '6000', 'Perth', 'Australia'),
(5, 'Maria', 'Garcia', '+628123456789', 'maria.garcia@example.co.id', '2024-02-20', '10110', 'Jakarta', 'Indonesia'),
(6, 'Siti', 'Nurhaliza', '+628987654321', 'siti.nurhaliza@example.co.id', '2024-04-12', '40115', 'Bandung', 'Indonesia'),
(7, 'Noah', 'Wilson', '+628899776655', 'noah.wilson@example.co.id', '2024-06-03', '40115', 'Bandung', 'Indonesia'),
(8, 'Liam', 'Nguyen', '0414811966', 'liam.nguyen@example.com', '2024-06-01', '3000', 'Melbourne', 'Australia'),
(9, 'Emma', 'Clark', '0298765432', 'emma.clark@example.com', '2024-06-04', '2000', 'Sydney', 'Australia'),
(10, 'Mason', 'Lee', '+6286655443322', 'mason.lee@example.co.id', '2024-06-05', '15156', 'Tangerang', 'Indonesia');


# tradespeople
INSERT INTO tradespeople (Tradesperson_ID, Tradesperson_FName, Tradesperson_LName, Occupation, Experience_Level, 
Email, Phone_Number, Registration_Date, Postal_Code, City, Country)
VALUES
(1, 'Michael', 'Johnson', 'Electrician', 'Master', 'michael.johnson@example.com', '0400123456', '2023-12-01', '3000', 'Melbourne', 'Australia'),
(2, 'Daniel', 'Harris', 'Electrician', 'Apprentice', 'daniel.harris@example.com', '0455667788', '2024-05-01', '3000', 'Melbourne', 'Australia'),
(3, 'Emily', 'Davis', 'Plumber', 'Specialist', 'emily.davis@example.com', '0499001122', '2024-06-01', '3000', 'Melbourne', 'Australia'),
(4, 'James', 'Wilson', 'Plumber', 'Master', 'james.wilson@example.com', '0400334455', '2024-06-02', '3000', 'Melbourne', 'Australia'),
(5, 'Samantha', 'Williams', 'Carpenter', 'Specialist', 'samantha.williams@example.com', '0411222333', '2024-02-15', '2000', 'Sydney', 'Australia'),
(6, 'Sophia', 'Evans', 'Carpenter', 'Master', 'sophia.evans@example.com', '0411223344', '2024-06-01', '2000', 'Sydney', 'Australia'),
(7, 'Jessica', 'Taylor', 'Welder', 'Apprentice', 'jessica.taylor@example.com', '0422334455', '2024-04-05', '5000', 'Adelaide', 'Australia'),
(8, 'Mark', 'Anderson', 'Welder', 'Master', 'mark.anderson@example.com', '0422998877', '2024-06-01', '5000', 'Adelaide', 'Australia'),
(9, 'Ryan', 'Walker', 'HVAC Technician', 'Master', 'ryan.walker@example.com', '0466778899', '2024-05-03', '6000', 'Perth', 'Australia'),
(10, 'Laura', 'Scott', 'HVAC Technician', 'Apprentice', 'laura.scott@example.com', '0466778800', '2024-06-03', '6000', 'Perth', 'Australia'),
(11, 'Ahmad', 'Khan', 'Plumber', 'Apprentice', 'ahmad.khan@example.co.id', '+6281122334455', '2024-01-10', '10110', 'Jakarta', 'Indonesia'),
(12, 'Sarah', 'Lewis', 'Plumber', 'Master', 'sarah.lewis@example.co.id', '+6284433221100', '2024-05-02', '10110', 'Jakarta', 'Indonesia'),
(13, 'Budi', 'Santoso', 'Masonry Worker', 'Master', 'budi.santoso@example.co.id', '+6282233445566', '2024-03-20', '40115', 'Bandung', 'Indonesia'),
(14, 'Ayu', 'Putri', 'Electrician', 'Specialist', 'ayu.putri@example.co.id', '+6283322110099', '2024-05-04', '40115', 'Bandung', 'Indonesia'),
(15, 'Rina', 'Kurnia', 'Electrician', 'Apprentice', 'rina.kurnia@example.co.id', '+62866554433', '2024-05-05', '40115', 'Bandung', 'Indonesia'),
(16, 'Linda', 'Green', 'IT Specialist', 'Specialist', 'linda.green@example.co.id', '+6287788990011', '2024-05-07', '15156', 'Tangerang', 'Indonesia'),
(17, 'Rudi', 'Hartono', 'IT Specialist', 'Apprentice', 'rudi.hartono@example.co.id', '+6285566778899', '2024-06-01', '15156', 'Tangerang', 'Indonesia'),
(18, 'Oliver', 'Brown', 'Electrician', 'Apprentice', 'oliver.brown@example.com', '0400555666', '2024-05-15', '3000', 'Melbourne', 'Australia'),
(19, 'Ethan', 'White', 'Carpenter', 'Apprentice', 'ethan.white@example.com', '0411333444', '2024-05-20', '2000', 'Sydney', 'Australia'),
(20, 'Hasan', 'Setiawan', 'Plumber', 'Apprentice', 'hasan.setiawan@example.co.id', '+6287766554433', '2024-05-25', '10110', 'Jakarta', 'Indonesia');


# suppliers
INSERT INTO suppliers (Supplier_ID, Supplier_Name, Contact_Person, Phone_Number, Email, Registration_Date, Postal_Code, City, Country)
VALUES
(1, 'Melbourne Build Supply', 'Rebecca Wilson', '0399887766', 'contact@melbuildsupplies.com.au', '2023-11-20', '3000', 'Melbourne', 'Australia'),
(2, 'Sydney Electrical Wholesale', 'Peter Evans', '0299776655', 'sales@sydneyelectrical.com.au', '2024-01-25', '2000', 'Sydney', 'Australia'),
(3, 'Adelaide Metal Works', 'Steve Harris', '0888776655', 'contact@adelaidemetals.com.au', '2024-02-15', '5000', 'Adelaide', 'Australia'),
(4, 'Jakarta Hardware', 'Rahmat Hidayat', '+6283344556677', 'info@jakartahardware.co.id', '2023-12-15', '10110', 'Jakarta', 'Indonesia'),
(5, 'Bandung Stone Supplies', 'Dewi Anggraini', '+6285566778899', 'contact@bandungstone.co.id', '2024-03-10', '40115', 'Bandung', 'Indonesia'),
(6, 'Tangerang Tech Supplies', 'Siti Nurhayati', '+6286677889900', 'contact@tangerangtech.co.id', '2024-05-05', '15156', 'Tangerang', 'Indonesia');

# training_providers
INSERT INTO training_providers (Training_Provider_ID, Provider_Name, Contact_Person, Phone_Number, Email, Postal_Code, City, Country)
VALUES
(1, 'Sydney Trade Academy', 'Peter Johnson', '0299776655', 'contact@sydneytrade.edu.au', '2000', 'Sydney', 'Australia'),
(2, 'Jakarta Technical Institute', 'Rahmat Hidayat', '+622155667788', 'contact@jakartatech.id', '10110', 'Jakarta', 'Indonesia');

# materials
INSERT INTO materials (Material_ID, Supplier_ID, Material_Name, Unit, Unit_Price)
VALUES
(1, 1, 'Electrical Wires', 'Meter', 2.50),
(2, 1, 'Light Fixtures', 'Piece', 25.00),
(3, 1, 'Timber Planks', 'Piece', 15.00),
(4, 2, 'Door Frames', 'Piece', 200.00),
(5, 3, 'Metal Sheets', 'Piece', 50.00),
(6, 4, 'PVC Pipes', 'Meter', 1.75),
(7, 5, 'Granite Slabs', 'Square Meter', 120.00),
(8, 4, 'Bathroom Fixtures', 'Set', 250.00),
(9, 6, 'Wi-Fi Access Points', 'Piece', 150.00),
(10, 2, 'HVAC Air Filters', 'Piece', 30.00),
(11, 2, 'Refrigerant Coolant', 'Kilogram', 15.00),
(12, 2, 'Thermostat Units', 'Piece', 120.00);

# certificates
INSERT INTO certificates (Certificate_ID, Certificate_Level, Certificate_Description, Validity_Period, Training_Provider_ID)
VALUES
-- Certificates from Sydney Trade Academy (Provider_ID: 1)
(1, 'Certificate I', 'Basic Skills', 2, 1),
(2, 'Certificate II', 'Intermediate Skills', 2, 1),
(3, 'Certificate III', 'Advanced Skills', 2, 1),
(4, 'Certificate IV', 'Master Skills', 2, 1),

-- Certificates from Jakarta Technical Institute (Provider_ID: 2)
(5, 'Certificate I', 'Basic Skills', 2, 2),
(6, 'Certificate II', 'Intermediate Skills', 2, 2),
(7, 'Certificate III', 'Advanced Skills', 2, 2),
(8, 'Certificate IV', 'Master Skills', 2, 2);

# tradesperson_certificates
INSERT INTO tradesperson_certificates (CertHolder_ID, Tradesperson_ID, Certificate_ID, Certificate_Number, Date_Obtained, Expiry_Date)
VALUES
(1, 1, 4, 'T123456', '2023-12-10', '2025-12-10'),  -- Michael Johnson, Certificate IV
(2, 2, 2, 'T654321', '2024-05-10', '2026-05-10'),  -- Daniel Harris, Certificate II
(3, 3, 3, 'T112233', '2024-06-01', '2026-06-01'),  -- Emily Davis, Certificate III
(4, 4, 4, 'T445566', '2024-06-02', '2026-06-02'),  -- James Wilson, Certificate IV
(5, 5, 3, 'T778899', '2024-02-20', '2026-02-20'), -- Samantha Williams, Certificate III
(6, 6, 4, 'T334455', '2024-06-01', '2026-06-01'), -- Sophia Evans, Certificate IV
(7, 7, 2, 'T998877', '2024-04-10', '2026-04-10'), -- Jessica Taylor, Certificate II
(8, 8, 4, 'T665544', '2024-06-01', '2026-06-01'), -- Mark Anderson, Certificate IV
(9, 9, 4, 'T556677', '2024-05-05', '2026-05-05'), -- Ryan Walker, Certificate IV
(10, 10, 2, 'T889900', '2024-06-03', '2026-06-03'), -- Laura Scott, Certificate II
(11, 11, 6, 'T223344', '2024-01-15', '2026-01-15'), -- Ahmad Khan, Certificate II
(12, 12, 8, 'T112244', '2024-05-02', '2026-05-02'), -- Sarah Lewis, Certificate IV
(13, 13, 8, 'T667788', '2024-03-25', '2026-03-25'), -- Budi Santoso, Certificate IV
(14, 14, 7, 'T223344', '2024-05-04', '2026-05-04'),  -- Ayu Putri, Certificate III
(15, 15, 5, 'T778899', '2024-05-05', '2026-05-05'),  -- Rina Kurnia, Certificate I
(16, 16, 7, 'T334455', '2024-05-07', '2026-05-07'), -- Linda Green, Certificate III
(17, 17, 5, 'T667788', '2024-06-01', '2026-06-01'), -- Rudi Hartono, Certificate I
(18, 18, 2, 'T990011', '2024-05-16', '2026-05-16'),  -- Oliver Brown, Certificate II
(19, 19, 2, 'T880022', '2024-05-21', '2026-05-21'),  -- Ethan White, Certificate II
(20, 20, 6, 'T770033', '2024-05-26', '2026-05-26');  -- Hasan Setiawan, Certificate II

# tasks
INSERT INTO tasks (Task_ID, Customer_ID, Task_Type, Details, Budget, Task_Status, Creation_Date)
VALUES
(1, 1, 'Electrical', 'Need to rewire the kitchen and install new outlets.', 1500.00, 'Completed', '2024-06-01'),
(2, 2, 'Carpentry', 'Build a custom bookshelf for the study room.', 1200.00, 'Completed', '2024-06-10'),
(3, 3, 'Welding', 'Repair the metal fence in the backyard.', 500.00, 'Completed', '2024-06-20'),
(4, 8, 'Electrical', 'Install new LED lighting in the living room and kitchen.', 1000.00, 'Completed', '2024-06-06'),
(5, 4, 'HVAC', 'Service and maintenance of the air conditioning system.', 600.00, 'Completed', '2024-06-07'),
(6, 5, 'Plumbing', 'Install new pipes for bathroom renovation.', 800.00, 'Completed', '2024-06-05'),
(7, 6, 'Masonry', 'Install granite countertops in the kitchen.', 2000.00, 'Completed', '2024-06-15'),
(8, 7, 'Electrical', 'Install new bathroom light fixtures.', 700.00, 'Completed', '2024-06-08'),
(9, 9, 'Plumbing', 'Fix leaking pipe under the kitchen sink.', 300.00, 'Cancelled', '2024-06-12'),
(10, 10, 'IT Specialist', 'Set up a home network and configure Wi-Fi access points.', 800.00, 'Cancelled', '2024-06-10');

# task_materials
INSERT INTO task_materials (Resource_ID, Task_ID, Material_ID, Required_Quantity)
VALUES
(1, 1, 1, 200),  -- Electrical Wires
(2, 1, 2, 10),   -- Light Fixtures
(3, 2, 3, 30),   -- Timber Planks
(4, 3, 5, 5),    -- Metal Sheets
(5, 4, 2, 15),   -- Light Fixtures
(6, 5, 10, 2),  -- HVAC Air Filters
(7, 5, 11, 5),  -- Refrigerant Coolant
(8, 5, 12, 1),  -- Thermostat Units
(9, 6, 6, 100),  -- PVC Pipes
(10, 7, 7, 15),   -- Granite Slabs
(11, 8, 2, 5),    -- Light Fixtures
(12, 9, 6, 5),    -- PVC Pipes
(13, 10, 9, 3);   -- Wi-Fi Access Points

# transaction
INSERT INTO transactions (Offer_ID, Task_ID, Tradesperson_ID, Offer_Amount, Offer_Status, Offer_Date, Accepted_Date, Completion_Date, 
Rating_for_Tradesperson, Rating_for_Customer, Feedback_from_Customer, Feedback_from_Tradesperson)
VALUES
(1, 1, 1, 1400.00, 'Accepted', '2024-06-02', '2024-06-03','2024-06-07', 5, 5, 'Excellent work!', 'Great client!'), -- Michael Johnson (Master Electrician)
(2, 1, 2, 1300.00, 'Rejected', '2024-06-02', NULL, NULL, NULL, NULL, NULL, NULL), -- Daniel Harris (Apprentice Electrician)
(3, 2, 5, 1150.00, 'Accepted', '2024-06-11', '2024-06-12', '2024-06-18', 5, 5, 'Beautiful craftsmanship!', 'Enjoyed the project.'), -- Samantha Williams (Specialist Carpenter)
(4, 2, 6, 1200.00, 'Rejected', '2024-06-11', NULL, NULL, NULL, NULL, NULL, NULL), -- Sophia Evans (Master Carpenter)
(5, 3, 8, 480.00, 'Accepted', '2024-06-21', '2024-06-22', '2024-06-24', 5, 5, 'Fence repaired perfectly.', 'Happy to help!'),-- Mark Anderson (Master Welder)
(6, 3, 7, 450.00, 'Rejected', '2024-06-21', NULL, NULL, NULL, NULL, NULL, NULL), -- Jessica Taylor (Apprentice Welder)
(7, 4, 2, 950.00, 'Accepted', '2024-06-07', '2024-06-08', '2024-06-10', 4, 5, 'Good job, minor delays.', 'Glad to assist.'), -- Daniel Harris (Apprentice Electrician)
(8, 4, 1, 1700.00, 'Rejected', '2024-06-07', NULL, NULL, NULL, NULL, NULL, NULL), -- Michael Johnson (Master Electrician)
(9, 5, 9, 550.00, 'Accepted', '2024-06-08', '2024-06-09', '2024-06-11', 5, 5, 'HVAC system runs smoothly now.', 'Happy to help.'), -- Ryan Walker (Master HVAC Technician)
(10, 5, 10, 500.00, 'Rejected', '2024-06-08', NULL, NULL, NULL, NULL, NULL, NULL), -- Laura Scott (Apprentice HVAC Technician)
(11, 6, 11, 750.00, 'Accepted', '2024-06-06', '2024-06-07', '2024-06-10', 2, 2, 'Work completed but not up to standard.', 'Faced some challenges.'), -- Ahmad Khan (Apprentice Plumber)
(12, 6, 12, 1500.00, 'Rejected', '2024-06-06', NULL, NULL, NULL, NULL, NULL, NULL), -- Sarah Lewis (Master Plumber)
(13, 7, 13, 1950.00, 'Accepted', '2024-06-16', '2024-06-17', '2024-06-22', 5, 5, 'Countertops look amazing!', 'Glad to help!'),-- Budi Santoso (Master Masonry Worker)
(14, 7, 11, 2000.00, 'Rejected', '2024-06-16', NULL, NULL, NULL, NULL, NULL, NULL), -- Ahmad Khan (Apprentice Plumber)
(15, 8, 14, 650.00, 'Accepted', '2024-06-09', '2024-06-10', '2024-06-12', 5, 5, 'Fixtures installed perfectly.', 'Great client to work with.'), -- Ayu Putri (Specialist Electrician)
(16, 8, 15, 600.00, 'Rejected', '2024-06-09', NULL, NULL, NULL, NULL, NULL, NULL), -- Rina Kurnia (Apprentice Electrician)
(17, 9, 12, 280.00, 'Rejected', '2024-06-13', NULL, NULL, NULL, NULL, NULL, NULL), -- Sarah Lewis (Master Plumber)
(18, 9, 11, 250.00, 'Rejected', '2024-06-13', NULL, NULL, NULL, NULL, NULL, NULL), -- Ahmad Khan (Apprentice Plumber)
(19, 10, 16, 750.00, 'Rejected', '2024-06-11', NULL, NULL, NULL, NULL, NULL, NULL), -- Linda Green (Specialist IT Specialist)
(20, 10, 17, 700.00, 'Rejected', '2024-06-11', NULL, NULL, NULL, NULL, NULL, NULL), -- Rudi Hartono (Apprentice IT Specialist)
(21, 1, 18, 1250.00, 'Rejected', '2024-06-02', NULL, NULL, NULL, NULL, NULL, NULL), -- Oliver Brown (Apprentice Electrician)
(22, 2, 19, 1100.00, 'Rejected', '2024-06-11', NULL, NULL, NULL, NULL, NULL, NULL), -- Ethan White (Apprentice Carpenter)
(23, 6, 20, 700.00, 'Rejected', '2024-06-06', NULL, NULL, NULL, NULL, NULL, NULL); -- Hasan Setiawan (Apprentice Plumber)


## Business insights and views

# Insight 1: The impact of tradesperson experience level on offer acceptance rates
CREATE VIEW acceptance_rate_by_experience AS
SELECT
    trppl.Experience_Level,
    COUNT(ts.Offer_ID) AS Total_Offers,
    COUNT(CASE WHEN ts.Offer_Status = 'Accepted' THEN 1 END) AS Accepted_Offers,
    ROUND(
        (COUNT(CASE WHEN ts.Offer_Status = 'Accepted' THEN 1 END) * 100.0) / 
        COUNT(ts.Offer_ID), 2
    ) AS Acceptance_Rate_Percentage
FROM tradespeople trppl
	JOIN transactions ts ON trppl.Tradesperson_ID = ts.Tradesperson_ID
GROUP BY trppl.Experience_Level
ORDER BY trppl.Experience_Level;


# Insight 2.1: Customer satisfaction ratings across tradesperson experience levels
CREATE VIEW customer_satisfaction_ratings_tradesperson_exp AS
SELECT
    trppl.Experience_Level,
    ROUND(AVG(ts.Rating_for_Tradesperson), 2) AS Average_Customer_Rating,
    COUNT(ts.Offer_ID) AS Number_of_Ratings
    
FROM tradespeople trppl
	JOIN transactions ts ON trppl.Tradesperson_ID = ts.Tradesperson_ID
WHERE ts.Rating_for_Tradesperson IS NOT NULL
GROUP BY trppl.Experience_Level
ORDER BY trppl.Experience_Level;

# Insight 2.2: Feedback between customers and tradespeople
CREATE VIEW feedback_between_customers_tradespeople AS
SELECT
    ts.Offer_ID,
    trppl.Experience_Level,
    ts.Rating_for_Customer,
    ts.Rating_for_Tradesperson,
    ts.Feedback_from_Customer AS Feedback_for_Tradesperson,
    ts.Feedback_from_Tradesperson AS Feedback_for_Customer
    
FROM transactions ts
    JOIN tasks ta ON ts.Task_ID = ta.Task_ID
    JOIN customers cu ON ta.Customer_ID = cu.Customer_ID
    JOIN tradespeople trppl ON ts.Tradesperson_ID = trppl.Tradesperson_ID
    
WHERE ts.Rating_for_Customer IS NOT NULL OR ts.Rating_for_Tradesperson IS NOT NULL
ORDER BY ts.Rating_for_Tradesperson DESC;


# Insight 3: Tradespeople performance based on certification levels
CREATE VIEW tradespeople_performance_certificate AS
SELECT
    ce.Certificate_Level,
    ce.Certificate_Description AS `Description`,
    COUNT(DISTINCT tc.Tradesperson_ID) AS Number_of_Tradespeople,
    COUNT(ts.Offer_ID) AS Number_of_Offers,
    COUNT(CASE WHEN ts.Offer_Status = 'Accepted' THEN 1 END) AS Accepted_Offers,
    ROUND(AVG(ts.Rating_for_Tradesperson), 2) AS Average_Customer_Rating
FROM certificates ce
	JOIN tradesperson_certificates tc ON ce.Certificate_ID = tc.Certificate_ID
	LEFT JOIN transactions ts ON tc.Tradesperson_ID = ts.Tradesperson_ID
GROUP BY
    ce.Certificate_Level, ce.Certificate_Description
ORDER BY
    ce.Certificate_Level DESC;

# Insight 4: Engagement levels of registered tradespeople in their first 30 days
CREATE VIEW tradespeople_engagement_levels AS
SELECT
    trppl.Tradesperson_ID,
    CONCAT(trppl.Tradesperson_FName, ' ', trppl.Tradesperson_LName) AS Tradesperson_Name,
    trppl.Registration_Date,
    COUNT(ts.Offer_ID) AS Total_Offers_Made,
    SUM(CASE WHEN ts.Offer_Status = 'Accepted' THEN 1 ELSE 0 END) AS Offers_Accepted,
    SUM(CASE WHEN ts.Offer_Status = 'Rejected' THEN 1 ELSE 0 END) AS Offers_Rejected
    
FROM tradespeople trppl
     LEFT JOIN transactions ts ON ts.Tradesperson_ID = ts.Tradesperson_ID
	 AND ts.Offer_Date BETWEEN trppl.Registration_Date AND DATE_ADD(trppl.Registration_Date, INTERVAL 30 DAY)
GROUP BY trppl.Tradesperson_ID
ORDER BY trppl.Registration_Date DESC;

# Insight 5: Utilization of the platform by registered customers
CREATE VIEW customers_utilization AS
SELECT
    cu.Customer_ID,
    CONCAT(cu.Customer_FName, ' ', cu.Customer_LName) AS Customer_Name,
    cu.Registration_Date,
    COUNT(ts.Task_ID) AS Tasks_Created,
    SUM(CASE WHEN ta.Task_Status = 'Completed' THEN 1 ELSE 0 END) AS Tasks_Completed,
    SUM(CASE WHEN ta.Task_Status = 'Cancelled' THEN 1 ELSE 0 END) AS Tasks_Cancelled,
    MIN(ts.Offer_Date) AS First_Transaction_Date,
    DATEDIFF(MIN(ts.Offer_Date), cu.Registration_Date) AS Days_to_First_Transaction
FROM
    customers cu
    LEFT JOIN tasks ta ON cu.Customer_ID = ta.Customer_ID
    LEFT JOIN transactions ts ON ta.Task_ID = ts.Task_ID
GROUP BY
    cu.Customer_ID, cu.Registration_Date
ORDER BY
    Days_to_First_Transaction;

# Insight 6: Geographical distribution of tradespeople and customers with ratings
CREATE VIEW geographical_distribution_with_ratings AS
WITH city_list AS (
    SELECT DISTINCT City FROM customers cu
    UNION
    SELECT DISTINCT City FROM tradespeople trppl
),
tradespeople_count AS (
    SELECT City, COUNT(*) AS Number_of_Tradespeople 
    FROM tradespeople trppl
    GROUP BY City
),
customer_count AS (
    SELECT City, COUNT(*) AS Number_of_Customers 
    FROM customers cu
    GROUP BY City
),
transaction_data AS (
    SELECT 
        trppl.City,
        COUNT(ts.Offer_ID) AS Number_of_Transactions,
        ROUND(AVG(ts.Rating_for_Tradesperson), 2) AS Avg_Customer_Rating
    FROM tradespeople trppl
    LEFT JOIN transactions ts ON trppl.Tradesperson_ID = ts.Tradesperson_ID
    WHERE ts.Rating_for_Tradesperson IS NOT NULL
    GROUP BY trppl.City
)
SELECT
    c.City,
    COALESCE(tc.Number_of_Tradespeople, 0) AS Number_of_Tradespeople,
    COALESCE(cc.Number_of_Customers, 0) AS Number_of_Customers,
    COALESCE(tc.Number_of_Tradespeople, 0) - COALESCE(cc.Number_of_Customers, 0) AS Tradespeople_Customer_Difference,
    COALESCE(td.Number_of_Transactions, 0) AS Number_of_Transactions,
    COALESCE(td.Avg_Customer_Rating, 0) AS Average_Customer_Rating
FROM city_list c
LEFT JOIN tradespeople_count tc ON c.City = tc.City
LEFT JOIN customer_count cc ON c.City = cc.City
LEFT JOIN transaction_data td ON c.City = td.City
ORDER BY Average_Customer_Rating DESC;

# Insight 7: Supplier performance across completed tasks
CREATE VIEW supplier_performance AS
SELECT 
    s.Supplier_ID,
    s.Supplier_Name,
    COUNT(DISTINCT ta.Task_ID) AS Tasks_Supplied,
    AVG(DATEDIFF(ts.Completion_Date, ta.Creation_Date)) AS Average_Task_Completion_Time,
    SUM(m.Unit_Price * tm.Required_Quantity) AS Total_Material_Cost,
    AVG(ts.Rating_for_Tradesperson) AS Average_Task_Rating
FROM  suppliers s
    JOIN materials m ON s.Supplier_ID = m.Supplier_ID
    JOIN task_materials tm ON m.Material_ID = tm.Material_ID
    JOIN tasks ta ON tm.Task_ID = ta.Task_ID
    JOIN transactions ts ON ta.Task_ID = ts.Task_ID
WHERE 
    ta.Task_Status = 'Completed' AND ts.Offer_Status = 'Accepted'
GROUP BY 
    s.Supplier_ID, s.Supplier_Name
ORDER BY 
    Tasks_Supplied DESC, Average_Task_Rating DESC;
    
    
    
    
