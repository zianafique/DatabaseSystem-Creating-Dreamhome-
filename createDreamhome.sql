SQL> spool
currently spooling to C:\Users\Md. Afique Amin Zian\Documents\1st semseter\Database System\createDreamhome.sql
SQL> 
SQL> 
SQL> 
SQL> SELECT * FROM tab;

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
REGISTRATION                   TABLE                                            

SQL> SELECT * FROM staff;
SELECT * FROM staff
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> SELECT * FROM  REGISTRATION;

CLIEN BRANC STAFF DATEJOINE                                                     
----- ----- ----- ---------                                                     
CR76  B005  SL41  02-JAN-01                                                     
CR56  B003  SG37  11-APR-00                                                     
CR74  B003  SG37  16-NOV-99                                                     
CR62  B007  SA9   07-MAR-00                                                     

SQL> SELECT propertyNo,street,city,postcode,type,rooms,rent
  2  FROM PropertyForRent
  3  WHERE staffNo IN
  4  (SELECT staffNo
  5  FROM staff
  6  WHERE branchNo=
  7                 (SELECT branchNo
  8                   FROM branch
  9                     WHERE street='163 Main St'));
FROM PropertyForRent
     *
ERROR at line 2:
ORA-00942: table or view does not exist 


SQL> drop table Branch;
drop table Branch
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> 
SQL> create table Branch
  2  (branchno char(5) not null,
  3  street varchar(35),
  4  city varchar(10),
  5  postcode varchar(10),
  6  primary key(branchno)
  7  );

Table created.

SQL> 
SQL> insert into Branch
  2  values('B005','22 Deer Rd','London','SW1 4EH');

1 row created.

SQL> insert into Branch
  2  values('B007','16 Argyll St','Aberdeen','AB2 3SU');

1 row created.

SQL> insert into Branch
  2  values('B003','163 Main St','Glasgow','G11 9QX');

1 row created.

SQL> insert into Branch
  2  values('B004','32 Manse Rd','Bristol','BS99 1NZ');

1 row created.

SQL> insert into Branch
  2  values('B002','56 Clover Dr','London','NW10 6EU');

1 row created.

SQL> 
SQL> drop table Staff;
drop table Staff
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> 
SQL> create table Staff
  2  (staffno char(5) not null,
  3  fname varchar(10),
  4  lname varchar(10),
  5  position varchar(10),
  6  sex char(1),
  7  dob date,
  8  salary smallint,
  9  branchno char(5),
 10  primary key(staffno)
 11  );

Table created.

SQL> 
SQL> insert into Staff
  2  values('SL21','John','White','Manager','M','1-Oct-45',30000,'B005');

1 row created.

SQL> insert into Staff
  2  values('SG37','Ann','Beech','Assistant','F','10-Nov-60',12000,'B003');

1 row created.

SQL> insert into Staff
  2  values('SG14','David','Ford','Supervisor','M','24-Mar-58',18000,'B003');

1 row created.

SQL> insert into Staff
  2  values('SA9','Mary','Howe','Assistant','F','19-Feb-70',9000,'B007');

1 row created.

SQL> insert into Staff
  2  values('SG5','Susan','Brand','Manager','F','3-Jun-40',24000,'B003');

1 row created.

SQL> insert into Staff
  2  values('SL41','Julie','Lee','Assistant','F','13-Jun-65',9000,'B005');

1 row created.

SQL> 
SQL> drop table PropertyForRent;
drop table PropertyForRent
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> 
SQL> create table PropertyForRent
  2  (propertyno char(5) not null,
  3  street varchar(35),
  4  city varchar(10),
  5  postcode varchar(10),
  6  type varchar(10),
  7  rooms smallint,
  8  rent int,
  9  ownerno char(5),
 10  staffno char(5),
 11  branchno char(5),
 12  primary key(propertyno)
 13  );

Table created.

SQL> 
SQL> insert into PropertyForRent
  2  values('PA14','16 Holhead','Aberdeen','AB7 5SU','House',6,650,'CO46','SA9','B007');

1 row created.

SQL> insert into PropertyForRent
  2  values('PL94','6 Argyll St','London','NW2','Flat',4,400,'CO87','SL41','B005');

1 row created.

SQL> insert into PropertyForRent
  2  values('PG4','6 Lawrence St','Glasgow','G11 9QX','Flat',3,350,'CO40',NULL,'B003');

1 row created.

SQL> insert into PropertyForRent
  2  values('PG36','2 Manor Rd','Glasgow','G32 4QX','Flat',3,375,'CO93','SG37','B003');

1 row created.

SQL> insert into PropertyForRent
  2  values('PG21','18 Dale Rd','Glasgow','G12','House',5,600,'CO87','SG37','B003');

1 row created.

SQL> insert into PropertyForRent
  2  values('PG16','5 Novar Dr','Glasgow','G12 9AX','Flat',4,450,'CO93','SG14','B003');

1 row created.

SQL> 
SQL> drop table Client;
drop table Client
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> 
SQL> create table Client
  2  (clientno char(5) not null,
  3  fname varchar(10),
  4  lname varchar(10),
  5  telno char(15),
  6  preftype varchar(10),
  7  maxrent int,
  8  primary key(clientno)
  9  );

Table created.

SQL> 
SQL> insert into Client
  2  values('CR76','John','Kay','0171-774-5632','Flat',425);

1 row created.

SQL> insert into Client
  2  values('CR56','Aline','Steward','0141-848-1825','Flat',350);

1 row created.

SQL> insert into Client
  2  values('CR74','Mike','Ritchie','01475-392178','House',750);

1 row created.

SQL> insert into Client
  2  values('CR62','Mary','Tregear','01224-196720','Flat',600);

1 row created.

SQL> 
SQL> drop table PrivateOwner;
drop table PrivateOwner
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> 
SQL> create table PrivateOwner
  2  (ownerno char(5) not null,
  3  fname varchar(10),
  4  lname varchar(10),
  5  address varchar(50),
  6  telno char(15),
  7  primary key(ownerno)
  8  );

Table created.

SQL> 
SQL> insert into PrivateOwner
  2  values('CO46','Joe','Keogh','2 Fergus Dr. Aberdeen AB2 7SX','01224-861212');

1 row created.

SQL> insert into PrivateOwner
  2  values('CO87','Carol','Farrel','6 Achray St. Glasgow G32 9DX','0141-357-7419');

1 row created.

SQL> insert into PrivateOwner
  2  values('CO40','Tina','Murphy','63 Well St. Glasgow G42','0141-943-1728');

1 row created.

SQL> insert into PrivateOwner
  2  values('CO93','Tony','Shaw','12 Park Pl. Glasgow G4 0QR','0141-225-7025');

1 row created.

SQL> 
SQL> drop table Viewing;
drop table Viewing
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> 
SQL> create table Viewing
  2  (clientno char(5) not null,
  3  propertyno char(5) not null,
  4  viewdate date,
  5  comments varchar(15),
  6  primary key(clientno,propertyno)
  7  );

Table created.

SQL> 
SQL> insert into Viewing
  2  values('CR56','PA14','24-May-95','too small');

1 row created.

SQL> insert into Viewing
  2  values('CR76','PG4','20-Apr-95','too remote');

1 row created.

SQL> insert into Viewing
  2  values('CR56','PG4','26-May-95',NULL);

1 row created.

SQL> insert into Viewing
  2  values('CR62','PA14','14-May-95','no dining room');

1 row created.

SQL> insert into Viewing
  2  values('CR56','PG36','28-Apr-95',NULL);

1 row created.

SQL> 
SQL> drop table Registration;

Table dropped.

SQL> 
SQL> create table Registration
  2  (clientNo char(5) not null,
  3  branchNo char(5) not null,
  4  staffNo char(5),
  5  dateJoined date,
  6  primary key(clientNo,branchNo)
  7  );

Table created.

SQL> 
SQL> insert into Registration
  2  values('CR76','B005','SL41','2-Jan-01');

1 row created.

SQL> insert into Registration
  2  values('CR56','B003','SG37','11-Apr-00');

1 row created.

SQL> insert into Registration
  2  values('CR74','B003','SG37','16-Nov-99');

1 row created.

SQL> insert into Registration
  2  values('CR62','B007','SA9','7-Mar-00');

1 row created.

SQL> SELECT * FROM staff;

STAFF FNAME      LNAME      POSITION   S DOB           SALARY BRANC             
----- ---------- ---------- ---------- - --------- ---------- -----             
SL21  John       White      Manager    M 01-OCT-45      30000 B005              
SG37  Ann        Beech      Assistant  F 10-NOV-60      12000 B003              
SG14  David      Ford       Supervisor M 24-MAR-58      18000 B003              
SA9   Mary       Howe       Assistant  F 19-FEB-70       9000 B007              
SG5   Susan      Brand      Manager    F 03-JUN-40      24000 B003              
SL41  Julie      Lee        Assistant  F 13-JUN-65       9000 B005              

6 rows selected.

SQL> 
SQL> SELECT staffNo,fName,lName,position,salary
  2  FROM staff
  3  WHERE salary>ANY
  4                 (SELECT salary FROM staff WHERE branchNo='B003');

STAFF FNAME      LNAME      POSITION       SALARY                               
----- ---------- ---------- ---------- ----------                               
SL21  John       White      Manager         30000                               
SG14  David      Ford       Supervisor      18000                               
SG5   Susan      Brand      Manager         24000                               

SQL> SELECT staffNo,fName,lName,position,salary FROM staff WHERE salary>ALL(SELECT salary FROM staff WHERE branchNo ='B003');

STAFF FNAME      LNAME      POSITION       SALARY                               
----- ---------- ---------- ---------- ----------                               
SL21  John       White      Manager         30000                               

SQL> SELECT staffNo,fName,lName,position,salary FROM staff WHERE salary<ALL(SELECT salary FROM staff WHERE branchNo ='B003');

STAFF FNAME      LNAME      POSITION       SALARY                               
----- ---------- ---------- ---------- ----------                               
SA9   Mary       Howe       Assistant        9000                               
SL41  Julie      Lee        Assistant        9000                               

SQL> SELECT staffNo,fName,lName,position,salary FROM staff WHERE salary<ANY(SELECT salary FROM staff WHERE branchNo ='B003');

STAFF FNAME      LNAME      POSITION       SALARY                               
----- ---------- ---------- ---------- ----------                               
SG37  Ann        Beech      Assistant       12000                               
SG14  David      Ford       Supervisor      18000                               
SA9   Mary       Howe       Assistant        9000                               
SL41  Julie      Lee        Assistant        9000                               

SQL> SELECT propertyNo,street,city,postcode,type,room,rent
  2  FROM PropertyForRent
  3  WHERE clientNo = (SELECT clientNo FROM viewing)
  4  
SQL> SELECT propertyNp,street,city,postcode,type,room,rent
  2  FROM PropertyForRent
  3  WHERE propertyNO =(SELECT propertyNo FROM viewing WHERE clientNo=(SELECT clientNo FROM client WHERE fName ='Aline'));
SELECT propertyNp,street,city,postcode,type,room,rent
                                            *
ERROR at line 1:
ORA-00904: "ROOM": invalid identifier 


SQL> SELECT propertyNo,street,city,postcode,type,rooms,rent FROM PropertyForRent
  2  WHERE propertyNo IN (SELECT propertyNo FROM viewing WHERE clientNO=(SELECT clientNo FROM clientWHERE fName ='Aline'));
WHERE propertyNo IN (SELECT propertyNo FROM viewing WHERE clientNO=(SELECT clientNo FROM clientWHERE fName ='Aline'))
                                                                                                           *
ERROR at line 2:
ORA-00907: missing right parenthesis 


SQL> WHERE propertyNo IN (SELECT propertyNo FROM viewing WHERE clientNO=(SELECT clientNo FROM client WHERE fName ='Aline'));
SP2-0734: unknown command beginning "WHERE prop..." - rest of line ignored.
SQL> SELECT propertyNo,street,city,postcode,type,rooms FROM PropertyForRent WHERE propertyNo IN (SELECT propertyNo FROM viewing WHERE clientNO=(SELECT clientNo FROM client WHERE fName ='Aline'));

PROPE STREET                              CITY       POSTCODE   TYPE            
----- ----------------------------------- ---------- ---------- ----------      
     ROOMS                                                                      
----------                                                                      
PA14  16 Holhead                          Aberdeen   AB7 5SU    House           
         6                                                                      
                                                                                
PG4   6 Lawrence St                       Glasgow    G11 9QX    Flat            
         3                                                                      
                                                                                
PG36  2 Manor Rd                          Glasgow    G32 4QX    Flat            
         3                                                                      
                                                                                

SQL> SELECT propertyNo,street,city,postcode,type,rooms FROM PropertyForRent WHERE propertyNo IN (SELECT propertyNo FROM viewing WHERE clientNO=(SELECT clientNo FROM client WHERE fName ='Aline'));

PROPE STREET                              CITY       POSTCODE   TYPE            
----- ----------------------------------- ---------- ---------- ----------      
     ROOMS                                                                      
----------                                                                      
PA14  16 Holhead                          Aberdeen   AB7 5SU    House           
         6                                                                      
                                                                                
PG4   6 Lawrence St                       Glasgow    G11 9QX    Flat            
         3                                                                      
                                                                                
PG36  2 Manor Rd                          Glasgow    G32 4QX    Flat            
         3                                                                      
                                                                                

SQL> SELECT c.clientNO,fName,lName,propertyNo,comments
  2  FROM client c,viewing v
  3  WHERE c.clientNo=v.clientNO;

CLIEN FNAME      LNAME      PROPE COMMENTS                                      
----- ---------- ---------- ----- ---------------                               
CR56  Aline      Steward    PA14  too small                                     
CR76  John       Kay        PG4   too remote                                    
CR56  Aline      Steward    PG4                                                 
CR62  Mary       Tregear    PA14  no dining room                                
CR56  Aline      Steward    PG36                                                

SQL> exit
