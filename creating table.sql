CREATE TABLE Hotels (
    Hotel_ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,   -- Unique identifier for each hotel
    Hotel_Name VARCHAR2(100) NOT NULL,                             -- Name of the hotel
    Location VARCHAR2(100) NOT NULL,                               -- Location of the hotel
    Rating NUMBER CHECK (Rating >= 1 AND Rating <= 5),             -- Rating of the hotel (1 to 5 stars)
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP                 -- Timestamp when the hotel record was created
);
 
CREATE TABLE Customers (
    Customer_ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, -- Unique identifier for each customer
    First_Name VARCHAR2(50) NOT NULL,                                -- Customer's first name
    Last_Name VARCHAR2(50) NOT NULL,                                 -- Customer's last name
    Email VARCHAR2(100) UNIQUE NOT NULL,                             -- Customer's email (must be unique)
    Phone_Number VARCHAR2(15),                                       -- Customer's phone number
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP                   -- Timestamp when the customer was created
);

CREATE TABLE Rooms (
    Room_ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,   -- Unique identifier for each room
    Hotel_ID NUMBER,                                               -- Foreign key referencing the Hotels table
    Room_Number VARCHAR2(10) NOT NULL,                             -- Room number
    Room_Type VARCHAR2(50) CHECK (Room_Type IN ('Single', 'Double', 'Suite')), -- Type of the room
    Price_Per_Night NUMBER NOT NULL,                               -- Price per night for the room
    Availability_Status CHAR(1) DEFAULT 'Y' CHECK (Availability_Status IN ('Y', 'N')), -- Room availability status (Y/N)
    FOREIGN KEY (Hotel_ID) REFERENCES Hotels(Hotel_ID)             -- Linking to the Hotels table
);

CREATE TABLE Bookings (
    Booking_ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, -- Unique identifier for each booking
    Customer_ID NUMBER,                                             -- Foreign key referencing the Customers table
    Room_ID NUMBER,                                                 -- Foreign key referencing the Rooms table
    Check_In_Date DATE NOT NULL,                                    -- Check-in date
    Check_Out_Date DATE NOT NULL,                                   -- Check-out date
    Total_Amount NUMBER NOT NULL,                                   -- Total amount for the booking
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),    -- Linking to the Customers table
    FOREIGN KEY (Room_ID) REFERENCES Rooms(Room_ID)                 -- Linking to the Rooms table
);

CREATE TABLE Payments (
    Payment_ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, -- Unique identifier for each payment
    Booking_ID NUMBER,                                              -- Foreign key referencing the Bookings table
    Payment_Amount NUMBER NOT NULL,                                 -- Amount of the payment
    Payment_Date DATE DEFAULT SYSDATE,                              -- Date of payment
    Payment_Method VARCHAR2(50) CHECK (Payment_Method IN ('Credit Card', 'Debit Card', 'Cash')), -- Payment method
    FOREIGN KEY (Booking_ID) REFERENCES Bookings(Booking_ID)        -- Linking to the Bookings table
);