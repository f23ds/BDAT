CREATE view ventas
AS
  SELECT offices.officecode,
         orders.ordernumber,
         Sum(orderdetails.quantityordered) AS numprod
  FROM   offices,
         employees,
         customers,
         orders,
         orderdetails
  WHERE  offices.officecode = employees.officecode
         AND employees.employeenumber = customers.salesrepemployeenumber
         AND customers.customernumber = orders.customernumber
         AND orders.ordernumber = orderdetails.ordernumber
  GROUP  BY offices.officecode,
            orders.ordernumber
  ORDER  BY numprod DESC;

SELECT officecode,
       Sum(numprod) AS objsvend
FROM   ventas
GROUP  BY officecode
ORDER  BY objsvend DESC
LIMIT  1;  
