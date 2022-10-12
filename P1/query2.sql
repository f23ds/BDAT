SELECT productlines.productline,
       Round(Avg(orders.shippeddate - orders.orderdate), 2) AS avg_time
FROM   productlines,
       products,
       orders,
       orderdetails
WHERE  productlines.productline = products.productline
       AND products.productcode = orderdetails.productcode
       AND orderdetails.ordernumber = orders.ordernumber
GROUP  BY productlines.productline
ORDER  BY avg_time DESC;  
