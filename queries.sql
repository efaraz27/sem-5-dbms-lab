CREATE TABLE DEPARTMENT 
( Dname VARCHAR(15) NOT NULL, 
Dnumber INT NOT NULL, 
Mgr_ssn CHAR(9) NOT NULL, 
Mgr_start_date DATE, 
PRIMARY KEY (Dnumber), 
UNIQUE (Dname));

INSERT INTO DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date) 
VALUES('Reseach',5,'333445555','20-may-2015');

INSERT INTO DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date) 
VALUES('Adimin',4,'987654321','01-jan-2010');

INSERT INTO DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date) 
VALUES('HR',1,'888665555','10-JUNE-14');
SELECT * FROM DEPARTMENT;

CREATE TABLE EMPLOYEE 
	( Fname VARCHAR(15) NOT NULL, 
	Minit CHAR, 
	Lname VARCHAR(15) NOT NULL, 
	Ssn CHAR(9) NOT NULL, 
	Bdate DATE, 
	Address VARCHAR(30), 
	Sex CHAR, 
	Salary DECIMAL(10,2), 
      Super_ssn CHAR(9), 
      Dno INT NOT NULL, 
	PRIMARY KEY (Ssn), 
	FOREIGN KEY (Dno) REFERENCES DEPARTMENT(Dnumber) );
	
INSERT INTO EMPLOYEE VALUES('John','B','Smith','123456789','15-oct-2001','Balasore','M',30000,'333445555',5);
INSERT INTO EMPLOYEE VALUES('Franklin','T','Wrong','333445555','15-june-1995','Bhadrak','M',40000,'888665555',5);
INSERT INTO EMPLOYEE VALUES('Ram','R','Smith','999887777','12-jan-1998','Kolkata','F',25000,'987654321',4);
INSERT INTO EMPLOYEE VALUES('Ramesh','k','Kumar','987654321','15-Aug-1996','Howrah','F',43000,'888665555',4);
INSERT INTO EMPLOYEE VALUES('Kailash','J','Singh','666884444','11-june-1999','Durgapur','M',38000,'333445555',5);
INSERT INTO EMPLOYEE VALUES('Sanjay','R','Mishra','453453453','05-Mar-2000','Siliguri','F',25000,'333445555',5);
INSERT INTO EMPLOYEE VALUES('Grish','C','Gupta','888665555','25-Nov-2010','Rampur','F',55000,'null',1);

select * from employee;

ALTER TABLE DEPARTMENT add CONSTRAINT FK_DEPT 
FOREIGN KEY(Mgr_ssn) REFERENCES EMPLOYEE(Ssn);

ALTER TABLE EMPLOYEE add CONSTRAINT FK_EMP1
 FOREIGN KEY(Super_ssn) REFERENCES EMPLOYEE(Ssn);

UPDATE  EMPLOYEE SET SUPER_SSN='333445555' WHERE SSN='888665555';

CREATE TABLE DEPT_LOCATIONS
( Dnumber INT NOT NULL,
Dlocation VARCHAR(15) NOT NULL,
PRIMARY KEY (Dnumber, Dlocation),
FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber) );

INSERT INTO DEPT_LOCATIONS VALUES(1,'Balasore');
INSERT INTO DEPT_LOCATIONS VALUES(4,'Howrah');
INSERT INTO DEPT_LOCATIONs VALUES(5,'Siliguri');
INSERT INTO DEPT_LOCATIONs VALUES(5,'Bhadrak');
INSERT INTO DEPT_LOCATIONs VALUES(5,'Rampur');

Select * from DEPT_LOCATIONS;

CREATE TABLE PROJECT
( Pname VARCHAR(15) NOT NULL,
Pnumber INT NOT NULL,
Plocation VARCHAR(15),
Dnum INT NOT NULL,
PRIMARY KEY (Pnumber),
UNIQUE (Pname),
FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber) );

INSERT INTO PROJECT VALUES('PX',1,'Balasore',5);
INSERT INTO PROJECT VALUES('PY',2,'Bhadrak',5);
INSERT INTO PROJECT VALUES('PZ',3,'Durgapur',5);
INSERT INTO PROJECT VALUES('COM',10,'Siliguri',4);
INSERT INTO PROJECT VALUES('REC',202,'Bhadrak',1);
INSERT INTO PROJECT VALUES('NET',30,'siliguri',4);

Select * from project;




CREATE TABLE WORKS_ON
( Essn CHAR(9) NOT NULL,
Pno INT NOT NULL,
Hours DECIMAL(3,1) NOT NULL,
PRIMARY KEY (Essn, Pno),
FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn),
FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber) );

INSERT INTO WORKS_ON VALUES('123456789',1,30.2);
INSERT INTO WORKS_ON VALUES('123456789',2,7.2);
INSERT INTO WORKS_ON VALUES('666884444',3,10.2);
INSERT INTO WORKS_ON VALUES('666884444',1,20.2);
INSERT INTO WORKS_ON VALUES('666884444',10,15.2);
INSERT INTO WORKS_ON VALUES('333445555',202,30.2);
INSERT INTO WORKS_ON VALUES('333445555',30,1.2);
INSERT INTO WORKS_ON VALUES('987654321',2,25.2);
INSERT INTO WORKS_ON VALUES('987654321',1,50.2);
INSERT INTO WORKS_ON VALUES('987654321',3,5.2);
INSERT INTO WORKS_ON VALUES('987654321',10,30.2);

SELECT * FROM WORKS_ON;

CREATE TABLE DEPENDENT
( Essn CHAR(9) NOT NULL,
Dependent_name VARCHAR(15) NOT NULL,
Sex CHAR,
Bdate DATE,
Relationship VARCHAR(8),
PRIMARY KEY (Essn, Dependent_name),
FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn) );

INSERt INTO DEPENDENT VALUES('333445555','Sita','F','10-may-2015','Daughter');
INSERt INTO DEPENDENT VALUES('333445555','Kranti','M','10-may-2015','Son');
INSERt INTO DEPENDENT VALUES('333445555','Kabita','F','10-may-1965','mother');
INSERt INTO DEPENDENT VALUES('987654321','Sita','F','20-june-2005','Wifer');
INSERt INTO DEPENDENT VALUES('123456789','SUraj','M','10-dec-2014','son');

select * from dependent;

SELECT Bdate, Address
FROM EMPLOYEE
WHERE Fname='John' AND Minit='B' AND Lname='Smith';

///////Query 1. Retrieve the name and address of all employees who work for the   ‘Research’ department./////



SELECT Fname, Lname, Address
FROM EMPLOYEE, DEPARTMENT
WHERE Dname='Research' AND Dnumber=Dno;

update department set Dname='research' where Dnumber=5; 

///////////// Query 2. For every project located in ‘siliguri’,
 list the project number,
 the controlling department number, and the department manager’s 
last name, address, and birth date./////////


SELECT Pnumber, Dnum, Lname, Address, Bdate
FROM PROJECT, DEPARTMENT, EMPLOYEE
WHERE Dnum=Dnumber AND Mgr_ssn=Ssn AND
Plocation='Siliguri';







