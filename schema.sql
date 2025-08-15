-- Create USER table
CREATE TABLE IF NOT EXISTS USER (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    adhar_no VARCHAR(20),
    gender CHAR(1),
    age INT,
    mobile_no VARCHAR(50),
    email VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(20),
    _password VARCHAR(50),
    security_ques VARCHAR(50),
    security_ans VARCHAR(50)
);

-- Create TRAIN table
CREATE TABLE IF NOT EXISTS TRAIN (
    train_no INT PRIMARY KEY,
    train_name VARCHAR(50),
    arrival_time TIME,
    departure_time TIME,
    availability_of_seats CHAR(1),
    date DATE
);

-- Create STATION table
CREATE TABLE IF NOT EXISTS STATION (
    station_no INT,
    name VARCHAR(50),
    hault INT,
    arrival_time TIME,
    train_no INT,
    PRIMARY KEY (station_no, train_no),
    CONSTRAINT fk_station_train FOREIGN KEY (train_no) REFERENCES TRAIN(train_no)
);

-- Create TRAIN_STATUS table
CREATE TABLE IF NOT EXISTS TRAIN_STATUS (
    train_no INT PRIMARY KEY,
    b_seats1 INT,
    b_seats2 INT,
    a_seats1 INT,
    a_seats2 INT,
    w_seats1 INT,
    w_seats2 INT,
    fare1 FLOAT,
    fare2 FLOAT,
    CONSTRAINT fk_status_train FOREIGN KEY (train_no) REFERENCES TRAIN(train_no)
);

-- Create TICKET table
CREATE TABLE IF NOT EXISTS TICKET (
    id INT PRIMARY KEY,
    user_id INT,
    status CHAR(1),
    no_of_passengers INT,
    train_no INT,
    CONSTRAINT fk_ticket_user FOREIGN KEY (user_id) REFERENCES USER(user_id),
    CONSTRAINT fk_ticket_train FOREIGN KEY (train_no) REFERENCES TRAIN(train_no)
);

-- Create PASSENGER table
CREATE TABLE IF NOT EXISTS PASSENGER (
    passenger_id INT PRIMARY KEY,
    pnr_no INT,
    age INT,
    gender CHAR(1),
    user_id INT,
    reservation_status CHAR(1),
    seat_number VARCHAR(5),
    name VARCHAR(50),
    ticket_id INT,
    CONSTRAINT fk_passenger_user FOREIGN KEY (user_id) REFERENCES USER(user_id),
    CONSTRAINT fk_passenger_ticket FOREIGN KEY (ticket_id) REFERENCES TICKET(id)
);

-- Create STARTS table
CREATE TABLE IF NOT EXISTS STARTS (
    train_no INT,
    station_no INT,
    PRIMARY KEY (train_no, station_no),
    CONSTRAINT fk_starts_train FOREIGN KEY (train_no) REFERENCES TRAIN(train_no),
    CONSTRAINT fk_starts_station FOREIGN KEY (station_no) REFERENCES STATION(station_no)
);

-- Create STOPS_AT table
CREATE TABLE IF NOT EXISTS STOPS_AT (
    train_no INT,
    station_no INT,
    PRIMARY KEY (train_no, station_no),
    CONSTRAINT fk_stops_train FOREIGN KEY (train_no) REFERENCES TRAIN(train_no),
    CONSTRAINT fk_stops_station FOREIGN KEY (station_no) REFERENCES STATION(station_no)
);

-- Create REACHES table
CREATE TABLE IF NOT EXISTS REACHES (
    train_no INT,
    station_no INT,
    time TIME,
    PRIMARY KEY (train_no, station_no),
    CONSTRAINT fk_reaches_train FOREIGN KEY (train_no) REFERENCES TRAIN(train_no),
    CONSTRAINT fk_reaches_station FOREIGN KEY (station_no) REFERENCES STATION(station_no)
);

-- Create BOOKS table
CREATE TABLE IF NOT EXISTS BOOKS (
    user_id INT,
    id INT,
    PRIMARY KEY (user_id, id),
    CONSTRAINT fk_books_user FOREIGN KEY (user_id) REFERENCES USER(user_id),
    CONSTRAINT fk_books_ticket FOREIGN KEY (id) REFERENCES TICKET(id)
);

-- Create CANCEL table
CREATE TABLE IF NOT EXISTS CANCEL (
    user_id INT,
    id INT,
    passenger_id INT,
    PRIMARY KEY (user_id, id, passenger_id),
    CONSTRAINT fk_cancel_ticket FOREIGN KEY (id) REFERENCES TICKET(id),
    CONSTRAINT fk_cancel_passenger FOREIGN KEY (passenger_id) REFERENCES PASSENGER(passenger_id),
    CONSTRAINT fk_cancel_user FOREIGN KEY (user_id) REFERENCES USER(user_id)
);
