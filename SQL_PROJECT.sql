-- Create the database
CREATE DATABASE HotelManagement;

-- Switch to the new database
USE HotelManagement;

-- Guests Table
CREATE TABLE Guests (
    Guest_ID VARCHAR(10) PRIMARY KEY,
    Guest_Name VARCHAR(50),
    Guest_Email VARCHAR(50),
    Guest_Phone VARCHAR(15),
    Guest_Address VARCHAR(100)
);

-- Reservations Table
CREATE TABLE Reservations (
    Reservation_ID VARCHAR(10) PRIMARY KEY,
    Guest_ID VARCHAR(10),
    Check_In_Date DATE,
    Check_Out_Date DATE,
    Num_Of_Guests INT,
    Special_Requests TEXT,
    FOREIGN KEY (Guest_ID) REFERENCES Guests(Guest_ID)
);

-- Room Types Table
CREATE TABLE Room_Types (
    Room_Type_ID VARCHAR(10) PRIMARY KEY,
    Room_Name VARCHAR(50),
    Room_Description TEXT,
    Room_Price DECIMAL(10, 2),
    Max_Occupancy INT,
    Room_Amenities TEXT
);

-- Rooms Table
CREATE TABLE Rooms (
    Room_ID VARCHAR(10) PRIMARY KEY,
    Room_Type_ID VARCHAR(10),
    Room_Number INT,
    Floor_Number INT,
    Availability VARCHAR(10),
    Cleaning_Status VARCHAR(10),
    FOREIGN KEY (Room_Type_ID) REFERENCES Room_Types(Room_Type_ID)
);

-- Room Assignments Table
CREATE TABLE Room_Assignments (
    Room_Assignment_ID VARCHAR(10) PRIMARY KEY,
    Reservation_ID VARCHAR(10),
    Room_ID VARCHAR(10),
    Check_In_Date DATE,
    Check_Out_Date DATE,
    FOREIGN KEY (Reservation_ID) REFERENCES Reservations(Reservation_ID),
    FOREIGN KEY (Room_ID) REFERENCES Rooms(Room_ID)
);

-- Billing Table
CREATE TABLE Billing (
    Billing_ID VARCHAR(10) PRIMARY KEY,
    Guest_ID VARCHAR(10),
    Reservation_ID VARCHAR(10),
    Total_Amount DECIMAL(10, 2),
    Billing_Date DATE,
    Payment_Status VARCHAR(10),
    FOREIGN KEY (Guest_ID) REFERENCES Guests(Guest_ID),
    FOREIGN KEY (Reservation_ID) REFERENCES Reservations(Reservation_ID)
);

-- Payments Table
CREATE TABLE Payments (
    Payment_ID VARCHAR(10) PRIMARY KEY,
    Guest_ID VARCHAR(10),
    Billing_ID VARCHAR(10),
    Payment_Amount DECIMAL(10, 2),
    Payment_Date DATE,
    Payment_Method VARCHAR(20),
    FOREIGN KEY (Guest_ID) REFERENCES Guests(Guest_ID),
    FOREIGN KEY (Billing_ID) REFERENCES Billing(Billing_ID)
);

-- Inventory Table
CREATE TABLE Inventory (
    Item_ID VARCHAR(10) PRIMARY KEY,
    Product_Name VARCHAR(50),
    Description TEXT,
    Quantity INT,
    Unit_Price DECIMAL(10, 2),
    Record_Level VARCHAR(10),
    Supplier VARCHAR(50)
);

-- Insert sample data into Guests
INSERT INTO Guests (Guest_ID, Guest_Name, Guest_Email, Guest_Phone, Guest_Address) VALUES
('G001', 'John Doe', 'johndoe@example.com', '1234567890', '1234 Elm Street, Somewhere, NY 10001'),
('G002', 'Jane Smith', 'janesmith@example.com', '2345678901', '2345 Maple Street, Anytown, CA 90210'),
('G003', 'Alice Johnson', 'alicej@example.com', '3456789012', '3456 Oak Street, Nowhere, TX 70007'),
('G004', 'Robert Frost', 'rfrost@example.com', '4567890123', '4567 Birch Street, Coldtown, AK 99701'),
('G005', 'Emily Blunt', 'eblunt@example.com', '5678901234', '5678 Cedar Ave, Bright City, NV 89001'),
('G006', 'Michael Bay', 'mbay@example.com', '6789012345', '6789 Spruce Way, Filmtown, CA 94016'),
('G007', 'Olivia Wilde', 'owilde@example.com', '7890123456', '7890 Pine Road, Star City, CA 90001'),
('G008', 'Harry Potter', 'hpotter@example.com', '8901234567', '8901 Wizard Ave, Magic Town, MA 02138'),
('G009', 'Hermione Granger', 'hgranger@example.com', '9012345678', '9012 Spell Blvd, Witchcity, MA 02139'),
('G010', 'Ron Weasley', 'rweasley@example.com', '0123456789', '0123 Broomstick Lane, Quidditch, MA 02140'),
('G011', 'Lisa Black', 'lblack@example.com', '1234506789', '1235 Onyx Street, Dark City, TX 75001'),
('G012', 'Mark White', 'mwhite@example.com', '2345617890', '2346 Quartz Ave, Shinytown, TX 75002'),
('G013', 'Sarah Green', 'sgreen@example.com', '3456728901', '3457 Emerald St, Greenvale, TX 75003'),
('G014', 'Jake Blue', 'jblue@example.com', '4567839012', '4568 Sapphire Way, Blueville, TX 75004'),
('G015', 'Charlie Brown', 'charlieb@example.com', '5678940123', '5678 Pine Street, Tinytown, FL 33033');



-- Insert sample data into Reservations
INSERT INTO Reservations (Reservation_ID, Guest_ID, Check_In_Date, Check_Out_Date, Num_Of_Guests, Special_Requests) VALUES
('R001', 'G001', '2024-05-01', '2024-05-05', 2, 'Near the pool'),
('R002', 'G002', '2024-05-02', '2024-05-06', 1, 'High floor'),
('R003', 'G003', '2024-05-03', '2024-05-07', 3, 'Quiet room'),
('R004', 'G004', '2024-05-04', '2024-05-08', 2, 'Non-smoking'),
('R005', 'G005', '2024-05-05', '2024-05-09', 1, 'Early check-in'),
('R006', 'G006', '2024-05-06', '2024-05-10', 4, 'Close to elevator'),
('R007', 'G007', '2024-05-07', '2024-05-11', 2, 'Balcony room'),
('R008', 'G008', '2024-05-08', '2024-05-12', 1, 'Corner room'),
('R009', 'G009', '2024-05-09', '2024-05-13', 3, 'Allergy-free room'),
('R010', 'G010', '2024-05-10', '2024-05-14', 1, 'Accessible room'),
('R011', 'G011', '2024-05-11', '2024-05-15', 2, 'City view'),
('R012', 'G012', '2024-05-12', '2024-05-16', 1, 'Away from noise'),
('R013', 'G013', '2024-05-13', '2024-05-17', 2, 'Extra pillows'),
('R014', 'G014', '2024-05-14', '2024-05-18', 3, 'Adjacent rooms'),
('R015', 'G015', '2024-06-10', '2024-06-15', 1, 'Away from elevator');




-- Insert sample data into Room Types
INSERT INTO Room_Types (Room_Type_ID, Room_Name, Room_Description, Room_Price, Max_Occupancy, Room_Amenities) VALUES
('RT001', 'Single', 'One single bed', 100.00, 1, 'TV, WiFi'),
('RT002', 'Double', 'Two single beds', 150.00, 2, 'TV, WiFi, Mini Fridge'),
('RT003', 'Queen', 'One queen-sized bed', 180.00, 2, 'TV, WiFi, Mini Fridge'),
('RT004', 'King', 'One king-sized bed', 200.00, 2, 'TV, WiFi, Mini Fridge, Sofa'),
('RT005', 'Deluxe', 'One king-sized bed with a view', 220.00, 2, 'TV, WiFi, Mini Fridge, Balcony'),
('RT006', 'Studio', 'Open-plan layout with a kitchenette', 240.00, 2, 'TV, WiFi, Kitchenette, Sofa'),
('RT007', 'Junior Suite', 'Separate bedroom and living area', 300.00, 3, 'TV, WiFi, Mini Fridge, Sofa'),
('RT008', 'Executive Suite', 'Separate bedroom and living area with a desk', 350.00, 3, 'TV, WiFi, Mini Fridge, Desk'),
('RT009', 'Family Suite', 'Two bedrooms with a living area', 380.00, 4, 'TV, WiFi, Mini Fridge, Sofa'),
('RT010', 'Honeymoon Suite', 'Romantic decor and jacuzzi', 400.00, 2, 'TV, WiFi, Mini Fridge, Jacuzzi'),
('RT011', 'Business Suite', 'Dedicated workspace and meeting area', 420.00, 3, 'TV, WiFi, Desk, Conference Table'),
('RT012', 'Luxury Suite', 'Top-floor suite with high-end amenities', 450.00, 4, 'TV, WiFi, Mini Fridge, Kitchenette'),
('RT013', 'Royal Suite', 'Spacious suite with regal decor', 480.00, 4, 'TV, WiFi, Mini Fridge, Dining Area'),
('RT014', 'Presidential Suite', 'Luxurious top-floor suite with panoramic views', 500.00, 4, 'TV, WiFi, Kitchenette, Jacuzzi'),
('RT015', 'Penthouse Suite', 'Luxurious, multi-room suite with private terrace', 550.00, 5, 'TV, WiFi, Kitchenette, Terrace');


-- Insert sample data into Rooms
INSERT INTO Rooms (Room_ID, Room_Type_ID, Room_Number, Floor_Number, Availability, Cleaning_Status) VALUES
('RM001', 'RT001', 101, 1, 'Yes', 'Clean'),
('RM002', 'RT002', 102, 1, 'No', 'Clean'),
('RM003', 'RT003', 201, 2, 'Yes', 'Dirty'),
('RM004', 'RT004', 202, 2, 'Yes', 'Clean'),
('RM005', 'RT005', 301, 3, 'No', 'Clean'),
('RM006', 'RT006', 302, 3, 'Yes', 'Clean'),
('RM007', 'RT007', 401, 4, 'No', 'Clean'),
('RM008', 'RT008', 402, 4, 'Yes', 'Dirty'),
('RM009', 'RT009', 501, 5, 'Yes', 'Clean'),
('RM010', 'RT010', 502, 5, 'No', 'Clean'),
('RM011', 'RT011', 601, 6, 'Yes', 'Clean'),
('RM012', 'RT012', 602, 6, 'Yes', 'Dirty'),
('RM013', 'RT013', 701, 7, 'Yes', 'Clean'),
('RM014', 'RT014', 702, 7, 'No', 'Clean'),
('RM015', 'RT015', 1501, 15, 'Yes', 'Clean');

-- Insert sample data into Room_Assignments
INSERT INTO Room_Assignments (Room_Assignment_ID, Reservation_ID, Room_ID, Check_In_Date, Check_Out_Date) VALUES
('RA001', 'R001', 'RM001', '2024-05-01', '2024-05-05'),
('RA002', 'R002', 'RM002', '2024-05-02', '2024-05-06'),
('RA003', 'R003', 'RM003', '2024-05-03', '2024-05-07'),
('RA004', 'R004', 'RM004', '2024-05-04', '2024-05-08'),
('RA005', 'R005', 'RM005', '2024-05-05', '2024-05-09'),
('RA006', 'R006', 'RM006', '2024-05-06', '2024-05-10'),
('RA007', 'R007', 'RM007', '2024-05-07', '2024-05-11'),
('RA008', 'R008', 'RM008', '2024-05-08', '2024-05-12'),
('RA009', 'RA009', 'RM009', '2024-05-09', '2024-05-13'),
('RA010', 'R010', 'RM010', '2024-05-10', '2024-05-14'),
('RA011', 'R011', 'RM011', '2024-05-11', '2024-05-15'),
('RA012', 'R012', 'RM012', '2024-05-12', '2024-05-16'),
('RA013', 'R013', 'RM013', '2024-05-13', '2024-05-17'),
('RA014', 'R014', 'RM014', '2024-05-14', '2024-05-18'),
('RA015', 'R015', 'RM015', '2024-06-10', '2024-06-15');
SET foreign_key_checks = 0;

-- Insert the data...

SET foreign_key_checks = 1;

SELECT Reservation_ID 
FROM Reservations 
WHERE Reservation_ID IN ('R001', 'R002', 'R003', 'R004', 'R005', 'R006', 'R007', 'R008', 'R009', 'R010', 'R011', 'R012', 'R013', 'R014', 'R015');


-- Insert sample data into Reservations
INSERT INTO Reservations (Reservation_ID, Guest_ID, Check_In_Date, Check_Out_Date, Num_Of_Guests, Special_Requests) VALUES
('R001', 'G001', '2024-05-01', '2024-05-05', 2, 'Near the pool'),
('R002', 'G002', '2024-05-02', '2024-05-06', 1, 'High floor'),
('R003', 'G003', '2024-05-03', '2024-05-07', 3, 'Quiet room'),
('R004', 'G004', '2024-05-04', '2024-05-08', 2, 'Non-smoking'),
('R005', 'G005', '2024-05-05', '2024-05-09', 1, 'Early check-in'),
('R006', 'G006', '2024-05-06', '2024-05-10', 4, 'Close to elevator'),
('R007', 'G007', '2024-05-07', '2024-05-11', 2, 'Balcony room'),
('R008', 'G008', '2024-05-08', '2024-05-12', 1, 'Corner room'),
('R009', 'G009', '2024-05-09', '2024-05-13', 3, 'Allergy-free room'),
('R010', 'G010', '2024-05-10', '2024-05-14', 1, 'Accessible room'),
('R011', 'G011', '2024-05-11', '2024-05-15', 2, 'City view'),
('R012', 'G012', '2024-05-12', '2024-05-16', 1, 'Away from noise'),
('R013', 'G013', '2024-05-13', '2024-05-17', 2, 'Extra pillows'),
('R014', 'G014', '2024-05-14', '2024-05-18', 3, 'Adjacent rooms'),
('R015', 'G015', '2024-06-10', '2024-06-15', 1, 'Away from elevator');

-- Insert sample data into Room_Assignments
INSERT INTO Room_Assignments (Room_Assignment_ID, Reservation_ID, Room_ID, Check_In_Date, Check_Out_Date) VALUES
('RA001', 'R001', 'RM001', '2024-05-01', '2024-05-05'),
('RA002', 'R002', 'RM002', '2024-05-02', '2024-05-06'),
('RA003', 'R003', 'RM003', '2024-05-03', '2024-05-07'),
('RA004', 'R004', 'RM004', '2024-05-04', '2024-05-08'),
('RA005', 'R005', 'RM005', '2024-05-05', '2024-05-09'),
('RA006', 'R006', 'RM006', '2024-05-06', '2024-05-10'),
('RA007', 'R007', 'RM007', '2024-05-07', '2024-05-11'),
('RA008', 'R008', 'RM008', '2024-05-08', '2024-05-12'),
('RA009', 'R009', 'RM009', '2024-05-09', '2024-05-13'),
('RA010', 'R010', 'RM010', '2024-05-10', '2024-05-14'),
('RA011', 'R011', 'RM011', '2024-05-11', '2024-05-15'),
('RA012', 'R012', 'RM012', '2024-05-12', '2024-05-16'),
('RA013', 'R013', 'RM013', '2024-05-13', '2024-05-17'),
('RA014', 'R014', 'RM014', '2024-05-14', '2024-05-18'),
('RA015', 'R015', 'RM015', '2024-06-10', '2024-06-15');

-- Insert sample data into Billing
INSERT INTO Billing (Billing_ID, Guest_ID, Reservation_ID, Total_Amount, Billing_Date, Payment_Status) VALUES
('B001', 'G001', 'R001', 500.00, '2024-05-05', 'Unpaid'),
('B002', 'G002', 'R002', 600.00, '2024-05-06', 'Paid'),
('B003', 'G003', 'R003', 900.00, '2024-05-07', 'Unpaid'),
('B004', 'G004', 'R004', 700.00, '2024-05-08', 'Paid'),
('B005', 'G005', 'R005', 300.00, '2024-05-09', 'Paid'),
('B006', 'G006', 'R006', 1200.00, '2024-05-10', 'Unpaid'),
('B007', 'G007', 'R007', 800.00, '2024-05-11', 'Paid'),
('B008', 'G008', 'R008', 400.00, '2024-05-12', 'Unpaid'),
('B009', 'G009', 'R009', 1000.00, '2024-05-13', 'Paid'),
('B010', 'G010', 'R010', 200.00, '2024-05-14', 'Unpaid'),
('B011', 'G011', 'R011', 600.00, '2024-05-15', 'Paid'),
('B012', 'G012', 'R012', 300.00, '2024-05-16', 'Paid'),
('B013', 'G013', 'R013', 700.00, '2024-05-17', 'Unpaid'),
('B014', 'G014', 'R014', 900.00, '2024-05-18', 'Unpaid'),
('B015', 'G015', 'R015', 2500.00, '2024-06-15', 'Unpaid');


INSERT INTO Payments (Payment_ID, Guest_ID, Billing_ID, Payment_Amount, Payment_Date, Payment_Method) VALUES
('P001', 'G002', 'B002', 600.00, '2024-05-06', 'Credit Card'),
('P004', 'G004', 'B004', 700.00, '2024-05-08', 'Credit Card'),
('P005', 'G005', 'B005', 300.00, '2024-05-09', 'Cash'),
('P007', 'G007', 'B007', 800.00, '2024-05-11', 'Debit Card'),
('P009', 'G009', 'B009', 1000.00, '2024-05-13', 'Cash'),
('P011', 'G011', 'B011', 600.00, '2024-05-15', 'Cash'),
('P012', 'G012', 'B012', 300.00, '2024-05-16', 'Credit Card');


-- Insert sample data into Inventory
INSERT INTO Inventory (Item_ID, Product_Name, Description, Quantity, Unit_Price, Record_Level, Supplier) VALUES
('I001', 'Towels', 'Bath towels', 50, 5.00, 'Low', 'Linens Inc.'),
('I002', 'Bedsheets', 'High-quality bedsheets', 100, 8.00, 'Medium', 'Textile Co.'),
('I003', 'Pillows', 'Comfortable pillows', 80, 10.00, 'Medium', 'Comfy Corp.'),
('I004', 'Toothbrushes', 'Disposable toothbrushes', 200, 1.00, 'High', 'Hygiene Ltd.'),
('I005', 'Soap', 'Small soap bars', 150, 2.00, 'High', 'Cleansing Products Co.'),
('I006', 'Conditioner', 'Hair conditioner', 120, 4.00, 'Medium', 'Beauty Supplies Co.'),
('I007', 'Coffee', 'Instant coffee packets', 250, 3.00, 'High', 'Coffee Traders Inc.'),
('I008', 'Tea', 'Assorted tea bags', 200, 2.50, 'High', 'Tea Co.'),
('I009', 'Shampoo', 'Small shampoo bottles', 150, 3.00, 'Medium', 'Beauty Supplies Co.'),
('I010', 'Slippers', 'Disposable slippers', 70, 7.00, 'Low', 'Footwear Inc.'),
('I011', 'Mini Bar Items', 'Assorted snacks and drinks', 80, 12.00, 'Low', 'Minibar Supplies Ltd.'),
('I012', 'Laundry Bags', 'Disposable laundry bags', 60, 1.50, 'Medium', 'Hygiene Ltd.'),
('I013', 'Tissues', 'Small tissue packs', 180, 2.00, 'High', 'Paper Co.'),
('I014', 'Toiletries', 'Toiletry kits', 100, 6.00, 'Medium', 'Travel Essentials Co.'),
('I015', 'Shampoo', 'Luxury shampoo', 100, 3.00, 'Medium', 'Beauty Supplies Co.');



-- Join Reservations with Guests to get guest information for each reservation
SELECT Reservations.Reservation_ID, Guests.Guest_Name, Reservations.Check_In_Date, Reservations.Check_Out_Date, Reservations.Num_Of_Guests, Reservations.Special_Requests
FROM Reservations
JOIN Guests ON Reservations.Guest_ID = Guests.Guest_ID;

-- Join Room_Assignments with Rooms to get room details for each assignment
SELECT Room_Assignments.Room_Assignment_ID, Room_Assignments.Reservation_ID, Rooms.Room_Number, Rooms.Room_Type_ID, Room_Assignments.Check_In_Date, Room_Assignments.Check_Out_Date
FROM Room_Assignments
JOIN Rooms ON Room_Assignments.Room_ID = Rooms.Room_ID;


CREATE INDEX idx_guests_guest_id ON Guests(Guest_ID);
CREATE INDEX idx_reservations_guest_id ON Reservations(Guest_ID);
CREATE INDEX idx_billing_reservation_id ON Billing(Reservation_ID);

CREATE VIEW Reservation_Summary AS
SELECT Reservations.Reservation_ID, Guests.Guest_Name, Reservations.Check_In_Date, Reservations.Check_Out_Date, Billing.Total_Amount
FROM Reservations
JOIN Guests ON Reservations.Guest_ID = Guests.Guest_ID
JOIN Billing ON Reservations.Reservation_ID = Billing.Reservation_ID;

-- Usage:
SELECT * FROM Reservation_Summary;

DELIMITER $$

CREATE PROCEDURE AddReservation(
    IN guest_id VARCHAR(10),
    IN check_in DATE,
    IN check_out DATE,
    IN num_guests INT,
    IN special_requests TEXT
)
BEGIN
    DECLARE res_id VARCHAR(10);
    SET res_id = CONCAT('R', FLOOR(RAND() * 1000 + 1));
    
    INSERT INTO Reservations (Reservation_ID, Guest_ID, Check_In_Date, Check_Out_Date, Num_Of_Guests, Special_Requests) VALUES
    (res_id, guest_id, check_in, check_out, num_guests, special_requests);

    INSERT INTO Billing (Billing_ID, Guest_ID, Reservation_ID, Total_Amount, Billing_Date, Payment_Status) VALUES
    (CONCAT('B', FLOOR(RAND() * 1000 + 1)), guest_id, res_id, 0.00, CURDATE(), 'Unpaid');
END $$

DELIMITER ;

-- Usage:
CALL AddReservation('G001', '2024-06-01', '2024-06-05', 2, 'Poolside');


