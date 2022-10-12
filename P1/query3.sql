SELECT e1.employeenumber,
       e1.lastname
FROM   employees e1,
       employees e2,
       employees e3
WHERE  e2.employeenumber = e1.reportsto
       AND e3.employeenumber = e2.reportsto
       AND e3.reportsto IS NULL;  
