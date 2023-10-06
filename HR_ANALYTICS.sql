CREATE DATABASE HR_ANALYTICS

USE HR_ANALYTICS

SELECT * FROM [dbo].[hr_emp]



-- Check for the employee with a Doctorate degree with age less than 40

SELECT *
FROM [dbo].[hr_emp]
WHERE 'UMAR' > 40 AND 'EDUCATION' = 4;


-- What is the count of employees by gender?

SELECT  GENDER, COUNT(EMPLOYEENUMBER) AS 'COUNT BY GENDER'
FROM [dbo].[hr_emp]
GROUP BY Gender

-- How is the distribution of employee education across different departments?

SELECT DEPARTMENT, EDUCATION, COUNT(*) AS 'COUNT OF EMPLOYEES'
FROM [dbo].[hr_emp]
GROUP BY Department, Education
ORDER BY DEPARTMENT, Education DESC;


-- What is the distribution of employee performance ratings across different departments?

SELECT PERFORMANCERATING, DEPARTMENT, COUNT(*) AS ' COUNT OF EMPLOYEES'
FROM [dbo].[hr_emp]
GROUP BY Department, PerformanceRating
ORDER BY Department, COUNT (*) DESC


--	What is the average monthly rate and income for each job role?

SELECT JOBROLE, ROUND(AVG(MONTHLYRATE), 2) AS 'AVG_MONTHLY_RATE', ROUND(AVG(MONTHLYINCOME), 2) AS 'AVG_MON_INCOME' 
FROM [dbo].[hr_emp]
GROUP BY JobRole
ORDER BY AVG(MONTHLYRATE) DESC


-- What is the average monthly rate and income for each job role in each department?

SELECT DEPARTMENT, JOBROLE, ROUND(AVG(MONTHLYRATE), 2) AS 'AVG_MONTHLY_RATE', ROUND(AVG(MONTHLYINCOME), 2) AS 'AVG_MON_INCOME'
FROM [dbo].[hr_emp]
GROUP BY Department, JobRole
ORDER BY DEPARTMENT,AVG(MONTHLYINCOME) DESC;

-- What is the distribution of employee attrition across different age ranges?

SELECT 
	CASE	
		WHEN UMAR BETWEEN 18 AND 24 THEN '18-24'
		WHEN UMAR BETWEEN 25 AND 34 THEN '25-34'
		WHEN UMAR BETWEEN 35 AND 44 THEN '35-44'
		WHEN UMAR BETWEEN 45 AND 54 THEN '45-54'
		WHEN UMAR BETWEEN 55 AND 60 THEN '55-60'
		ELSE '60+'
	END AS 'AGE_RANGE', 
	ATTRITION,
	COUNT(*) AS 'COUNT_OF_EMPLOYEES'
FROM [dbo].[hr_emp]
GROUP BY  ATTRITION, CASE	
		WHEN UMAR BETWEEN 18 AND 24 THEN '18-24'
		WHEN UMAR BETWEEN 25 AND 34 THEN '25-34'
		WHEN UMAR BETWEEN 35 AND 44 THEN '35-44'
		WHEN UMAR BETWEEN 45 AND 54 THEN '45-54'
		WHEN UMAR BETWEEN 55 AND 60 THEN '55-60'
		ELSE '60+'
	END
ORDER BY 'AGE_RANGE'


-- Give Environment Satisfaction distribution to the employees.

SELECT ENVIRONMENTSATISFACTION, COUNT(*) AS 'COUNT OF EMPLOYEES' 
FROM [dbo].[hr_emp]
GROUP BY EnvironmentSatisfaction
ORDER BY EnvironmentSatisfaction DESC

-- Show the distribution of Job Satisfaction among the employees.

SELECT * FROM [dbo].[hr_emp]

SELECT JobSatisfaction, COUNT(*) AS 'COUNT OF EMPLOYEES',  ROUND(CAST(COUNT(*) AS DECIMAL)/SUM(COUNT(*)) OVER() * 100, 2)AS 'PERCENTAGE'
FROM [dbo].[hr_emp]
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction DESC


-- Show the distribution of work-life balance among the employees.

SELECT * FROM [dbo].[hr_emp]

SELECT WORKLIFEBALANCE, COUNT(*) AS 'COUNT OF EMPLOYEES', ROUND(CAST(COUNT(*) AS decimal)/SUM(COUNT(*)) OVER() * 100, 3) AS 'PERCENTAGE'
FROM [dbo].[hr_emp]
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance DESC;


--Show only the count & percentage of involved and highly-involved employees.

SELECT * FROM [dbo].[hr_emp]

SELECT JOBINVOLVEMENT, COUNT(JOBINVOLVEMENT) AS 'COUNT OF EMPLOYEE', ROUND(CAST(COUNT(*) AS DECIMAL) / SUM(COUNT(*)) OVER() * 100, 2) AS 'PERCENTAGE'
FROM [dbo].[hr_emp]
GROUP BY JOBINVOLVEMENT
HAVING JobInvolvement IN (3,4)






