INSERT INTO orders
(id, customer_id, created_date, created_time, shipping_type, shipping_fee,
	payment_type, payment_fee, status, recipient_name, recipient_email,
    recipient_phone, shipping_address)
VALUE(?, ?,?,?, ?,?, ?,?, ?,?,?,?); 

INSERT INTO order_items
(order_id, product_id, size_name, price, quantity)
VALUE(?, ?,?, ?,?); 
