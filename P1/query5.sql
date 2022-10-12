CREATE VIEW numoffices
AS
  SELECT offices.country,
         offices.officecode
  FROM   payments,
         customers,
         employees,
         offices
  WHERE  payments.customernumber = customers.customernumber
         AND customers.salesrepemployeenumber = employees.employeenumber
         AND employees.officecode = offices.officecode
  EXCEPT
  (SELECT offices.country,
          offices.officecode
   FROM   payments,
          customers,
          employees,
          offices
   WHERE  payments.customernumber = customers.customernumber
          AND customers.salesrepemployeenumber = employees.employeenumber
          AND employees.officecode = offices.officecode
          AND ( paymentdate >= '2003-01-01'
                AND paymentdate <= '2003-12-31' ));

SELECT country,
       Count(*)
FROM   numoffices
GROUP  BY country
ORDER  BY Count(*) DESC;  
