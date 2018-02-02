/*
For each funding, return the funding_id and the agreement date.
*/

SELECT id, agreement_date
FROM Fundings;

/* Show me all attorneys that do NOT have a phone_number */

SELECT *
FROM  Attorneys
WHERE phone_number IS NULL;

/*What is the total amount advanced all time?*/

SELECT SUM(advance_amount) AS total_advanced
FROM Fundings;

/*For every case, return the attorney’s phone number and email.*/

SELECT Cases.id AS cid, Attorneys.phone_number, Attorneys.email
FROM Cases
LEFT JOIN Attorneys
ON cid = Attorneys.id;

/*For every case, return the total amount funded.*/

SELECT Cases.id AS cid, SUM(Fundings.advance_amount) AS total_funding
FROM Cases
LEFT JOIN Fundings
ON cid = Fundings.case_id
GROUP BY cid
ORDER BY total_funding DESC;

/*Return all cases that have attorney name is exactly “Sal Goodman”.*/

SELECT Cases.id AS cid, Attorneys.id AS aid
FROM Cases
LEFT JOIN Attorneys
ON cid = aid
WHERE Attorneys.full_name = 'Sal Goodman';

/*Return all case types, sorted alphabetically by name.*/

/*
Assuming that the schema of the Case Type table is below:
	- Case_Type.id (PK)
	- Case_Type.name (VARCHAR)
*/

SELECT DISTINCT(name) AS case_type_names
FROM Case_Type
ORDER BY case_type_names ASC;



/*
Return all case types with the name of the case type and the number of cases of
that type, each in its own row, without duplicates.
*/

SELECT DISTINCT(name) AS case_type_names, COUNT(Cases.id) AS case_type_count
FROM Case_Type
LEFT JOIN Cases
ON Case_Type.id = Cases.id
ORDER BY case_type_count DESC;

/*
Rank the case types by the most frequent (most number of cases) to the least
frequent with the number of cases of each type.
*/

SELECT DISTINCT(name) AS case_type_names, COUNT(Cases.id) AS case_type_count,
rank() OVER (PARTITION BY case_type_names ORDER BY case_type_count DESC)
FROM Case_Type
LEFT JOIN Cases
ON Case_Type.id = Cases.id;


