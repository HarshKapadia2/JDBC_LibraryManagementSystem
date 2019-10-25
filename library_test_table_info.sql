CREATE TABLE librarian
(
	lib_id int(10) unsigned PRIMARY KEY,
	f_name varchar(20) NOT NULL,
	l_name varchar(20) NOT NULL,
	username varchar(10) UNIQUE NOT NULL,
	password varchar(10) UNIQUE NOT NULL
);

CREATE TABLE student
(
	uid decimal(10) PRIMARY KEY,
	f_name varchar(20) NOT NULL,
	l_name varchar(20) NOT NULL,
	gender varchar(15),
	yr varchar(10) NOT NULL,
	division varchar(5) NOT NULL,
	roll_no decimal(3) NOT NULL
);

CREATE TABLE book
(
	isbn decimal(10) PRIMARY KEY,
	name varchar(30) NOT NULL,
	author varchar(30) NOT NULL,
	publisher varchar(30) NOT NULL,
	issued varchar(3) NOT NULL
);

CREATE TABLE issue_book
(
	i_id int(10) unsigned PRIMARY KEY,
	lib_id int(10) unsigned NOT NULL, 
	st_uid decimal(10) NOT NULL, 
	isbn decimal(10) NOT NULL, 
	issue_date date NOT NULL,

	FOREIGN KEY (lib_id) REFERENCES librarian(lib_id),
	FOREIGN KEY (st_uid) REFERENCES student(uid),
	FOREIGN KEY (isbn) REFERENCES book(isbn)
);

CREATE TABLE return_book
(
	i_id int(10) unsigned NOT NULL,
	due_date date NOT NULL,
	fine decimal(5) NOT NULL,

	FOREIGN KEY (i_id) REFERENCES issue_book(i_id)
);