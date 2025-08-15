-- 1. Find user ID and full name of all users who booked tickets for Pinakini Express
SELECT u.user_id, CONCAT(u.first_name, ' ', u.last_name) AS name
FROM USER u
JOIN TICKET tc ON u.user_id = tc.user_id
JOIN TRAIN t ON t.train_no = tc.train_no
WHERE t.train_name LIKE 'pinakiniexp';

-- 2. List all trains with available seats
SELECT train_no, train_name, availability_of_seats, date
FROM TRAIN
WHERE availability_of_seats = 'A';

-- 3. Show all passengers for a given train number (example: 12711)
SELECT p.passenger_id, p.name, p.age, p.gender, p.seat_number, p.reservation_status
FROM PASSENGER p
JOIN TICKET t ON p.ticket_id = t.id
WHERE t.train_no = 12711;

-- 4. Find all passengers from a specific city (example: Guntur)
SELECT p.name, p.age, u.city
FROM PASSENGER p
JOIN USER u ON p.user_id = u.user_id
WHERE u.city = 'Guntur';

-- 5. Show total number of tickets booked by each user
SELECT u.user_id, CONCAT(u.first_name, ' ', u.last_name) AS name, COUNT(tc.id) AS total_tickets
FROM USER u
JOIN TICKET tc ON u.user_id = tc.user_id
GROUP BY u.user_id;

-- 6. Show cancellation details (user name, ticket ID, passenger name)
SELECT u.user_id, CONCAT(u.first_name, ' ', u.last_name) AS name, c.id AS ticket_id, p.name AS passenger_name
FROM CANCEL c
JOIN USER u ON c.user_id = u.user_id
JOIN PASSENGER p ON c.passenger_id = p.passenger_id;

-- 7. List all stations a specific train stops at (example: 12711)
SELECT s.station_no, s.name, s.hault, s.arrival_time
FROM STOPS_AT sa
JOIN STATION s ON sa.station_no = s.station_no
WHERE sa.train_no = 12711;

-- 8. Find highest fare among all trains
SELECT train_no, MAX(GREATEST(fare1, fare2)) AS highest_fare
FROM TRAIN_STATUS;
