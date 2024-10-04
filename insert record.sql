-- Inserting sample data into Hotels table
INSERT INTO Hotels (Hotel_Name, Location, Rating)
VALUES ('Grand Palace ', 'KIGALI', 5);

INSERT INTO Hotels (Hotel_Name, Location, Rating)
VALUES ('MARRIOTT', 'KIGALI', 4);

INSERT INTO Hotels (Hotel_Name, Location, Rating)
VALUES ('RADDISON', 'KIGALI', 3);

-- Inserting sample data into Customers table
INSERT INTO Customers (First_Name, Last_Name, Email, Phone_Number)
VALUES ('BONFILS', 'LEOPOLD', 'leopoldbonfils.com', '0786435524');

INSERT INTO Customers (First_Name, Last_Name, Email, Phone_Number)
VALUES ('', '', '0784635373');

INSERT INTO Customers (First_Name, Last_Name, Email, Phone_Number)
VALUES ('lucky', 'Brown', '@gmail.com', '0784363534');

-- Inserting sample data into Rooms table
INSERT INTO Rooms (Hotel_ID, Room_Number, Room_Type, Price_Per_Night, Availability_Status)
VALUES (1, '101', 'Single', 100, 'Y');

INSERT INTO Rooms (Hotel_ID, Room_Number, Room_Type, Price_Per_Night, Availability_Status)
VALUES (1, '102', 'Double', 150, 'Y');

INSERT INTO Rooms (Hotel_ID, Room_Number, Room_Type, Price_Per_Night, Availability_Status)
VALUES (2, '201', 'Suite', 300, 'Y');

-- Inserting sample data into Bookings table
INSERT INTO Bookings (Customer_ID, Room_ID, Check_In_Date, Check_Out_Date, Total_Amount)
VALUES (1, 1, TO_DATE('2024-10-05', 'YYYY-MM-DD'), TO_DATE('2024-10-10', 'YYYY-MM-DD'), 500);

INSERT INTO Bookings (Customer_ID, Room_ID, Check_In_Date, Check_Out_Date, Total_Amount)
VALUES (2, 2, TO_DATE('2024-11-01', 'YYYY-MM-DD'), TO_DATE('2024-11-05', 'YYYY-MM-DD'), 600);

INSERT INTO Bookings (Customer_ID, Room_ID, Check_In_Date, Check_Out_Date, Total_Amount)
VALUES (3, 3, TO_DATE('2024-12-15', 'YYYY-MM-DD'), TO_DATE('2024-12-20', 'YYYY-MM-DD'), 1500);

-- Inserting sample data into Payments table
INSERT INTO Payments (Booking_ID, Payment_Amount, Payment_Date, Payment_Method)
VALUES (1, 500, TO_DATE('2024-10-03', 'YYYY-MM-DD'), 'Credit Card');

INSERT INTO Payments (Booking_ID, Payment_Amount, Payment_Date, Payment_Method)
VALUES (2, 600, TO_DATE('2024-10-03', 'YYYY-MM-DD'), 'Debit Card');

INSERT INTO Payments (Booking_ID, Payment_Amount, Payment_Date, Payment_Method)
VALUES (3, 1500, TO_DATE('2024-10-03', 'YYYY-MM-DD'), 'Cash');
