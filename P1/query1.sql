SELECT customers.customernumber,
       customers.customername,
       Sum(amount) AS totalamount
FROM   customers,
       orders,
       payments,
       orderdetails,
       products
WHERE  products.productname = '1940 Ford Pickup Truck'
       AND products.productcode = orderdetails.productcode
       AND orderdetails.ordernumber = orders.ordernumber
       AND orders.customernumber = customers.customernumber
       AND customers.customernumber = payments.customernumber
GROUP  BY customers.customernumber
ORDER  BY totalamount DESC;  
