-- Employee Attrition Analysis
-- HCLTech Career Shaper Project
-- Dataset table: EMPLOYEE_ATTRITION

-- 1. Overall employee attrition count
SELECT Attrition, COUNT(*) AS Employee_Count
FROM EMPLOYEE_ATTRITION
GROUP BY Attrition;

-- 2. Department-wise employee count and employees who left
SELECT Department,
       COUNT(*) AS Total_Employees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM EMPLOYEE_ATTRITION
GROUP BY Department
ORDER BY Department;

-- 3. Department-wise attrition percentage
SELECT Department,
       COUNT(*) AS Total_Employees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
       ROUND(
           100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
           2
       ) AS Attrition_Percentage
FROM EMPLOYEE_ATTRITION
GROUP BY Department
ORDER BY Department;

-- 4. Age-group-wise attrition
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56-65'
    END AS Age_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Attrition_Percentage
FROM EMPLOYEE_ATTRITION
GROUP BY
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56-65'
    END
ORDER BY Age_Group;

-- 5. Salary-group-wise attrition
SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low'
        WHEN MonthlyIncome BETWEEN 3000 AND 6000 THEN 'Medium'
        WHEN MonthlyIncome BETWEEN 6001 AND 10000 THEN 'High'
        ELSE 'Very High'
    END AS Salary_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Attrition_Percentage
FROM EMPLOYEE_ATTRITION
GROUP BY
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low'
        WHEN MonthlyIncome BETWEEN 3000 AND 6000 THEN 'Medium'
        WHEN MonthlyIncome BETWEEN 6001 AND 10000 THEN 'High'
        ELSE 'Very High'
    END
ORDER BY Salary_Group;

-- 6. Average monthly income by attrition status
SELECT Attrition,
       COUNT(*) AS Employee_Count,
       ROUND(AVG(MonthlyIncome), 2) AS Average_Monthly_Income
FROM EMPLOYEE_ATTRITION
GROUP BY Attrition;

-- 7. Minimum, maximum, and average monthly income
SELECT MIN(MonthlyIncome) AS Minimum_Income,
       MAX(MonthlyIncome) AS Maximum_Income,
       ROUND(AVG(MonthlyIncome), 2) AS Average_Income
FROM EMPLOYEE_ATTRITION;

-- 8. Average monthly income by department
SELECT Department,
       COUNT(*) AS Employee_Count,
       ROUND(AVG(MonthlyIncome), 2) AS Average_Monthly_Income
FROM EMPLOYEE_ATTRITION
GROUP BY Department
ORDER BY Department;

-- 9. Verify total number of imported records
SELECT COUNT(*) AS Total_Records
FROM EMPLOYEE_ATTRITION;
