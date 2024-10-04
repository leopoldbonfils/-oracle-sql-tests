HOTEL BOOKING SYSTEM.


The Hotel Booking System is a simple relational database system designed to manage the operations of a hotel, including customer information, room availability, bookings, payments, and hotel details. It is built using Oracle SQL and includes examples of table structures, relationships, and basic operations such as INSERT, SELECT, UPDATE, DELETE, and JOIN.


Manage hotels and their locations.
Track room availability and room types (Single, Double, Suite).
Handle customer details.
Record and manage bookings for hotel rooms.
Record and process payments for bookings.
Generate reports on bookings, customers, payments, and rooms.
Database Structure
The system consists of several tables with foreign key relationships, ensuring referential integrity.

Tables:

Hotels: Stores information about different hotels.
Customers: Stores personal details of customers.
Rooms: Contains details about available rooms in hotels.
Bookings: Tracks customer bookings, including check-in and check-out dates.
Payments: Stores payment details for each booking.
ER Diagram
Here is a simplified version of the relationships between tables:

Hotels has many Rooms.
Rooms are booked through Bookings.
Customers make Bookings.
Payments are tied to Bookings.

Table Definitions


1. Hotels Table

CREATE TABLE Hotels (
    Hotel_ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Hotel_Name VARCHAR2(100) NOT NULL,
    Location VARCHAR2(100) NOT NULL,
    Rating NUMBER CHECK (Rating >= 1 AND Rating <= 5),
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


2. Customers Table

CREATE TABLE Customers (
    Customer_ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    First_Name VARCHAR2(50) NOT NULL,
    Last_Name VARCHAR2(50) NOT NULL,
    Email VARCHAR2(100) UNIQUE NOT NULL,
    Phone_Number VARCHAR2(15),
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


3. Rooms Table

CREATE TABLE Rooms (
    Room_ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Hotel_ID NUMBER,
    Room_Number VARCHAR2(10) NOT NULL,
    Room_Type VARCHAR2(50) CHECK (Room_Type IN ('Single', 'Double', 'Suite')),
    Price_Per_Night NUMBER NOT NULL,
    Availability_Status CHAR(1) DEFAULT 'Y' CHECK (Availability_Status IN ('Y', 'N')),
    FOREIGN KEY (Hotel_ID) REFERENCES Hotels(Hotel_ID)
);


4. Bookings Table

CREATE TABLE Bookings (
    Booking_ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Customer_ID NUMBER,
    Room_ID NUMBER,
    Check_In_Date DATE NOT NULL,
    Check_Out_Date DATE NOT NULL,
    Total_Amount NUMBER NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Room_ID) REFERENCES Rooms(Room_ID)
);


5. Payments Table

CREATE TABLE Payments (
    Payment_ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Booking_ID NUMBER,
    Payment_Amount NUMBER NOT NULL,
    Payment_Date DATE DEFAULT SYSDATE,
    Payment_Method VARCHAR2(50) CHECK (Payment_Method IN ('Credit Card', 'Debit Card', 'Cash')),
    FOREIGN KEY (Booking_ID) REFERENCES Bookings(Booking_ID)
);


Sample Data
Here are some INSERT queries to populate the tables with sample data:

Hotels

INSERT INTO Hotels (Hotel_Name, Location, Rating)
VALUES ('Grand Palace Hotel', 'KIGALI', 5);

INSERT INTO Hotels (Hotel_Name, Location, Rating)
VALUES ('MARRIOTT', 'KIGALI', 4);


Customers

INSERT INTO Customers (First_Name, Last_Name, Email, Phone_Number)
VALUES ('BONFILS', 'LEOPOLD', 'leopoldbonfils@gmail.com', '123-456-7890');


Rooms

INSERT INTO Rooms (Hotel_ID, Room_Number, Room_Type, Price_Per_Night, Availability_Status)
VALUES (1, '101', 'Single', 100, 'Y');


Bookings

INSERT INTO Bookings (Customer_ID, Room_ID, Check_In_Date, Check_Out_Date, Total_Amount)
VALUES (1, 1, TO_DATE('2024-10-05', 'YYYY-MM-DD'), TO_DATE('2024-10-10', 'YYYY-MM-DD'), 500);


Payments

INSERT INTO Payments (Booking_ID, Payment_Amount, Payment_Date, Payment_Method)
VALUES (1, 500, TO_DATE('2024-10-03', 'YYYY-MM-DD'), 'Credit Card');


Operations
SELECT Queries
Fetch all hotels:

SELECT * FROM Hotels;
Fetch all bookings with customer details:

SELECT B.Booking_ID, C.First_Name, C.Last_Name, B.Check_In_Date, B.Check_Out_Date, B.Total_Amount
FROM Bookings B
JOIN Customers C ON B.Customer_ID = C.Customer_ID;
UPDATE Queries
Update room availability after booking:

UPDATE Rooms
SET Availability_Status = 'N'
WHERE Room_ID = 1;
DELETE Queries
Delete a booking:

DELETE FROM Bookings WHERE Booking_ID = 1;
JOIN Queries
Join all tables for full booking information:

SELECT B.Booking_ID, C.First_Name, C.Last_Name, H.Hotel_Name, R.Room_Number, B.Check_In_Date, B.Check_Out_Date, P.Payment_Amount
FROM Bookings B
JOIN Customers C ON B.Customer_ID = C.Customer_ID
JOIN Rooms R ON B.Room_ID = R.Room_ID
JOIN Hotels H ON R.Hotel_ID = H.Hotel_ID
JOIN Payments P ON B.Booking_ID = P.Booking_ID;


License
This project is licensed under the MIT License.

This README.md provides clear instructions, details on the database structure, and sample SQL queries to help others understand and use your Hotel Booking System.

![image ](https://github.com/user-attachments/assets/adabca70-3a98-4285-82b7-99dbe3f1671f)



