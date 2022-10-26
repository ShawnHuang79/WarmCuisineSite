productsINSERT INTO customers
	(name, gender, birthday, phone, email, address, id, password)
    VALUES('姚全翊','F','2014-01-20','0987467065','doohan417@gmail.com','高雄市鳳山區五甲二路66號','E271401027','85c6J4q8');
INSERT INTO customers
	(name, gender, birthday, phone, email, address, id, password)
    VALUES('龔淳祉','M','1992-09-01','0934665382','zaiden5106@gmail.com','臺南市北區中華北路２段8號','F103749153','W86w7UW6');

/*以下為E02:註冊的查詢指令*/
INSERT INTO customers
	(id, email, name, password, birthday, gender, address, phone, subscribed)
    VALUES('F103749153','zaiden5106@gmail.com','龔淳祉','W86w7UW6','1992-09-01','M','臺南市北區中華北路2段8號','0934665382',false);
    
    /*
    INSERT INTO customers
	(id, email, name, password, birthday, gender, address, phone, subscribed)
    VALUES(?,?,?,?,?,?, ?,?,?);
    */
    /*必要欄位和一般欄位中間可以習慣用一個空白
     */
    