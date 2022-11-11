/*E04a:  查詢全部*/
SELECT id, vendor, name, unit_price, stock,
	photo_url, description, launch_date, category, discount
	FROM wcs.products;

/*E04b: 最新上架 */
SELECT id, vendor, name, unit_price, stock,
	photo_url, description, launch_date, category, discount
	FROM wcs.products
    WHERE launch_date <= curdate()
    ORDER BY launch_date DESC LIMIT 10;

/*E04c: 關鍵字 */
SELECT id, vendor, name, unit_price, stock,
	photo_url, description, launch_date, category, discount
	FROM wcs.products
    WHERE name LIKE '%雞%';
    
/*E04d: 分類查詢 */
SELECT id, vendor, name, unit_price, stock,
	photo_url, description, launch_date, category, discount
	FROM wcs.products
    WHERE category ='飲料';
    
/*E04e: 價格區間 */
SELECT id, vendor, name, unit_price, stock,
	photo_url, description, launch_date, category, discount
	FROM wcs.products
    WHERE unit_price BETWEEN 50 AND 100;
    
/*E05: 查詢產品 */
SELECT id, vendor, name, unit_price, stock,
	photo_url, description, launch_date, category, discount
	FROM wcs.products
    WHERE id='2';
    
/**/
SELECT DISTINCT category FROM products;