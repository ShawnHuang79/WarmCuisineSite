/*LEFT OUTER JOIN, E05檢視產品明細*/
SELECT id, name, unit_price, discount, IFNULL(SUM(products_price.stock_temp),products.stock) AS stock,
		photo_url, description, launch_date, category,
		productIdfk, sizefk, price,
        GROUP_CONCAT(products_price.productIdfk) AS product_list
    FROM products LEFT JOIN products_price
		ON products.id = products_price.productIdfk
        GROUP BY id;
/*
sum(stock), avg(stock), count(stock),
GROUP_CONCAT(product_price.productIdfk) AS color_list
*/
    
/*LEFT OUTER JOIN, E05檢視產品明細*/
SELECT id, name, unit_price, discount, stock, 
		photo_url, description, launch_date, category,
		productIdfk, sizefk, price
    FROM products LEFT JOIN products_price
		ON products.id = products_price.productIdfk
	WHERE products.id = 5;
    
/*LEFT OUTER JOIN, E05檢視產品ID明細，如果沒有尺寸的產品，price會不存在，要處理。 products_join_size_view*/
SELECT id, name, unit_price, discount, photo_url,
		description, launch_date, category, size, price
FROM products LEFT JOIN products_price
		ON products.id = products_price.productIdfk
        LEFT JOIN products_size
        ON products_price.sizefk = products_size.sizePK
        
/*a left join b on 條件1 left join c on 條件2 執行順序是：先a和b進行連線，生成一張中間表d，然後再和c進行條件連線生成最後的表的資料 
 select * from a left join b on （a,b的連線條件）left join c on(a,b形成的臨時中間表和c的連線條件)*/