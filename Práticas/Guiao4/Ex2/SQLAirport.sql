create table airport (
	Airport_code int CHECK (Airport_code > 0) PRIMARY KEY NOT NULL,
	City varchar(230),
	State_name varchar(230),
	Airport_name varchar(230) UNIQUE NOT NULL 
);


create table airplane_type (
	Airplane_Type_name varchar(230) PRIMARY KEY,
	Max_seats int CHECK (Max_seats > 0),
	Company varchar(230)
);

create table can_land (
	Airpot_code_cl int REFERENCES airport(Airport_code) NOT NULL,
	type_name_cl varchar(230) REFERENCES airplane_type(Airplane_Type_name),
);


create table airplane (
	Airplane_id int PRIMARY KEY NOT NULL,
	Total_of_seats int ,
	Type_name_a varchar(230)
);

create table flight(
	Number int PRIMARY KEY NOT NULL,
	Airline varchar(230),
	Weekdays varchar(230)
);


create table flight_leg(
	Leg_no int PRIMARY KEY,
	Scheduled_arr_time datetime,
	Scheduled_dep_time datetime,
	Aiport_code_fl int REFERENCES airport(Airport_code) NOT NULL,
	Number int REFERENCES flight(Number) NOT NULL
);


create table leg_instance(
	date_leg date PRIMARY KEY,
	No_of_avail_seats int DEFAULT 0,
	Dep_time datetime,
	Arr_time datetime,
	Airplane_id_li int REFERENCES airplane(Airplane_id) NOT NULL,
	AirPort_code_li int REFERENCES airport(Airport_code) NOT NULL,
	Leg_no_instance int REFERENCES flight_leg(Leg_no)
);

create table seat (
	Seat_no int PRIMARY KEY,
	Costomer_name varchar(230),
	Cphone int UNIQUE NOT NULL,
	Date_s date REFERENCES leg_instance(date_leg),
);



create table fare(
	Code int PRIMARY KEY,
	Ammount smallmoney DEFAULT 0, 
	Restrictions varchar(230),
	Numer_f int REFERENCES flight(Number) NOT NULL
);