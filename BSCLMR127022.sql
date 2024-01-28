
/*Array*/

CREATE TABLE students (
    student_id serial PRIMARY KEY,
    student_name VARCHAR(200),
    mobile_numbers TEXT []  
);  

INSERT INTO students (student_name, mobile_numbers)  
VALUES('Kipronoh Gideon' ,'{"(+254)-733-1234"}'),  
('Emma wambui','{"(+254)-743-5678"}'),  
('David kamua','{"(+254)-738-7658","(+254)-789-23458"}'); 

SELECT * FROM students;

INSERT INTO students (student_name, mobile_numbers) VALUES ('James Otieno', '{"(+254)-989-8998"}');

SELECT COUNT(*) FROM students;

CREATE TABLE courses (
    course_id serial PRIMARY KEY,
    course_name VARCHAR(200),
    instructor_name VARCHAR(200),
    grades INT
);

INSERT INTO courses (course_name, instructor_name, grades)
VALUES
    ('Advanced Database ', 'Ann Muchiri', 94),
    ('Numerical Methods', 'Andrew Yotui', 73),
    ('MIS 4101', 'Dr. Evans', 85);
	
SELECT * FROM courses;

CREATE TABLE student_fees (
    student_id INT REFERENCES students(student_id),
    amount_paid DECIMAL(10, 2),
    payment_date DATE,
    payment_method VARCHAR(50)
);

INSERT INTO student_fees (student_id, amount_paid, payment_date, payment_method)
VALUES
    (001, 5000.00, '2024-01-15', 'Mpesa'),
    (008, 7500.00, '2024-01-20', 'Bank Transfer'),
    (003, 16000.00, '2024-01-25', 'Mpesa'),
    (009, 30000.00, '2024-01-01', 'Cheque'),
    (006, 14000.00, '2024-01-05', 'NBK');
	
SELECT * FROM student_fees

UPDATE student_fees
SET amount_paid = 8000.00, payment_date = '2024-01-30', payment_method = 'Mpesa'
WHERE student_id = 1;


/*JSON Datatype*/

CREATE TABLE Orders (  
    Order_id serial NOT NULL PRIMARY KEY,  
    Order_description json NOT NULL  
);

INSERT INTO Orders (Order_description)  
VALUES('{ "Client": "Olivia Smith", "items": {"product": "iphone11 pro max","qty": 1}}'); 

INSERT INTO Orders  (Order_description)  
VALUES('{ "Client": "Dorcas Rigathi", "items": {"product": "Hair shampoo","qty": 2}}'),  
('{ "Client": "Peter Koech", "items": {"product": "Belgium chocolate ice cream","qty": 7}}'),  
('{ "Client": " Davis Kemboi", "items": {"product": "Barbie doll","qty": 3}}'),  
 ('{ "Client": "Chris Brown", "items": {"product": "puzzle set","qty": 10}}'); 

Select * from Orders

SELECT Order_description  -> 'Client' AS Client  
FROM Orders;

SELECT Order_description  ->> 'Client' AS Client  
FROM Orders; 

/*Aggregate Functions*/

SELECT   
   MAX (CAST (Order_description -> 'items' ->> 'qty' AS INTEGER)),  
   MIN (CAST (Order_description -> 'items' ->> 'qty' AS INTEGER)),  
   AVG (CAST (Order_description -> 'items' ->> 'qty' AS INTEGER)),  
   SUM (CAST (Order_description -> 'items' ->> 'qty' AS INTEGER))
 FROM Orders  
   

SELECT Order_description ->> 'purchaser' AS Purchaser   
FROM Orders
WHERE Order_description-> 'items' ->> 'product' = 'Belgium chocolate ice cream';  
FROM Orders; 


SELECT Order_description  ->> 'Client' AS Client,  
Order_description -> 'items' ->> 'product' AS product  
FROM Orders  
WHERE CAST ( Order_description-> 'items' ->> 'qty' AS INTEGER) = 3 


SELECT json_each (Order_description)  
FROM Orders; 

SELECT json_typeof(Order_description->'items')  
FROM Orders; 


CREATE TABLE Inventory (
    Item_id serial NOT NULL PRIMARY KEY,
    Item_details json NOT NULL
);

INSERT INTO Inventory (Item_details)
VALUES
    ('{ "product": "Laptops", "quantity": 10, "supplier": "TechSupplier "}'),
    ('{ "product": "Hair shampoo", "quantity": 20, "supplier": "BeautyCo Ltd."}'),
    ('{ "product": "ice cream", "quantity": 15, "supplier": "SweetTreats"}'),
    ('{ "product": "Barbie doll", "quantity": 5, "supplier": "ToyEmpire"}'),
    ('{ "product": "Gaming Pads", "quantity": 30, "supplier": "GamesRUs"}');


SELECT * FROM Inventory;


SELECT Item_details ->> 'product' AS product FROM Inventory;


SELECT
    MAX(CAST(Item_details ->> 'quantity' AS INTEGER)),
    MIN(CAST(Item_details ->> 'quantity' AS INTEGER)),
    AVG(CAST(Item_details ->> 'quantity' AS INTEGER)),
    SUM(CAST(Item_details ->> 'quantity' AS INTEGER))
FROM Inventory;


SELECT Item_details ->> 'product' AS Product
FROM Inventory
WHERE Item_details->> 'product' = 'Belgium chocolate ice cream';

SELECT
    Item_details ->> 'product' AS Product,
    CAST(Item_details ->> 'quantity' AS INTEGER) AS Quantity
FROM Inventory
WHERE CAST(Item_details ->> 'quantity' AS INTEGER) = 3;

SELECT json_each(Item_details) FROM Inventory;

SELECT json_typeof(Item_details->'items') FROM Inventory;


/*Hstore data type */
CREATE TABLE Book (
    Book_id serial PRIMARY KEY,
    Book_title VARCHAR,
    Book_attr hstore
);

INSERT INTO Book (Book_title, Book_attr)
VALUES
    ('A Doll''s House',
     '"rating" => "4.5",
       "genre" => "Drama/play",
       "author" => "Henrik Ibsen",
       "publication_year" => "1879",
       "pages" => "68"'),

    ('Blossoms of the Savannah',
     '"rating" => "4.5",
       "genre" => "Novel",
       "author"  => "Henry Ole Kulet",
       "publication_year" => "2008",
       "pages" => "262"'),

    ('The Pearl',
     '"rating" => "4.5",
       "genre" => "Fiction",
       "author" => "John Steinbeck",
       "publication_year" => "1947",
       "pages" => "96"');


INSERT INTO Book (Book_title, Book_attr)
VALUES
    ('Think and Grow Rich',
     '"rating" => "4.7",
       "genre" => "Self-Help",
       "author" => "Napoleon Hill",
       "publication_year" => "1937",
       "pages" => "238"');


SELECT * FROM Book;


SELECT
    Book_attr -> 'pages' AS Number_of_pages
FROM
    Book;

SELECT
    Book_title,
    Book_attr -> 'genre' AS Genre
FROM Book
WHERE
    Book_attr -> 'publication_year' = '1960';
	

CREATE TABLE Music (
    Music_id serial PRIMARY KEY,
    Music_title VARCHAR,
    Music_attr hstore
);


INSERT INTO Music (Music_title, Music_attr)
VALUES
    ('Enjoy',
     '"rating" => "4.5",
       "genre" => "Bongo Flava",
       "artist" => "Diamond Platnumz",
       "release_year" => "2022",
       "duration" => "3:30"'),

    ('Mbona',
     '"rating" => "4.3",
       "genre" => "Hip-Hop",
       "artist"  => "Khaligraph Jones",
       "release_year" => "2022",
       "duration" => "4:15"'),

    ('Perfect',
     '"rating" => "4.8",
       "genre" => "Pop",
       "artist" => "Ed Sheeran",
       "release_year" => "2017",
       "duration" => "4:23"');

INSERT INTO Music (Music_title, Music_attr)
VALUES
    ('Despacito',
     '"rating" => "4.6",
       "artist" => "Luis Fonsi ft. Daddy Yankee",
       "release_year" => "2017",
       "duration" => "3:48"');


SELECT * FROM Music;


SELECT
    Music_attr -> 'duration' AS Duration
FROM
    Music;


SELECT
    Music_title,
    Music_attr -> 'genre' AS Genre
FROM Music
WHERE
    Music_attr -> 'release_year' = '1975';
	

/*Network DataType */

CREATE TABLE tbl_WiFiNetworkDataType
(
    ID INT,
    MyIPAddress INET,
    MyMACAddress MACADDR
);

INSERT INTO tbl_WiFiNetworkDataType
VALUES 
    (1, '10.0.2.8/16', '08008b:010803'),
    (2, '192.168.1.0/24', '08:00:2b:01:02:03'),
    (3, '150.155.124.0/32', '0800.2b01.0203'),
    (4, '08.26/16', '08002b:010203');

SELECT * FROM tbl_WiFiNetworkDataType;


/*Dealing with case-insensitive unique data*/

CREATE TABLE customers (
    id serial PRIMARY KEY,
    email citext NOT NULL UNIQUE,
    password_digest VARCHAR NOT NULL
);


INSERT INTO customers (email, password_digest)
VALUES
    ('james68@gmail.com', 'user123'),
    ('davidsmith@gmail.com', 'password456');
	
SELECT * FROM customers;


CREATE TABLE employees (
    id serial PRIMARY KEY,
    email citext NOT NULL UNIQUE,
    password_digest VARCHAR NOT NULL
);


INSERT INTO employees (email, password_digest)
VALUES
    ('admin@gmail.com', 'adminpass'),
    ('andrewyotui@gmail.com', 'employee123');

SELECT * FROM employees;

/*User Defined types-Composite Types using Create Type*/

CREATE TYPE customer_info AS (
    customer_name text,
    contact_number text,
    address text
);


CREATE TABLE customer_data (
    customer_info customer_info,
    total_purchases numeric
);


INSERT INTO customer_data VALUES (ROW('kijana mdogo', '+2543456789', 'Ngong racecourse'), 500.25);
INSERT INTO customer_data VALUES (ROW('kimutai kiptoo', '+254656789', 'limuru'), 560.25);
INSERT INTO customer_data VALUES (ROW('seth marjorie', '+2541456789', 'Transmara'), 720.25);


SELECT * FROM customer_data;


/*bytea data type- to capture image data*/

CREATE TABLE laptop
(
    Laptop_id integer,
    Laptop_name Varchar(25),
    Laptop_price int,
    Laptop_image bytea
);


INSERT INTO laptop 
VALUES (1, 'Dell XPS', 1500, pg_read_binary_file('D:\Postgre\DELLIMAGE.jpg')::bytea);

INSERT INTO laptop 
VALUES (2, 'HP Spectre', 1300, pg_read_binary_file('D:\Postgre\HPIMAGE.jpg')::bytea);

SELECT * FROM laptop;



CREATE TABLE book
(
    Book_id integer,
    Book_title Varchar(50),
    Book_author Varchar(50),
    Book_price int,
    Book_cover_image bytea
);


INSERT INTO book 
VALUES (
    1,
    'Blossoms of the Savanah ',
    'Henry Ole Kulet',
    20,
    pg_read_binary_file('D:\Postgre\Blossoms of the Savanah_IMAGE.jpg')::bytea
);

INSERT INTO book 
VALUES (
    2,
    'A Dolls House ',
    'Henrik Ibsen',
    15,
    pg_read_binary_file('D:\Postgre\1984_IMAGE.jpg')::bytea
);


SELECT * FROM book;


CREATE TABLE laptop1
(
    Laptop_id integer,
    Laptop_name Varchar(25),
    Laptop_price int,
    Laptop_image varchar(200)
);


INSERT INTO laptop1 
VALUES (1, 'Dell', 1500, 'D:\Postgre\DELLIMAGE.jpg');

SELECT * FROM laptop1;


CREATE TABLE laptop2
(
    Laptop_id integer,
    Laptop_name Varchar(25),
    Laptop_price int,
    Laptop_image Oid
);


INSERT INTO laptop2 
VALUES (1, 'HP EliteBook', 1300, lo_import('D:\Postgre\HPIMAGE.jpg'));


SELECT * FROM laptop2;

/*Extract data from some XML document and integrating external data=Handles large documents*/

CREATE TABLE hostel AS SELECT xml
$$
<hostels>
  <hostel id="A">
    <name>Men Hostel</name>
    <rooms>
      <room id="101"><capacity>2</capacity><comment>Quiet and spacious</comment></room>
      <room id="102"><capacity>4</capacity></room>
    </rooms>
    <students>
      <student id="1001">
        <name>kipronoh Gideon</name><age>19</age><course>Computer Science</course>
      </student>
    </students>
  </hostel>
  <hostel id="B">
    <name>Women Hostel</name>
    <rooms>
      <room id="201"><capacity>3</capacity><comment>Nice view from the window</comment></room>
    <room id="202"><capacity>2</capacity></room>
    </rooms>
    <students>
      <student id="1002">
        <name>Jane maina</name><age>22</age><course>Education</course>
      </student>
      <student id="1003">
        <name>margaret wambui</name><age>21</age><course>BOBIT</course>
      </student>
    </students>
  </hostel>
</hostels>
$$ AS hostel;


SELECT * FROM hostel;


SELECT xmltable.*
FROM hostel,
     XMLTABLE ('/hostels/hostel/rooms/room' PASSING hostel
               COLUMNS
                  id FOR ORDINALITY,
                  hostel_name text PATH '../../name' NOT NULL,
                  room_id int PATH '@id' NOT NULL,
                  capacity int,
                  comment text PATH 'comment' DEFAULT 'A regular room'
              );

CREATE TABLE student_hostel AS SELECT xml
$$
<student_hostels>
  <student_hostel id="C">
    <name>Cottage Hostel</name>
    <rooms>
      <room id="301"><capacity>1</capacity><comment>Quiet and cozy</comment></room>
      <room id="302"><capacity>3</capacity></room>
    </rooms>
    <students>
      <student id="1004">
        <name>Alice wambui</name><age>19</age><course>Psychology</course>
      </student>
    </students>
  </student_hostel>
  <student_hostel id="D">
    <name>jumia Hostel</name>
    <rooms>
      <room id="401"><capacity>2</capacity><comment>Great study environment</comment></room>
      <room id="402"><capacity>4</capacity></room>
    </rooms>
    <students>
      <student id="1005">
        <name>Esther mutua</name><age>20</age><course>Social work</course>
      </student>
      <student id="1006">
        <name>Eva atieno</name><age>21</age><course>Theology</course>
      </student>
    </students>
  </student_hostel>
</student_hostels>
$$ AS student_hostel;


SELECT * FROM student_hostel;


SELECT xmltable.*
FROM student_hostel,
     XMLTABLE ('/student_hostels/student_hostel/rooms/room' PASSING student_hostel
               COLUMNS
                  id FOR ORDINALITY,
                  hostel_name text PATH '../../name' NOT NULL,
                  room_id int PATH '@id' NOT NULL,
                  capacity int,
                  comment text PATH 'comment' DEFAULT 'A regular room'
              );



