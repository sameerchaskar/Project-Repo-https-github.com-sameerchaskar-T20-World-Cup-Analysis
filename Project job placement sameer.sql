create database project;

-- 1. Job Placement by Gender:

SELECT 
    gender, COUNT(status) as Placed
FROM
    job_placement_data
WHERE
    status = 'Placed'
GROUP BY gender;

/* Output
M	100
F	48
*/

-- 2)Correlation Between Secondary School (SSC) Performance and Job Placement

SELECT 
    ROUND(AVG(ssc_percentage), 2) AS Correlation, status
FROM
    job_placement_data
GROUP BY status;

/* Output
71.72	Placed
57.54	Not Placed
*/

-- 3) Effect of Higher Secondary School (HSC) Subject on Job Placement

SELECT 
    hsc_subject, COUNT(status) as placed
FROM
    job_placement_data
WHERE
    status = 'Placed'
GROUP BY hsc_subject;

/* Output
Commerce	79
Science	63
Arts	6
*/

-- 4) Undergraduate Degree and Its Impact on Placement.
SELECT 
    undergrad_degree, COUNT(status) AS total_placed
FROM
    job_placement_data
WHERE
    status = 'placed'
GROUP BY undergrad_degree;

/*Output
Sci&Tech	41
Comm&Mgmt	102
Others	5
*/

-- 5)Effect of MBA Specialization on Job Placement. 
SELECT 
    specialisation, COUNT(status) AS Total_Placed
FROM
    job_placement_data
WHERE
    status = 'Placed'
GROUP BY specialisation;

/*Output
Mkt&HR	53
Mkt&Fin	95
*/


/* 6) Analysis of Work Experience on Job Placement. */

SELECT 
    work_experience, COUNT(status) AS Placed
FROM
    job_placement_data
WHERE
    status = 'Placed'
GROUP BY work_experience;

/*Output
No	84
Yes	64
*/


/* 7. Average Employment Test Scores for Placed and Non-Placed Candidates */
SELECT 
    ROUND(AVG(emp_test_percentage), 2) AS Average_persentage,
    status
FROM
    job_placement_data
GROUP BY status; 

/*Output
73.24	Placed
69.59	Not Placed
*/

/*8) Job Placement by SSC Board*/
SELECT 
    ssc_board, COUNT(ssc_board) AS placed, status
FROM
    job_placement_data
WHERE
    status = 'Placed'
GROUP BY ssc_board;

/*Output
Others	70	Placed
Central	78	Placed
*/

/* 9) Job Placement by HSC Board. */
SELECT 
    hsc_board, COUNT(status) AS Placed
FROM
    job_placement_data
WHERE
    status = 'Placed'
GROUP BY hsc_board;

/*Output
Others	91
Central	57
*/

-- 10)  Analysis of MBA Percentage on Job Placement.
SELECT 
    ROUND(mba_percent / 10) * 10 as MBA_percentage, COUNT(status) as Placed
FROM
    job_placement_data
GROUP BY ROUND(mba_percent / 10) * 10;

/* Output
60	124
70	65
50	22
80	4
*/

-- 11)Top 5 Highest Average MBA Percentages by Specialization.
SELECT 
    specialisation, ROUND(AVG(MBA_Percent), 2) AS MBA_Precentage
FROM
    job_placement_data
GROUP BY specialisation
ORDER BY specialisation DESC
LIMIT 5;

/* Output
Mkt&HR	61.59
Mkt&Fin	62.83
*/

-- 12)Placement Success by Work Experience and Degree Percentage.
SELECT 
    work_experience,
    ROUND(degree_percentage / 10) * 10 AS degree_percent_range,
    COUNT(status) AS placed
FROM
    job_placement_data
WHERE
    status = 'placed'
GROUP BY work_experience , ROUND(degree_percentage / 10) * 10;

/*Output
No	60	25
Yes	80	13
No	70	47
Yes	70	29
Yes	60	22
No	80	11
No	90	1 
*/

-- 13. Effect of SSC and HSC Percentages on Placement.
SELECT 
    ROUND(ssc_percentage / 10) * 10 AS SSC_Percentage,
    ROUND(hsc_percentage / 10) * 10 AS HSC_Percentage,
    status
FROM
    job_placement_data
WHERE
    status = 'placed'
GROUP BY ROUND(ssc_percentage / 10) * 10 , ROUND(hsc_percentage / 10) * 10;

-- 14)Gender-wise MBA Percentage Comparison for Placed Candidates
SELECT 
    gender, ROUND(AVG(mba_percent), 2) AS MBA_Percentage, status
FROM
    job_placement_data
WHERE
    status = 'placed'
GROUP BY gender;

-- 15)Top 3 Undergrad Degrees with the Highest Placement Rates.
SELECT 
    undergrad_degree, COUNT(status) AS Placement_rate
FROM
    job_placement_data
WHERE
    status = 'placed'
GROUP BY undergrad_degree
ORDER BY placement_rate DESC
LIMIT 3;

-- 16)Does Work Experience Influence Higher MBA Percentages?
SELECT 
    work_experience, ROUND(AVG(mba_percent),2) AS MBA_Percentage
FROM
    job_placement_data
GROUP BY work_experience;

-- 17)Placement Status by Degree Percentage Range.
SELECT 
    COUNT(status) AS Total_placed,
    ROUND(degree_percentage / 10) * 10 AS Degree_Percent_range
FROM
    job_placement_data
WHERE
    status = 'placed'
GROUP BY ROUND(degree_percentage / 10) * 10;

-- 18)Placement Success Based on Employment Test Score Range.
SELECT 
    COUNT(status) AS Placed_count,
    ROUND(emp_test_percentage / 10) * 10 AS Employee_test_range
FROM
    job_placement_data
WHERE
    status = 'placed'
GROUP BY ROUND(emp_test_percentage / 10) * 10;

-- 19) Placement Rate Across Different MBA Specializations by Gender.

SELECT 
    gender, specialisation, COUNT(status) AS Placed_count
FROM
    job_placement_data
WHERE
    status = 'Placed'
GROUP BY gender , specialisation;

-- 20)Average SSC, HSC, and Degree Percentages for Placed Candidates.
SELECT 
    ROUND(AVG(ssc_percentage), 2) AS SSC_Percentage,
    ROUND(AVG(hsc_percentage), 2) AS HSC_Percentage,
    ROUND(AVG(degree_percentage), 2) AS Degree_Percentages,
    status
FROM
    job_placement_data
WHERE
    status = 'placed';