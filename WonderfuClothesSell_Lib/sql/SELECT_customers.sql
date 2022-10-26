SELECT id, email, name, password, birthday, gender, address, phone, subscribed FROM customers;

SELECT id, email, name, password, birthday, gender, address, phone, subscribed FROM customers WHERE id='A123456789';

/*以下為E01:登入的查詢指令*/
SELECT id, email, name, password, birthday, gender, address, phone, subscribed FROM customers 
	WHERE id='A123456789' OR email='A123456789';
SELECT id, email, name, password, birthday, gender, address, phone, subscribed FROM customers 
	WHERE id='test@uuu.com.tw' OR email='test@uuu.com.tw';
	
SELECT id, email, name, password, birthday, gender, address, phone, subscribed FROM customers 
	WHERE id=? OR email=?;