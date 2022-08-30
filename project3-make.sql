/*
 *  project3.sql
 * 
 *  author: Jacky Wang
 *  collaborators: Jordan Tehranchi
 */


-- Single line comment
/* Also comment*/ 


DROP TABLE IF EXISTS books1;

/*Step 1: create the table, with the Number column as PRIMARY KEY*/
CREATE TABLE books1 (
	Number INTEGER PRIMARY KEY, 
	Title TEXT, 
	ISBN TEXT, 
	PublicationDate DATE, 
	Pages INTEGER);

/*Step 2: Inserting the data into the table*/
INSERT INTO books1 VALUES (1, 'Harry Potter and the Philosopher''s Stone', '0-7475-3269-9', '1997-06-26',223);
INSERT INTO books1 
	VALUES  (2, 'Harry Potter and the Chamber of Secrets', '0-7475-3849-2', '1998-07-02',251),
		(3, 'Harry Potter and the Prisoner of Azkaban', '0-7475-4215-5', '1999-07-08',317),
		(4, 'Harry Potter and the Goblet of Fire', '0-7475-4624-X', '2000-07-08',636),
		(5, 'Harry Potter and the Order of the Phoenix', '0-7475-5100-6', '2003-06-21',766),
		(6, 'Harry Potter and the Half-Blood Prince', '0-7475-8108-8', '2005-07-16',607),
		(7, 'Harry Potter and the Deathly Hallows', '0-545-01022-5', '2007-07-21',607),
		(8, 'Harry Potter and the Bunnies of Doom', '1-234-56789-0', '2010-01-15',NULL);

/*Step 3: Deleting row 8, the 8th harry potter book*/
SELECT * FROM books1 WHERE number = 8;
DELETE FROM books1 WHERE number = 8;
SELECT * FROM books1;



/*Step 5: Create a second table and copy data*/
DROP TABLE IF EXISTS books2;

CREATE TABLE books2 AS 
SELECT * FROM public.project3_us_books;
SELECT * FROM books2;


/*Step 6: Create the final table*/
DROP TABLE IF EXISTS books;

CREATE TABLE books (
	Number INTEGER PRIMARY KEY, 
	Title TEXT NOT NULL, 
	ISBN TEXT NOT NULL UNIQUE, 
	PublicationDate DATE NOT NULL, 
	Pages INTEGER,
	ustitle TEXT,
	uspublicationdate DATE,
	uspages INTEGER);

/*Step 7: Populate books*/
INSERT INTO books SELECT books1.number, books1.title, books1.isbn, books1.publicationdate, books1.pages, books2.number, books2.publicationdate, books2.pages 
FROM books1, books2 
WHERE books1.number = books2.number;


/*Step 8: Create the US titles*/
UPDATE books SET ustitle = title;

/*Step 9: Fix errors*/
UPDATE books SET ustitle = 'Harry Potter and the Sorcerer''s Stone' WHERE number = 1;
SELECT * FROM books ORDER BY number;









