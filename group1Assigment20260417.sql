-- Group 1
-- Makayla Morgan
-- Julian Maya
-- Bryan Montes
-- University of North Carolina at Greensboro
-- IST423: Information Storage Retrieval
-- Dr. Rukayya Umar
-- April 17, 2026

--- STEP 1: CREATE TABLES AND ENTITIES

-- Create Theater table
CREATE TABLE Theater (
    theaterID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    capacity INT
);

-- Create Movie table
CREATE TABLE Movie (
    movieID INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    releaseDate DATE,
    genre VARCHAR(100),
    director VARCHAR(255)
);

-- Create ScreenType table
CREATE TABLE ScreenType (
    screen_type_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Create Screen table
CREATE TABLE Screen (
    screenID INT PRIMARY KEY,
    theaterID INT,
    screen_type_id INT,
    FOREIGN KEY (theaterID) REFERENCES Theater(theaterID),
    FOREIGN KEY (screen_type_id) REFERENCES ScreenType(screen_type_id)
);

-- Create Showing table
CREATE TABLE Showing (
    showingID INT PRIMARY KEY,
    screenID INT,
    movieID INT,
    date DATE,
    time TIME,
    FOREIGN KEY (screenID) REFERENCES Screen(screenID),
    FOREIGN KEY (movieID) REFERENCES Movie(movieID)
);

-- Create Seat table
CREATE TABLE Seat (
    seatID INT PRIMARY KEY,
    theaterID INT,
    "row" VARCHAR(10),
    "column" VARCHAR(10),
    type VARCHAR(255),
    FOREIGN KEY (theaterID) REFERENCES Theater(theaterID)
);

-- Create Ticket table
CREATE TABLE Ticket (
    ticketID INT PRIMARY KEY,
    showingID INT,
    seatID INT,
    price DECIMAL(10, 2),
    customerName VARCHAR(255),
    FOREIGN KEY (showingID) REFERENCES Showing(showingID),
    FOREIGN KEY (seatID) REFERENCES Seat(seatID)
);

CREATE TABLE ShowingsMovies (
    showingID INT,
    movieID INT,
    FOREIGN KEY (movieID) REFERENCES Movie(movieID),
    FOREIGN KEY (showingID) REFERENCES Showing(showingID)

);

CREATE TABLE Showing_Seat (
    showingID INT,
    seatID INT,
    FOREIGN KEY (showingID) REFERENCES Showing(showingID),
    FOREIGN KEY (seatID) REFERENCES Seat(seatID) 
);

--- STEP 2: ADDING DATA

-- Insert data into Theater table
INSERT INTO Theater (theaterID, name, address, capacity) VALUES
(1,'Better Movies at Broadway', '123 Broadway St, New York', 500),
(2,'Better Movies at Park Ave', '456 Park Ave, Los Angeles', 400);

-- Insert data into Movie table
INSERT INTO Movie (movieID, title, releaseDate, genre, director) VALUES
(1,'Inception', '2010-07-16', 'Sci-Fi', 'Christopher Nolan'),
(2,'The Shawshank Redemption', '1994-07-14', 'Drama', 'Frank Darabont'),
(3,'Avatar', '2009-12-18', 'Science Fiction', 'James Cameron'),
(4,'Interstellar', '2014-11-07', 'Science Fiction', 'Christopher Nolan'),
(5,'The Godfather', '1972-03-24', 'Drama/Crime', 'Francis Ford Coppola');

-- Insert data into ScreenType table
INSERT INTO ScreenType (screen_type_id,name, description) VALUES
(1,'Standard', 'Standard screen with 2D projection'),
(2,'IMAX', 'High-resolution IMAX screen with 3D and digital sound'),
(3,'3D', 'Screen for 3D movies with anaglyph glasses');

-- Insert data into Screen table
INSERT INTO Screen (screenID, theaterID, screen_type_id) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 2, 3);

-- Insert data into Showing table
INSERT INTO Showing (showingID, screenID, movieID, date, time) VALUES
(1, 1, 1, '2024-05-01', '19:00'),
(2, 1, 2, '2024-05-02', '21:30'),
(3, 2, 3, '2024-05-03', '17:00'),
(4, 2, 4, '2024-05-04', '19:30'),
(5, 3, 5, '2024-05-05', '16:00');

-- Insert data into Seat table
INSERT INTO Seat (seatID, theaterID, "row", "column", type) VALUES
(1, 1, 'A', '1', 'Normal'),
(2, 1, 'A', '2', 'Normal'),
(3, 1, 'A', '3', 'Normal'),
(4, 1, 'A', '4', 'Normal'),
(5, 1, 'A', '5', 'Premium'),
(6, 1, 'A', '6', 'Premium'),
(7, 1, 'A', '7', 'Premium'),
(8, 1, 'A', '8', 'Premium'),
(9, 1, 'A', '9', 'Disabled'),
(10, 1, 'A', '10', 'Disabled'),
(11, 1, 'B', '1', 'Normal'),
(12, 1, 'B', '2', 'Normal'),
(13, 1, 'B', '3', 'Normal'),
(14, 1, 'B', '4', 'Normal'),
(15, 1, 'B', '5', 'Premium'),
(16, 1, 'B', '6', 'Premium'),
(17, 1, 'B', '7', 'Premium'),
(18, 1, 'B', '8', 'Premium'),
(19, 1, 'B', '9', 'Disabled'),
(20, 1, 'B', '10', 'Disabled'),
(21, 1, 'C', '1', 'Normal'),
(22, 1, 'C', '2', 'Normal'),
(23, 1, 'C', '3', 'Normal'),
(24, 1, 'C', '4', 'Normal'),
(25, 1, 'C', '5', 'Premium'),
(26, 1, 'C', '6', 'Premium'),
(27, 1, 'C', '7', 'Premium'),
(28, 1, 'C', '8', 'Premium'),
(29, 1, 'C', '9', 'Disabled'),
(30, 1, 'C', '10', 'Disabled'),
(31, 1, 'D', '1', 'Normal'),
(32, 1, 'D', '2', 'Normal'),
(33, 1, 'D', '3', 'Normal'),
(34, 1, 'D', '4', 'Normal'),
(35, 1, 'D', '5', 'Premium'),
(36, 1, 'D', '6', 'Premium'),
(37, 1, 'D', '7', 'Premium'),
(38, 1, 'D', '8', 'Premium'),
(39, 1, 'D', '9', 'Disabled'),
(40, 1, 'D', '10', 'Disabled'),
(41, 1, 'E', '1', 'Normal'),
(42, 1, 'E', '2', 'Normal'),
(43, 1, 'E', '3', 'Normal'),
(44, 1, 'E', '4', 'Normal'),
(45, 1, 'E', '5', 'Premium'),
(46, 1, 'E', '6', 'Premium'),
(47, 1, 'E', '7', 'Premium'),
(48, 1, 'E', '8', 'Premium'),
(49, 1, 'E', '9', 'Disabled'),
(50, 1, 'E', '10', 'Disabled'),
(51, 1, 'F', '1', 'Normal'),
(52, 1, 'F', '2', 'Normal'),
(53, 1, 'F', '3', 'Normal'),
(54, 1, 'F', '4', 'Normal'),
(55, 1, 'F', '5', 'Premium'),
(56, 1, 'F', '6', 'Premium'),
(57, 1, 'F', '7', 'Premium'),
(58, 1, 'F', '8', 'Premium'),
(59, 1, 'F', '9', 'Disabled'),
(60, 1, 'F', '10', 'Disabled'),
(61, 1, 'G', '1', 'Normal'),
(62, 1, 'G', '2', 'Normal'),
(63, 1, 'G', '3', 'Normal'),
(64, 1, 'G', '4', 'Normal'),
(65, 1, 'G', '5', 'Premium'),
(66, 1, 'G', '6', 'Premium'),
(67, 1, 'G', '7', 'Premium'),
(68, 1, 'G', '8', 'Premium'),
(69, 1, 'G', '9', 'Disabled'),
(70, 1, 'G', '10', 'Disabled'),
(71, 1, 'H', '1', 'Normal'),
(72, 1, 'H', '2', 'Normal'),
(73, 1, 'H', '3', 'Normal'),
(74, 1, 'H', '4', 'Normal'),
(75, 1, 'H', '5', 'Premium'),
(76, 1, 'H', '6', 'Premium'),
(77, 1, 'H', '7', 'Premium'),
(78, 1, 'H', '8', 'Premium'),
(79, 1, 'H', '9', 'Disabled'),
(80, 1, 'H', '10', 'Disabled'),
(81, 1, 'I', '1', 'Normal'),
(82, 1, 'I', '2', 'Normal'),
(83, 1, 'I', '3', 'Normal'),
(84, 1, 'I', '4', 'Normal'),
(85, 1, 'I', '5', 'Premium'),
(86, 1, 'I', '6', 'Premium'),
(87, 1, 'I', '7', 'Premium'),
(88, 1, 'I', '8', 'Premium'),
(89, 1, 'I', '9', 'Disabled'),
(90, 1, 'I', '10', 'Disabled'),
(91, 1, 'J', '1', 'Normal'),
(92, 1, 'J', '2', 'Normal'),
(93, 1, 'J', '3', 'Normal'),
(94, 1, 'J', '4', 'Normal'),
(95, 1, 'J', '5', 'Premium'),
(96, 1, 'J', '6', 'Premium'),
(97, 1, 'J', '7', 'Premium'),
(98, 1, 'J', '8', 'Premium'),
(99, 1, 'J', '9', 'Disabled'),
(100, 1, 'J', '10', 'Disabled'),
(101, 2, 'A', '1', 'Normal'),
(102, 2, 'A', '2', 'Normal'),
(103, 2, 'A', '3', 'Normal'),
(104, 2, 'A', '4', 'Normal'),
(105, 2, 'A', '5', 'Premium'),
(106, 2, 'A', '6', 'Premium'),
(107, 2, 'A', '7', 'Premium'),
(108, 2, 'A', '8', 'Premium'),
(109, 2, 'A', '9', 'Disabled'),
(110, 2, 'A', '10', 'Disabled'),
(111, 2, 'B', '1', 'Normal'),
(112, 2, 'B', '2', 'Normal'),
(113, 2, 'B', '3', 'Normal'),
(114, 2, 'B', '4', 'Normal'),
(115, 2, 'B', '5', 'Premium'),
(116, 2, 'B', '6', 'Premium'),
(117, 2, 'B', '7', 'Premium'),
(118, 2, 'B', '8', 'Premium'),
(119, 2, 'B', '9', 'Disabled'),
(120, 2, 'B', '10', 'Disabled'),
(121, 2, 'C', '1', 'Normal'),
(122, 2, 'C', '2', 'Normal'),
(123, 2, 'C', '3', 'Normal'),
(124, 2, 'C', '4', 'Normal'),
(125, 2, 'C', '5', 'Premium'),
(126, 2, 'C', '6', 'Premium'),
(127, 2, 'C', '7', 'Premium'),
(128, 2, 'C', '8', 'Premium'),
(129, 2, 'C', '9', 'Disabled'),
(130, 2, 'C', '10', 'Disabled'),
(131, 2, 'D', '1', 'Normal'),
(132, 2, 'D', '2', 'Normal'),
(133, 2, 'D', '3', 'Normal'),
(134, 2, 'D', '4', 'Normal'),
(135, 2, 'D', '5', 'Premium'),
(136, 2, 'D', '6', 'Premium'),
(137, 2, 'D', '7', 'Premium'),
(138, 2, 'D', '8', 'Premium'),
(139, 2, 'D', '9', 'Disabled'),
(140, 2, 'D', '10', 'Disabled'),
(141, 2, 'E', '1', 'Normal'),
(142, 2, 'E', '2', 'Normal'),
(143, 2, 'E', '3', 'Normal'),
(144, 2, 'E', '4', 'Normal'),
(145, 2, 'E', '5', 'Premium'),
(146, 2, 'E', '6', 'Premium'),
(147, 2, 'E', '7', 'Premium'),
(148, 2, 'E', '8', 'Premium'),
(149, 2, 'E', '9', 'Disabled'),
(150, 2, 'E', '10', 'Disabled'),
(151, 2, 'F', '1', 'Normal'),
(152, 2, 'F', '2', 'Normal'),
(153, 2, 'F', '3', 'Normal'),
(154, 2, 'F', '4', 'Normal'),
(155, 2, 'F', '5', 'Premium'),
(156, 2, 'F', '6', 'Premium'),
(157, 2, 'F', '7', 'Premium'),
(158, 2, 'F', '8', 'Premium'),
(159, 2, 'F', '9', 'Disabled'),
(160, 2, 'F', '10', 'Disabled'),
(161, 2, 'G', '1', 'Normal'),
(162, 2, 'G', '2', 'Normal'),
(163, 2, 'G', '3', 'Normal'),
(164, 2, 'G', '4', 'Normal'),
(165, 2, 'G', '5', 'Premium'),
(166, 2, 'G', '6', 'Premium'),
(167, 2, 'G', '7', 'Premium'),
(168, 2, 'G', '8', 'Premium'),
(169, 2, 'G', '9', 'Disabled'),
(170, 2, 'G', '10', 'Disabled'),
(171, 2, 'H', '1', 'Normal'),
(172, 2, 'H', '2', 'Normal'),
(173, 2, 'H', '3', 'Normal'),
(174, 2, 'H', '4', 'Normal'),
(175, 2, 'H', '5', 'Premium'),
(176, 2, 'H', '6', 'Premium'),
(177, 2, 'H', '7', 'Premium'),
(178, 2, 'H', '8', 'Premium'),
(179, 2, 'H', '9', 'Disabled'),
(180, 2, 'H', '10', 'Disabled'),
(181, 2, 'I', '1', 'Normal'),
(182, 2, 'I', '2', 'Normal'),
(183, 2, 'I', '3', 'Normal'),
(184, 2, 'I', '4', 'Normal'),
(185, 2, 'I', '5', 'Premium'),
(186, 2, 'I', '6', 'Premium'),
(187, 2, 'I', '7', 'Premium'),
(188, 2, 'I', '8', 'Premium'),
(189, 2, 'I', '9', 'Disabled'),
(190, 2, 'I', '10', 'Disabled'),
(191, 2, 'J', '1', 'Normal'),
(192, 2, 'J', '2', 'Normal'),
(193, 2, 'J', '3', 'Normal'),
(194, 2, 'J', '4', 'Normal'),
(195, 2, 'J', '5', 'Premium'),
(196, 2, 'J', '6', 'Premium'),
(197, 2, 'J', '7', 'Premium'),
(198, 2, 'J', '8', 'Premium'),
(199, 2, 'J', '9', 'Disabled'),
(200, 2, 'J', '10', 'Disabled');

-- Insert data into Ticket table
INSERT INTO Ticket (ticketID, showingID, seatID, price, customerName) VALUES
(1, 1, 1, 15.00, 'John Doe'),
(2, 1, 2, 15.00, 'Jane Smith'),
(3, 2, 3, 20.00, 'Alice Johnson'),
(4, 2, 4, 20.00, 'Bob Lee'),
(5, 3, 5, 18.00, 'Charlie Brown');

-- Step 3: Adding more data
INSERT INTO Movie (movieID, title, releaseDate, genre, director) VALUES
(16, 'The Martian', '2015-09-03', 'Sci-Fi', 'Ridley Scott'),
(17, 'Arrival', '2016-11-17', 'Sci-Fi', 'Denis Villeneuve'),
(18, 'Black Panther', '2018-02-16', 'Action', 'Ryan Coogler'),
(19, 'La La Land', '2016-12-09', 'Musical', 'Damien Chazelle'),
(20, 'Wonder Woman', '2017-07-22', 'Action', 'Patty Jenkins');

INSERT INTO Showing (showingID, screenID, movieID, date, time) VALUES
(6, 1, 16, '2024-11-07', '21:00:00'),
(7, 2, 17, '2024-11-07', '19:30:00'),
(8, 1, 18, '2024-11-08', '18:00:00'),
(9, 3, 19, '2024-11-08', '20:00:00'),
(10, 2, 20, '2024-11-09', '14:00:00'),
(11, 1, 16, '2024-11-10', '19:00:00'),
(12, 3, 17, '2024-11-10', '17:30:00'),
(13, 2, 18, '2024-11-11', '18:30:00'),
(14, 1, 19, '2024-11-11', '20:30:00'),
(15, 3, 20, '2024-11-12', '12:00:00');

INSERT INTO Ticket (ticketID, showingID, seatID, price, customerName) VALUES
(16, 1, 1, 25.00, 'John Doe'),
(17, 2, 2, 30.00, 'Jane Smith'),
(18, 3, 3, 25.00, 'Alice Johnson'),
(19, 4, 4, 30.00, 'Bob Brown'),
(20, 5, 5, 25.00, 'Charlie Davis'),
(21, 6, 6, 30.00, 'Diana Evans'),
(22, 7, 7, 25.00, 'Ethan Foster'),
(23, 8, 8, 30.00, 'Fiona Green'),
(24, 9, 9, 25.00, 'George Harris'),
(25, 10, 10, 30.00, 'Hannah Ives'),
(26, 11, 11, 25.00, 'Ivan Jenkins'),
(27, 12, 12, 30.00, 'Julia King'),
(28, 13, 13, 25.00, 'Kevin Lee'),
(29, 14, 14, 30.00, 'Lily Miller'),
(30, 15, 15, 25.00, 'Michael Norton'),
(31, 1, 16, 30.00, 'Nancy Olsen'),
(32, 2, 17, 25.00, 'Paul Patel'),
(33, 3, 18, 30.00, 'Quinn Quinn'),
(34, 4, 19, 25.00, 'Rachel Ray'),
(35, 5, 20, 30.00, 'Sam Smith'),
(36, 6, 21, 25.00, 'Tina Turner'),
(37, 7, 22, 30.00, 'Umesh Uppal'),
(38, 8, 23, 25.00, 'Vivian Vasquez'),
(39, 9, 24, 30.00, 'Will White'),
(40, 10, 25, 25.00, 'Xia Xu'),
(41, 11, 26, 30.00, 'Yan Yang'),
(42, 12, 27, 25.00, 'Zoe Zhang'),
(43, 13, 28, 30.00, 'Adam Apple'),
(44, 14, 29, 25.00, 'Beatrice Berry'),
(45, 15, 30, 30.00, 'Carter Cherry'),
(46, 1, 31, 25.00, 'Derek Date'),
(47, 2, 32, 30.00, 'Ella Echo'),
(48, 3, 33, 25.00, 'Frankie February'),
(49, 4, 34, 30.00, 'Grace March'),
(50, 5, 35, 25.00, 'Hannah April'),
(51, 6, 36, 30.00, 'Ivy May'),
(52, 7, 37, 25.00, 'Jack June'),
(53, 8, 38, 30.00, 'Kelly July'),
(54, 9, 39, 25.00, 'Liam August'),
(55, 10, 40, 30.00, 'Mia September'),
(56, 11, 41, 25.00, 'Nate October'),
(57, 12, 42, 30.00, 'Olivia November'),
(58, 13, 43, 25.00, 'Paul December'),
(59, 14, 44, 30.00, 'Quinn Jan'),
(60, 15, 45, 25.00, 'Rachel Feb'),
(61, 1, 46, 30.00, 'Sam Mar'),
(62, 2, 47, 25.00, 'Tina Apr'),
(63, 3, 48, 30.00, 'Umesh May'),
(64, 4, 49, 25.00, 'Vivian Jun'),
(65, 5, 50, 30.00, 'Will Jul'),
(66, 6, 51, 25.00, 'Xia Aug'),
(67, 7, 52, 30.00, 'Yan Sep'),
(68, 8, 53, 25.00, 'Zoe Oct'),
(69, 9, 54, 30.00, 'Adam Nov'),
(70, 10, 55, 25.00, 'Beatrice Dec'),
(71, 11, 56, 30.00, 'Carter Jan'),
(72, 12, 57, 25.00, 'Derek Feb'),
(73, 13, 58, 30.00, 'Ella Mar'),
(74, 14, 59, 25.00, 'Frankie Apr'),
(75, 15, 60, 30.00, 'Grace May'),
(76, 1, 61, 25.00, 'Hannah Jun'),
(77, 2, 62, 30.00, 'Ivy Jul'),
(78, 3, 63, 25.00, 'Jack Aug'),
(79, 4, 64, 30.00, 'Kelly Sep'),
(80, 5, 65, 25.00, 'Liam Oct'),
(81, 6, 66, 30.00, 'Mia Nov'),
(82, 7, 67, 25.00, 'Nate Dec'),
(83, 8, 68, 30.00, 'Olivia Jan'),
(84, 9, 69, 25.00, 'Paul Feb'),
(85, 10, 70, 30.00, 'Quinn Mar'),
(86, 11, 71, 25.00, 'Rachel Apr'),
(87, 12, 72, 30.00, 'Sam May'),
(88, 13, 73, 25.00, 'Tina Jun'),
(89, 14, 74, 30.00, 'Umesh Jul'),
(90, 15, 75, 25.00, 'Vivian Aug'),
(91, 1, 76, 30.00, 'Will Sep'),
(92, 2, 77, 25.00, 'Xia Oct'),
(93, 3, 78, 30.00, 'Yan Nov'),
(94, 4, 79, 25.00, 'Zoe Dec'),
(95, 5, 80, 30.00, 'Adam Jan'),
(96, 6, 81, 30.00, 'Beatrice Feb'),
(97, 7, 82, 25.00, 'Carter Mar'),
(98, 8, 83, 30.00, 'Derek Apr'),
(99, 9, 84, 25.00, 'Ella May'),
(100, 10, 85, 30.00, 'Frankie Jun');

-- Step 4: Adding Entries to the bridge table 
INSERT INTO ShowingsMovies (showingID, movieID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 16),
(7, 17),
(8, 18),
(9, 19),
(10, 20);
INSERT INTO Showing_Seat (showingID, seatID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
-- Step 4: Create Views
-- View 1: Show all movies available
CREATE VIEW Movies AS
SELECT 
    M.movieID, 
    M.title, 
    S.showingID, 
    S.date, 
    S.time
FROM Movie M
JOIN Showing S ON M.movieID = S.movieID
JOIN Screen SC ON S.screenID = SC.screenID
WHERE SC.theaterID IN (SELECT theaterID FROM Theater);
--View 2: List all Showings
CREATE VIEW MovieShowings AS
SELECT 
    SM.showingID, 
    M.movieID, 
    M.title, 
    S.date, 
    S.time
FROM ShowingsMovies SM
JOIN Movie M ON SM.movieID = M.movieID
JOIN Showing S ON SM.showingID = S.showingID;
-- View 3: View theaters and seating capacity
CREATE VIEW ShowingSeatDetails AS
SELECT 
    SS.showingID, 
    SS.seatID, 
    S.row, 
    S.column, 
    S.type
FROM Showing_Seat SS
JOIN Seat S ON SS.seatID = S.seatID;
-- View 4: Customer details
CREATE VIEW CustomerDetails AS
SELECT 
    M.title, 
    S.date, 
    S.time, 
    T.customerName, 
    T.price, 
    SE."row", 
    SE."column", 
    SE.type
FROM Ticket T
JOIN Showing S ON T.showingID = S.showingID
JOIN Movie M ON S.movieID = M.movieID
JOIN Seat SE ON T.seatID = SE.seatID;