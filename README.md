# WarmCuisineSite - food and table reservation website
## Membership System
* Including ***registration(create)***, ***login(read)*** and ***modification(update)*** functions, using the ***MVC*** framework. 
* ***Servlets*** are responsible for checking whether the datas transmitted by the user from the front-end jsp page are consistent with the format.
* The ***service*** is responsible for checking whether the password entered by the user is the same as the one read from the database.
* ***DAO*** is responsible for connecting with the database through JDBC, and using `preparedstatement` to prevent SQL injection and interact with the database.
* The way of data transmission is through ***entity class***-custom, and its design conforms to the principle of POJO.
## Reservation System
* Designed in a ***bitwise operation***, each position seen in the front-end only occupies 1 bit in the database.
* Use the bitwise operator `&` to determine whether the data in the database and the data choosed by user are duplicated, and then use `^` to update the data. ***The data transmission in this way is extremely low***, and it has advantages when developing a large reservation system.
Using the MVC framework, the main way of data transmission is through the data structure ```Map<String byte>```.
* The result of the reservation will be notified to the member by concatenating ***Gmail API*** to send an Email.
