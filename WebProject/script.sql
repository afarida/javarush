DELIMITER $$
CREATE PROCEDURE InsertUser (id int, name varchar(255), age int, isAdmin bit)
BEGIN
	INSERT INTO `test`.`user`(`id`,`isAdmin`,`age`,`createdDate`,`name`)
VALUES(id,isAdmin,age,CURRENT_TIMESTAMP,name);
END$$

DELIMITER ;

call insertuser(1, 'Admin', 30, 1);
call insertuser(2, 'John', 25, 0);
call insertuser(3, 'Peter', 30, 0);
call insertuser(4, 'Arsen', 28, 0);
call insertuser(5, 'Ewa', 23, 0);
call insertuser(6, 'Cruz', 26, 1);
call insertuser(7, 'Elissa', 25, 0);
call insertuser(8, 'Mitchel', 28, 1);
call insertuser(9, 'Alonso', 21, 0);
call insertuser(10, 'Jonathon', 30, 0);
call insertuser(11, 'Nicholas', 35, 0);
call insertuser(12, 'Dacia', 32, 0);
call insertuser(13, 'Paul', 27, 1);
call insertuser(14, 'Abram', 29, 0);
call insertuser(15, 'Tracy', 20, 0);

DROP PROCEDURE IF EXISTS insertuser;
