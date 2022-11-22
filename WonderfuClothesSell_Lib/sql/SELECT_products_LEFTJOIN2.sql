SELECT id, name, unit_price, discount, photo_url,
		description, launch_date, category, size, price
FROM products 
		LEFT JOIN products_price
		ON products.id = products_price.productIdfk
        LEFT JOIN products_size
        ON products_price.sizefk = products_size.sizePK
        