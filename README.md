# WarmCuisineSite
## Membership System
* Including ***registration(create)***, ***login(read)*** and ***modification(update)*** functions, using the ***MVC*** framework. 
* ***Servlets*** are responsible for checking whether the datas transmitted by the user from the front-end jsp page are consistent with the format.
* The ***service*** is responsible for checking whether the password entered by the user is the same as the one read from the database.
* ***DAO*** is responsible for connecting with the database through JDBC, and using `preparedstatement` to prevent SQL injection and interact with the database.
* The way of data transmission is through ***entity class***-custom, and its design conforms to the principle of POJO.
