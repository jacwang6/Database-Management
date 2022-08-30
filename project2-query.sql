/*
 *  project2.sql
 * 
 *  author: Jacky Wang
 *
 */


-- Note you can also do single-line comments this way


/*What animal is on the crest of the Hufflepuff house?*/
SELECT animal FROM hogwarts_houses WHERE house = 'Hufflepuff';

/*What years did Sirius Black start and finish at Hogwarts?*/
SELECT start, finish FROM hogwarts_students WHERE first = 'Sirius';

/*Which student (first and last name) started at Hogwarts in 1947?*/
SELECT first, last FROM hogwarts_students WHERE start = '1947';

/*What are the relics of the Hogwarts houses? */
SELECT relic FROM hogwarts_houses;

/*How many years was Katie Bell at Hogwarts?*/
SELECT finish - start FROM hogwarts_students WHERE first = 'Katie' and last = 'Bell';

/*What students' houses are unknown?*/
SELECT first, last FROM hogwarts_students WHERE house IS NULL;

/*What are the names of all Gryffindor students who started in 1991, given as "firstname lastname", without extra spaces, ordered by last name and first name? */
SELECT first || ' ' || last FROM hogwarts_students WHERE house = 'Gryffindor' AND start = '1991' ORDER BY last;

/*What defense against the dark arts teacher's last name started with 'L' whose first name did not start with 'G'?*/
SELECT first|| ' ' || last FROM hogwarts_dada WHERE last LIKE 'L%' AND first NOT LIKE 'G%';

/*What members of the Weasley family attended Hogwarts and when did they attend, ordered by start year?*/
SELECT first, last, start, finish FROM hogwarts_students WHERE last = 'Weasley' ORDER BY start;

/*Give the names of the Hogwarts houses, sorted by animal.*/
SELECT house FROM hogwarts_houses ORDER BY animal;

/*Give all information about Hufflepuff students, sorted by start year in descending order, then by last name.*/
SELECT * FROM hogwarts_students WHERE house = 'Hufflepuff' ORDER BY start DESC, last;

/*What are the names and house colors of all the students in the Black family?*/
SELECT hogwarts_students.first, hogwarts_students.last, hogwarts_houses.colors FROM hogwarts_students, hogwarts_houses WHERE hogwarts_students.last = 'Black' AND hogwarts_students.house = hogwarts_houses.house;

/*Who founded the house that Parvati Patil sorted into?*/
SELECT hogwarts_houses.founder FROM hogwarts_students, hogwarts_houses WHERE hogwarts_students.first = 'Parvati' AND hogwarts_students.last = 'Patil' AND hogwarts_students.house = hogwarts_houses.house;

/*What are the names and houses of the defense against the dark arts teachers for whom we have student records?*/
SELECT hogwarts_dada.first, hogwarts_dada.last, hogwarts_students.house FROM hogwarts_students, hogwarts_dada WHERE hogwarts_dada.first = hogwarts_students.first;