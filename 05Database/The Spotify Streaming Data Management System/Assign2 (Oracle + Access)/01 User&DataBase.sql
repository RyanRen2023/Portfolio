-- Cleanup for Assignment 2

DROP USER dbo CASCADE;
DROP ROLE assign2AdminRole;
DROP TABLESPACE cst2355_Assign2 INCLUDING CONTENTS AND DATAFILES;

-- End of File


-- Create STORAGE
CREATE TABLESPACE cst2355_Assing2
  DATAFILE 'cst2355_Assign2.dat' SIZE 40M 
  ONLINE; 
  
-- Create Users: in order to compcity with the assignment 1, so 
-- create user name as dbo
CREATE USER dbo IDENTIFIED BY dboPassword ACCOUNT UNLOCK
	DEFAULT TABLESPACE cst2355_Assign2
	QUOTA 20M ON cst2355_Assign2;
	
	
-- Create ROLES
CREATE ROLE assign2AdminRole;

-- Grant PRIVILEGES to role. 
GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE TRIGGER, CREATE PROCEDURE TO assign2AdminRole;

-- grant user dbo with role assign2AdminRole
GRANT assign2AdminRole TO dbo;



-- This is optional, your guys don't need to execute. 
grant SELECT_CATALOG_ROLE to ASSIGN2ADMIN;
grant SELECT ANY DICTIONARY to ASSIGN2ADMIN;
