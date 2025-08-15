-- Insert into USER
INSERT INTO USER (user_id, first_name, last_name, adhar_no, gender, age, mobile_no, email, city, state, pincode, _password, security_ques, security_ans)
VALUES
(1, 'ch', 'kalyani', '89389839', 'F', 19, '9885086388', 'cvnkalyani@gmail.com', 'Tenali', 'AP', '522201', '12345', 'favourite person', 'mom'),
(2, 'G', 'Harini', '382948329048', 'F', 19, '89787987', 'harini.gannavarapu@gmail.com', 'Vijayawada', 'AP', '522202', '23456', 'favourite person', 'sister'),
(3, 'G', 'Sowmya', '7648364874', 'F', 19, '832758', 'sowmya.girajala@gmail.com', 'Mangalagiri', 'AP', '522203', '34567', 'favourite person', 'Brother'),
(4, 'P', 'Dhathri', '7345975', 'F', 19, '42436784', 'dhathri.putty@gmail.com', 'Guntur', 'AP', '522204', '45678', 'favourite person', 'Dad');

-- Insert into TRAIN
INSERT INTO TRAIN (train_no, train_name, arrival_time, departure_time, availability_of_seats, date)
VALUES
(12711, 'pinakiniexp', '11:30:00', '11:40:00', 'A', '2017-04-10'),
(12315, 'cormandelexp', '12:45:00', '12:50:00', 'A', '2017-04-10');

-- Insert into STATION
INSERT INTO STATION (station_no, name, hault, arrival_time, train_no)
VALUES
(111, 'Vijayawada', 10, '11:30:00', 12711),
(222, 'Tirupathi', 5, '11:45:00', 12315);

-- Insert into TRAIN_STATUS
INSERT INTO TRAIN_STATUS (train_no, b_seats1, b_seats2, a_seats1, a_seats2, w_seats1, w_seats2, fare1, fare2)
VALUES
(12711, 10, 4, 0, 1, 1, 0, 100, 450),
(12315, 10, 5, 0, 0, 2, 1, 300, 600);

-- Insert into TICKET
INSERT INTO TICKET (id, user_id, status, no_of_passengers, train_no)
VALUES
(4001, 1, 'C', 1, 12711),
(4002, 2, 'N', 1, 12315);

-- Insert into PASSENGER
INSERT INTO PASSENGER (passenger_id, pnr_no, age, gender, user_id, reservation_status, seat_number, name, ticket_id)
VALUES
(5001, 78965, 19, 'F', 1, 'C', 'B6-45', 'Kalyani', 4001),
(5002, 54523, 20, 'F', 4, 'W', 'B3-21', 'Dhathri', 4002);

-- Insert into STARTS
INSERT INTO STARTS (train_no, station_no)
VALUES
(12711, 111),
(12315, 222);

-- Insert into STOPS_AT
INSERT INTO STOPS_AT (train_no, station_no)
VALUES
(12711, 222),
(12315, 111);

-- Insert into REACHES
INSERT INTO REACHES (train_no, station_no, time)
VALUES
(12711, 222, '04:00:00'),
(12315, 111, '05:35:00');

-- Insert into BOOKS
INSERT INTO BOOKS (user_id, id)
VALUES
(1, 4001),
(4, 4002);

-- Insert into CANCEL
INSERT INTO CANCEL (user_id, id, passenger_id)
VALUES
(1, 4001, 5001);
