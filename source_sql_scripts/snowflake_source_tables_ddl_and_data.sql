-- create source tables + data insert
--------------------------------
--------------------------------

-- -- cities
-- CREATE TABLE FIRST_SNOWFLAKE_DATABASE.DATALAKE.cities (
--     city_id INT,
--     city_name STRING
-- );

-- INSERT INTO FIRST_SNOWFLAKE_DATABASE.DATALAKE.cities (city_id, city_name) VALUES
-- (1, 'Tel Aviv'),
-- (2, 'Jerusalem'),
-- (3, 'Haifa'),
-- (4, 'Rishon LeZion'),
-- (5, 'Petah Tikva'),
-- (6, 'Ashdod'),
-- (7, 'Netanya'),
-- (8, 'Beer Sheva'),
-- (9, 'Holon'),
-- (10, 'Bnei Brak'),
-- (11, 'Rehovot'),
-- (12, 'Bat Yam'),
-- (13, 'Ashkelon'),
-- (14, 'Herzliya'),
-- (15, 'Kfar Saba'),
-- (16, 'Modiin'),
-- (17, 'Nahariya'),
-- (18, 'Eilat'),
-- (19, 'Ramat Gan'),
-- (20, 'Hadera');

--------------------------------

-- genders
-- CREATE TABLE FIRST_SNOWFLAKE_DATABASE.DATALAKE.genders (
--     gender_id INT,
--     gender_name STRING
-- );

-- INSERT INTO FIRST_SNOWFLAKE_DATABASE.DATALAKE.genders (gender_id, gender_name) VALUES
-- (1, 'Male'),
-- (2, 'Female'),
-- (3, 'Non-binary'),
-- (4, 'Other');

--------------------------------

-- -- customers
-- CREATE TABLE FIRST_SNOWFLAKE_DATABASE.DATALAKE.customers (
--     user_id INT,
--     first_name STRING,
--     middle_name STRING,
--     last_name STRING,
--     birth_date DATE,
--     gender_id INT,
--     city_id INT,
--     relationship_status STRING,
--     looking_for_gender_gender_id INT,
--     looking_for_kind_of_relationship STRING
-- );

-- INSERT INTO FIRST_SNOWFLAKE_DATABASE.DATALAKE.customers (user_id, first_name, middle_name, last_name, birth_date, gender_id, city_id, relationship_status, looking_for_gender_gender_id, looking_for_kind_of_relationship) VALUES
-- (1, 'John', 'Michael', 'Doe', '1985-06-15', 1, 3, 'Single', 2, 'Long-term'),
-- (2, 'Jane', '', 'Smith', '1990-08-22', 2, 5, 'Married', 1, 'Marriage'),
-- (3, 'Alex', 'Jordan', 'Brown', '1988-04-11', 3, 2, 'In a relationship', 2, 'Friendship'),
-- (4, 'Emily', 'Anne', 'Johnson', '1995-02-19', 2, 1, 'Single', 1, 'Casual'),
-- (5, 'Michael', 'David', 'Williams', '1982-09-25', 1, 7, 'Divorced', 3, 'Long-term'),
-- (6, 'Sarah', '', 'Martinez', '1991-07-30', 2, 6, 'Single', 1, 'Casual'),
-- (7, 'David', 'Lee', 'Clark', '1979-12-10', 1, 4, 'Widowed', 2, 'Marriage'),
-- (8, 'Laura', 'Grace', 'Anderson', '1993-03-15', 2, 8, 'In a relationship', 1, 'Friendship'),
-- (9, 'Robert', 'James', 'Thomas', '1986-10-05', 1, 10, 'Single', 2, 'Long-term'),
-- (10, 'Sophia', '', 'White', '1997-05-28', 2, 9, 'Divorced', 1, 'Casual'),
-- (11, 'Brian', 'Joseph', 'Harris', '1980-11-14', 1, 11, 'Married', 3, 'Marriage'),
-- (12, 'Rebecca', 'Claire', 'Lewis', '1994-06-07', 2, 12, 'Single', 1, 'Friendship'),
-- (13, 'Ethan', '', 'Walker', '1983-01-18', 1, 13, 'In a relationship', 2, 'Long-term'),
-- (14, 'Olivia', 'Marie', 'Hall', '1992-09-09', 2, 14, 'Single', 1, 'Casual'),
-- (15, 'Christopher', 'Daniel', 'Allen', '1987-08-20', 1, 15, 'Widowed', 3, 'Marriage'),
-- (16, 'Natalie', '', 'Young', '1998-12-12', 2, 16, 'Single', 1, 'Friendship'),
-- (17, 'Matthew', 'Ryan', 'King', '1981-04-23', 1, 17, 'Divorced', 2, 'Long-term'),
-- (18, 'Isabella', 'Rose', 'Scott', '1996-07-31', 2, 18, 'Single', 1, 'Casual'),
-- (19, 'Daniel', 'Thomas', 'Green', '1978-05-16', 1, 19, 'Married', 3, 'Marriage'),
-- (20, 'Hannah', '', 'Baker', '2000-10-26', 2, 20, 'Single', 1, 'Friendship');
--------------------------------

-- -- app_events

-- drop table  FIRST_SNOWFLAKE_DATABASE.DATALAKE.app_events;

CREATE TABLE FIRST_SNOWFLAKE_DATABASE.DATALAKE.app_events (
    User_ID INT,
    Activity STRING,
    Timestamp TIMESTAMP,
    payment_method STRING,
    match_source STRING,
    amount_nis FLOAT,
    User_ID_matched INT
);

-- truncate table FIRST_SNOWFLAKE_DATABASE.DATALAKE.app_events;

INSERT INTO FIRST_SNOWFLAKE_DATABASE.DATALAKE.app_events (User_ID, Activity, Timestamp, payment_method, match_source, amount_nis) VALUES
(1, 'Login', '2025-02-15 08:23:45', NULL, NULL, NULL),
(2, 'Message Sent', '2025-02-15 09:30:21', NULL, 'Manual Search', NULL),
(3, 'Profile Viewed', '2025-02-16 11:45:10', NULL, NULL, NULL),
(4, 'Message Received', '2025-02-16 14:50:33', NULL, 'Algorithm Suggestion', NULL),
(5, 'Subscription Purchased', '2025-02-17 17:35:45', 'Credit Card', NULL, 120.00),
(6, 'Login', '2025-02-17 19:10:50', NULL, NULL, NULL),
(7, 'Profile Viewed', '2025-02-18 08:12:35', NULL, NULL, NULL),
(8, 'Message Sent', '2025-02-18 13:20:15', NULL, 'Super Like', NULL),
(9, 'Subscription Purchased', '2025-02-19 15:05:25', 'PayPal', NULL, 99.99),
(10, 'Message Received', '2025-02-19 21:10:45', NULL, 'Mutual Like', NULL),
(11, 'Login', '2025-02-20 10:23:35', NULL, NULL, NULL),
(12, 'Profile Viewed', '2025-02-20 18:05:20', NULL, NULL, NULL),
(13, 'Subscription Purchased', '2025-02-21 07:30:15', 'Apple Pay', NULL, 150.00),
(14, 'Message Sent', '2025-02-21 11:12:40', NULL, 'Manual Search', NULL),
(15, 'Message Received', '2025-02-22 20:45:50', NULL, 'Algorithm Suggestion', NULL),
(16, 'Login', '2025-02-22 23:55:25', NULL, NULL, NULL),
(17, 'Profile Viewed', '2025-02-23 06:40:10', NULL, NULL, NULL),
(18, 'Subscription Purchased', '2025-02-23 14:15:30', 'Google Pay', NULL, 200.00),
(19, 'Message Sent', '2025-02-24 09:30:45', NULL, 'Super Like', NULL),
(20, 'Message Received', '2025-02-24 19:50:15', NULL, 'Mutual Like', NULL),
(21, 'Login', '2025-02-25 05:20:35', NULL, NULL, NULL),
(22, 'Profile Viewed', '2025-02-25 17:10:10', NULL, NULL, NULL),
(23, 'Message Sent', '2025-02-26 12:35:55', NULL, 'Manual Search', NULL),
(24, 'Subscription Purchased', '2025-02-26 15:25:10', 'Bank Transfer', NULL, 180.00),
(25, 'Message Received', '2025-02-27 22:40:20', NULL, 'Algorithm Suggestion', NULL),
(26, 'Login', '2025-02-27 23:55:50', NULL, NULL, NULL),
(27, 'Profile Viewed', '2025-02-28 08:10:30', NULL, NULL, NULL),
(28, 'Subscription Purchased', '2025-02-28 14:50:45', 'Credit Card', NULL, 99.00),
(29, 'Message Sent', '2025-02-28 19:05:20', NULL, 'Super Like', NULL),
(30, 'Message Received', '2025-03-01 07:40:10', NULL, 'Mutual Like', NULL),
(31, 'Login', '2025-03-01 12:30:45', NULL, NULL, NULL),
(32, 'Profile Viewed', '2025-03-01 17:50:20', NULL, NULL, NULL),
(33, 'Subscription Purchased', '2025-03-02 08:15:30', 'PayPal', NULL, 175.00),
(34, 'Message Sent', '2025-03-02 13:40:15', NULL, 'Manual Search', NULL),
(35, 'Message Received', '2025-03-02 20:50:40', NULL, 'Algorithm Suggestion', NULL),
(36, 'Login', '2025-03-03 06:55:20', NULL, NULL, NULL),
(37, 'Profile Viewed', '2025-03-03 11:25:10', NULL, NULL, NULL),
(38, 'Subscription Purchased', '2025-03-03 15:40:30', 'Apple Pay', NULL, 125.00),
(39, 'Message Sent', '2025-03-01 09:55:50', NULL, 'Super Like', NULL),
(40, 'Message Received', '2025-03-01 18:20:25', NULL, 'Mutual Like', NULL),
(41, 'Login', '2025-03-02 04:30:10', NULL, NULL, NULL),
(42, 'Profile Viewed', '2025-03-02 10:50:45', NULL, NULL, NULL),
(43, 'Subscription Purchased', '2025-03-02 14:35:15', 'Google Pay', NULL, 140.00),
(44, 'Message Sent', '2025-03-02 08:25:30', NULL, 'Manual Search', NULL),
(45, 'Message Received', '2025-03-02 19:15:40', NULL, 'Algorithm Suggestion', NULL),
(46, 'Login', '2025-03-01 07:05:50', NULL, NULL, NULL),
(47, 'Profile Viewed', '2025-03-01 12:20:35', NULL, NULL, NULL),
(48, 'Subscription Purchased', '2025-03-01 16:50:25', 'Bank Transfer', NULL, 190.00),
(49, 'Message Sent', '2025-03-03 09:45:15', NULL, 'Super Like', NULL),
(50, 'Message Received', '2025-03-03 21:10:30', NULL, 'Mutual Like', NULL),
(51, 'Super Likes Purchased', '2025-02-15 10:15:30', 'Credit Card', NULL, 50.00),
(52, 'Profile Boost Purchased', '2025-02-16 12:45:20', 'PayPal', NULL, 75.00),
(53, 'Super Likes Purchased', '2025-02-18 15:30:10', 'Apple Pay', NULL, 40.00),
(54, 'Profile Boost Purchased', '2025-02-19 18:55:45', 'Google Pay', NULL, 90.00),
(55, 'Super Likes Purchased', '2025-02-22 20:10:35', 'Bank Transfer', NULL, 60.00),
(56, 'Profile Boost Purchased', '2025-02-24 07:25:50', 'Credit Card', NULL, 85.00),
(57, 'Super Likes Purchased', '2025-02-26 11:40:25', 'PayPal', NULL, 55.00),
(58, 'Profile Boost Purchased', '2025-02-28 14:20:15', 'Apple Pay', NULL, 95.00),
(59, 'Super Likes Purchased', '2025-03-02 09:35:40', 'Google Pay', NULL, 70.00),
(60, 'Profile Boost Purchased', '2025-03-01 16:10:50', 'Bank Transfer', NULL, 100.00);

INSERT INTO FIRST_SNOWFLAKE_DATABASE.DATALAKE.app_events (User_ID, Activity, Timestamp, payment_method, match_source, amount_nis) VALUES
(1, 'Match', '2025-03-01 22:30:00', NULL, 'Super Like', NULL),
(2, 'Match', '2025-03-01 23:00:30', NULL, 'Mutual Like', NULL),
(3, 'Match', '2025-03-02 00:15:10', NULL, 'Algorithm Suggestion', NULL),
(4, 'Match', '2025-03-02 01:45:25', NULL, 'Manual Search', NULL),
(5, 'Match', '2025-03-02 03:30:55', NULL, 'Super Like', NULL),
(6, 'Match', '2025-03-02 06:10:10', NULL, 'Mutual Like', NULL),
(7, 'Match', '2025-03-02 08:00:20', NULL, 'Algorithm Suggestion', NULL),
(8, 'Match', '2025-03-03 09:40:35', NULL, 'Manual Search', NULL),
(9, 'Match', '2025-03-03 11:15:50', NULL, 'Super Like', NULL),
(10, 'Match', '2025-03-03 13:50:40', NULL, 'Mutual Like', NULL);

update FIRST_SNOWFLAKE_DATABASE.DATALAKE.app_events
set User_ID_matched=1

--------------------------------

-- Analyze 
----------
----------

select * from FIRST_SNOWFLAKE_DATABASE.DATALAKE.cities
select * from FIRST_SNOWFLAKE_DATABASE.DATALAKE.genders
select * from FIRST_SNOWFLAKE_DATABASE.DATALAKE.customers
select * from FIRST_SNOWFLAKE_DATABASE.DATALAKE.app_events
