SELECT Count(o.ordernumber) AS num_veces,
       p1.productcode,
       p2.productcode
FROM   products p1
       natural JOIN orderdetails o1,
       products p2
       natural JOIN orderdetails o2,
       orders o
WHERE  p1.productcode < p2.productcode
       AND o1.ordernumber = o.ordernumber
       AND o2.ordernumber = o.ordernumber
GROUP  BY p1.productcode,
          p2.productcode;  
