DROP TABLE bookings;
DROP TABLE members;
DROP TABLE activities;

CREATE TABLE members
(
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  date_of_birth VARCHAR(255),
  premium_member BOOLEAN
);

CREATE TABLE activities
(
  id SERIAL8 primary key,
  activity_name VARCHAR(255),
  day VARCHAR(255),
  start_time VARCHAR(255),
  duration INT,
  capacity INT
);

CREATE TABLE bookings
(
  id SERIAL8 primary key,
  member_id INT8 references members(id) on delete cascade,
  activity_id INT8 references activities(id) on delete cascade
);
