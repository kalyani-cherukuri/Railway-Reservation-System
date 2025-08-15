# Railway Reservation System (SQL)

This project is a relational database design for a railway reservation system.  
It includes tables for users, trains, stations, tickets, passengers, and booking/cancellation records.

## 📌 Features
- Create tables with primary and foreign key relationships
- Insert sample data
- Run queries to fetch ticket and passenger information
- Example: Find all users who booked tickets for Pinakini Express

## 🗂 Database Structure
**Main Tables:**
- USER
- TRAIN
- STATION
- TRAIN_STATUS
- TICKET
- PASSENGER
- STARTS
- STOPS_AT
- REACHES
- BOOKS
- CANCEL

## 🛠 SQL Example
```sql
SELECT u.user_id, CONCAT(u.first_name, ' ', u.last_name) AS name
FROM USER u
JOIN TICKET tc ON u.user_id = tc.user_id
JOIN TRAIN t ON t.train_no = tc.train_no
WHERE t.train_name LIKE 'pinakiniexp';
```

## 🚀 How to Use
1. Run `schema.sql` to create the database structure.
2. Run `insert_data.sql` to populate with sample data.
3. Run `queries.sql` to test queries.

## 💻 Tech Used
- MySQL

## 📜 License
This project is open-source and free to use.
