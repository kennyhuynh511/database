/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T4-pat-mods.sql

--Student ID: 33326460
--Student Name: Nguyen Khang Huynh


/* Comments for your marker:
For task 4a: I create the column for the Official table and update those CDM to Admin role.
For task 4b: I create the table Complaint, Comments for columns, set the Primary key, forgein key, and add check condition for the Complaint's Validation

*/

/*(a)*/

-- Showing the table structure and the official's entries
SELECT
    *
FROM
    nhuy0018.official;

DESC OFFICIAL;

-- Adding new column named "ROLE"
ALTER TABLE official
    ADD (
        OFF_ROLE VARCHAR2(30) DEFAULT 'General' NOT NULL,
        CONSTRAINT chk_off_role CHECK (off_role IN ('General', 'Administrator', 'Head Coach', 'Coach', 'Physician'))
    );

-- Showing the table structure after adding new role column
DESC OFFICIAL;

-- Set the role for the off_cdm tp Administrator
UPDATE official
SET
    off_role = 'Administrator'
WHERE
    off_cdm IS NULL;

-- Showing the table structure after update
SELECT
    *
FROM
    nhuy0018.official;

/*(b)*/
DROP TABLE complaint CASCADE CONSTRAINTS;

CREATE TABLE complaint (
    off_id NUMBER(4) NOT NULL,
    trip_id NUMBER(4) NOT NULL,
    comp_cato     VARCHAR2(30) NOT NULL,
    comp_dem_point    NUMBER(2) NOT NULL,
    comp_dt       DATE NOT NULL,
    comp_detail   VARCHAR2(100) NOT NULL,
    comp_valid CHAR(1) DEFAULT 'N' NOT NULL
    
);

COMMENT ON COLUMN complaint.off_id IS
    'Identifier for an official';
COMMENT ON COLUMN complaint.trip_id IS
    'Identifier for a trip';
COMMENT ON COLUMN complaint.comp_cato IS
    'Categories for an complaint';
COMMENT ON COLUMN complaint.comp_dem_point IS
    'Demerit point for an complaint';
COMMENT ON COLUMN complaint.comp_dt IS
    'Date and time for an complaint';
COMMENT ON COLUMN complaint.comp_detail IS
    'Detail for an complaint';
COMMENT ON COLUMN complaint.comp_valid IS
    'Validation for an complaint where N (not yet) will be set as default and can be set to T (True), F(False)';

-- adding PK for the Complaint
ALTER TABLE complaint ADD CONSTRAINT complaint_pk PRIMARY KEY ( off_id, trip_id );
-- adding Constraint for the comp_valid where T is True, F is False, and N is Not yet
ALTER TABLE complaint ADD CONSTRAINT chk_comp_valid CHECK (comp_valid IN ('T', 'F', 'N'));

-- adding FKs for the Complaint
ALTER TABLE complaint
    ADD CONSTRAINT trip_complaint_fk FOREIGN KEY ( trip_id )
        REFERENCES trip ( trip_id );
ALTER TABLE complaint
    ADD CONSTRAINT official_complaint_fk FOREIGN KEY ( off_id )
        REFERENCES official ( off_id );


DESC complaint;


