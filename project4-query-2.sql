/*
 *  project4.sql
 * 
 *  author: Jacky Wang
 *  collaborated: 
 */


-- Note you can also do single-line comments this way
/* Comments */

/*Statistics, aggregation, and grouping*/

/*How many Slytherin students are there?*/
SELECT count(*) FROM hogwarts_students WHERE house = 'Slytherin';

/*What is the earliest start year of any student in our data?*/
SELECT min(start) FROM hogwarts_students;

/*How many students have some missing information?*/
SELECT count(*) FROM hogwarts_students WHERE (house is NULL OR start is NULL OR finish is NULL);

/*How many Defense Against the Dark Arts (DADA) teachers have first names the same length as their last names?*/
SELECT count(*) FROM hogwarts_dada WHERE length(last) = length(first);

/*How many students are listed in each house (include the number who have no house listed as well; order by greatest number of students first)?*/
SELECT house, count(*) FROM hogwarts_students GROUP BY house ORDER BY count(house) DESC; 

/*Which houses have more than 20 associated student records, and how many students are in those houses?*/
SELECT house, count(*) FROM hogwarts_students GROUP BY house HAVING count(house) > 20;

/*By house, what was the average number of years spent at Hogwarts by students for whom we know both start and end years? Order by average number of years.*/
SELECT house, avg(finish-start) FROM hogwarts_students WHERE start is NOT NULL AND finish is NOT NULL GROUP BY house ORDER BY avg(finish-start);

/*Which family names (last names) appear exactly twice in the hogwarts_students table?*/
SELECT last FROM hogwarts_students GROUP BY last HAVING COUNT(last) = 2;

/*Subqueries and/or complex joins*/

/*What are the names, houses, and house colors of the Defense Against the Dark Arts teachers (you only need to worry about the teachers who also have student records)?*/
SELECT hs.last, hs.first, hs.house, hh.colors FROM hogwarts_students AS hs, hogwarts_houses AS hh WHERE (hs.last, hs.first) IN (SELECT last, first from hogwarts_dada) 
AND hs.house = hh.house;

/*Who is the earliest known student, and what year did they start?*/
SELECT first, last, start FROM hogwarts_students WHERE start IN (SELECT min(start) FROM hogwarts_students); 

/*Which student has the shortest first name?*/
SELECT first, last FROM hogwarts_students WHERE length(first) IN (SELECT min(length(first)) FROM hogwarts_students);

/*Who were the Gryffindors who would have had Dolores Umbridge as DADA teacher (assume all students take DADA, and all students are at school for the entire school year */
/*starting in Fall and ending in Spring, keeping in mind that each DADA teacher listed started in Fall and left the following Spring)?      @186 piazza post*/
SELECT hs.first, hs.last FROM hogwarts_students AS hs, hogwarts_dada AS hd WHERE hs.house = 'Gryffindor'  
AND hs.start <= hd.start 
AND hs.finish >= hd.finish 
AND hd.last = 'Umbridge';

/*Which students have had other family members attend Hogwarts (assume anyone with the same last name is a family member)? Order by last name and first name.*/
SELECT last, first FROM hogwarts_students WHERE last in (SELECT last FROM hogwarts_students GROUP BY last HAVING count(last) > 1) ORDER BY last, first;

/*How many students of each house are known to have started the year that Alastor Moody was the appointed DADA teacher?*/
SELECT house, count(*) FROM hogwarts_students AS hs, hogwarts_dada AS hd WHERE hs.start = hd.start AND hd.last = 'Moody' GROUP BY house;




































/*Extra credit

/*What student (last, first, house) started in the same year as, has the same length first and last names as, but a different house than, */
/*a student with initials "S. B." who was in a house with a Badger as its heraldic animal?*/

/*SELECT last, first, house FROM hogwarts_students WHERE (start, length(first), length(last)) IN */
/*(SELECT start, length(first), length(last) FROM hogwarts_students) WHERE (substr(first, 1, 1), substr(last, 1, 1), house*/



















































