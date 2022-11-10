SELECT id, name, unit_price, discount, stock, 
	photo_url, description, launch_date, category FROM products;

/*查詢*/
SELECT productIdfk, sizefk, price FROM products_price;

/*CROSS JOIN，*/
SELECT id, name, unit_price, discount, stock, 
		photo_url, description, launch_date, category,
		productIdfk, sizefk, price
    FROM products JOIN products_price;
		

/*INNER JOIN*/
SELECT id, name, unit_price, discount, stock, 
		photo_url, description, launch_date, category,
		productIdfk, sizefk, price
    FROM products JOIN products_price
		ON products.id = products_price.productIdfk;
	/*WHERE products.id = 1;*/



/*LEFT OUTER JOIN, E05檢視產品明細*/
SELECT id, name, unit_price, discount, stock, 
		photo_url, description, launch_date, category,
		productIdfk, sizefk, price
    FROM products LEFT JOIN products_price
		ON products.id = products_price.productIdfk
	WHERE products.id = 5;

/*RIGHT OUTER JOIN*/
SELECT id, name, unit_price, discount, stock, 
		photo_url, description, launch_date, category,
		productIdfk, sizefk, price
    FROM products_price RIGHT JOIN products
		ON products.id = products_price.productIdfk
	WHERE products.id = 5;
    
/*FULL OUTER JOIN，MySQL沒有這個功能*/
SELECT id, name, unit_price, discount, stock, 
		photo_url, description, launch_date, category,
		productIdfk, sizefk, price
    FROM products_price FULL JOIN products
		ON products.id = products_price.productIdfk
	WHERE products.id = 5;