-- ITEM #2
-- What books has Connie had to pay 
-- a fine for (if any)? When were they due?

SELECT name, title, return_date 
FROM people AS p 
    LEFT OUTER JOIN transactions AS t 
        ON p.person_id = t.person_id 
    LEFT OUTER JOIN books AS b 
        ON t.book_id = b.book_id 
WHERE name = 'Connie' 
    AND fine > '$0.00';


-- ITEM #3
-- What people have never had 
-- a fine associated with them (if any)?

SELECT name, SUM(fine) AS total_fines 
FROM people AS p 
    LEFT OUTER JOIN transactions AS t 
ON p.person_id = t.person_id 
GROUP BY name 
HAVING SUM(fine) = '$0.00';


-- ITEM #4
-- What are the names of the books 
-- which still haven't been returned yet?

SELECT title
FROM books AS b 
    LEFT OUTER JOIN transactions AS t 
ON b.book_id = t.book_id
WHERE return_date IS NULL
AND checkout_date IS NOT NULL;


-- ITEM #5
-- What are the names of the people 
-- who have never checked out any book (if any)?

SELECT name
FROM people AS p 
    LEFT OUTER JOIN transactions AS t 
ON p.person_id = t.person_id
WHERE name IS NULL;


-- ITEM #6
-- What genres have never had 
-- a fine associated with them (if any)?

SELECT genre, SUM(fine) AS total_fines
FROM books AS b 
    LEFT OUTER JOIN transactions AS t 
ON b.book_id = t.book_id
GROUP BY genre
HAVING SUM(fine) = '$0.00';


-- ITEM #7
-- Which books has Pearl has checked out?

SELECT name, title 
FROM people AS p 
    LEFT OUTER JOIN transactions AS t 
        ON p.person_id = t.person_id 
    LEFT OUTER JOIN books AS b 
        ON t.book_id = b.book_id 
WHERE name = 'Pearl';


-- ITEM #8
-- What titles of books has Garnet checked out, 
-- and until what date (if any)?


SELECT name, title, return_date
FROM people AS p 
    LEFT OUTER JOIN transactions AS t 
        ON p.person_id = t.person_id 
    LEFT OUTER JOIN books AS b 
        ON t.book_id = b.book_id
WHERE name = 'Garnet';


-- ITEM #9
-- Who are the people who have checked out The Hobbit?

SELECT name, title
FROM people AS p 
    LEFT OUTER JOIN transactions AS t
        ON p.person_id = t.person_id 
    LEFT OUTER JOIN books AS b 
        ON t.book_id = b.book_id
WHERE title = 'The Hobbit';


-- ITEM #10
-- What are the names of the people who had 
-- to pay a fine for Crazy Rich Asians?

SELECT name, SUM(fine) AS total_fines
FROM people AS p 
    LEFT OUTER JOIN transactions AS t 
        ON p.person_id = t.person_id 
    LEFT OUTER JOIN books AS b 
        ON t.book_id = b.book_id
WHERE title = 'Crazy Rich Asians'
GROUP BY name
HAVING SUM(fine) > '$0.00';