SELECT  orders.id, customer_id, created_date, created_time, shipping_type, shipping_fee, shipping_note, payment_type, payment_fee, 
payment_note, status, recipient_name, recipient_email, recipient_phone, shipping_address, 
 order_id, product_id, size_name, price, quantity, price * quantity AS amount,
 name AS product_name, photo_url
 FROM wcs.orders
 INNER JOIN order_items ON orders.id=order_items.order_id
 INNER JOIN products ON order_items.product_id = products.id 
 WHERE orders.customer_id='A158841858' AND orders.id='1'