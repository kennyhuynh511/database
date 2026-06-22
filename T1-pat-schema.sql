--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T1-pat-schema.sql

--Student ID: 33326460
--Student Name: Nguyen Khang Huynh


/* Comments for your marker:
For task 1, I focus on creating table, comment on column,
assign primary key, unique constraint, foregin key for the Trip, Official, Vehicle

*/

-- Task 1 Add Create table statements for the Missing TABLES below.
-- Ensure all column comments, and constraints (other than FK's)are included.
-- FK constraints are to be added at the end of this script

-- OFFICIAL
-- CREATE OFFICIAL TABLE
CREATE TABLE official (
    off_id NUMBER(4) NOT NULL,
    off_given VARCHAR2(30),
    off_family VARCHAR2(30),
    cr_ioc_code CHAR(3) NOT NULL,
    off_cdm NUMBER(4)
);

-- COMMENTS FOR OFFICIAL TABLE
COMMENT ON COLUMN official.off_id IS
    'Identifier for an official';
COMMENT ON COLUMN official.off_given IS
    'Given name for the official';
COMMENT ON COLUMN official.off_family IS
    'Family name for the official';
COMMENT ON COLUMN official.cr_ioc_code IS
    'IOC country code for the official';
COMMENT ON COLUMN official.off_cdm IS
    'Identifier for Chef De Mission for the official';

-- PRIMARY KEY FOR THE OFFICIAL TABLE
ALTER TABLE official
    ADD CONSTRAINT offical_pk PRIMARY KEY (
        off_id
    );

-- VEHICLE
CREATE TABLE vehicle (
    veh_vin CHAR(17) NOT NULL,
    veh_rego CHAR(7) NOT NULL,
    veh_year DATE NOT NULL,
    veh_curr_odo NUMBER(6) NOT NULL,
    veh_nopassengers NUMBER(2) NOT NULL,
    vm_model_id NUMBER(4) NOT NULL
);

-- COMMENTS FOR VEHICLE
COMMENT ON COLUMN vehicle.veh_vin IS
    'Identifier for vehicle';
COMMENT ON COLUMN vehicle.veh_rego IS
    'Registration plate of vehicle';
COMMENT ON COLUMN vehicle.veh_year IS
    'Year of manufacture of vehicle';
COMMENT ON COLUMN vehicle.veh_curr_odo IS
    'Current odometer reading of vehicle';
COMMENT ON COLUMN vehicle.veh_nopassengers IS
    'Number of passengers vehicle can seat';
COMMENT ON COLUMN vehicle.vm_model_id IS
    'Identifier for vehicle_model';

-- PRIMARY KEY FOR THE VEHICLE TABLE
ALTER TABLE vehicle
    ADD CONSTRAINT vehicle_pk PRIMARY KEY (
        veh_vin
    );

-- TRIP
CREATE TABLE trip (
    trip_id NUMBER(4) NOT NULL,
    trip_nopassengers NUMBER(2) NOT NULL,
    trip_int_pickupdt DATE NOT NULL,
    trip_act_pickupdt DATE,
    trip_int_dropoffdt DATE NOT NULL,
    trip_act_dropoffdt DATE,
    veh_vin CHAR(17) NOT NULL,
    driver_id NUMBER(4) NOT NULL,
    pickup_locn_id NUMBER(3) NOT NULL,
    dropoff_locn_id NUMBER(3) NOT NULL,
    lang_iso_code CHAR(2) NOT NULL,
    off_id NUMBER(4) NOT NULL
);

-- COMMENTS FOR TRIP
COMMENT ON COLUMN trip.trip_id IS
    'Identifier for a trip';
COMMENT ON COLUMN trip.trip_nopassengers IS
    'Number of passengers for the trip';
COMMENT ON COLUMN trip.trip_int_pickupdt IS
    'Intended pickup date and time for the trip';
COMMENT ON COLUMN trip.trip_act_pickupdt IS
    'Actual pickup date and time for the trip';
COMMENT ON COLUMN trip.trip_int_dropoffdt IS
    'Intended drop-off date and time for the trip';
COMMENT ON COLUMN trip.trip_act_dropoffdt IS
    'Actual drop-off date and time for the trip';
COMMENT ON COLUMN trip.veh_vin IS
    'Identifier for a vehicle';
COMMENT ON COLUMN trip.driver_id IS
    'Identifier for a driver';
COMMENT ON COLUMN trip.pickup_locn_id IS
    'Identifier for the pick-up location';
COMMENT ON COLUMN trip.dropoff_locn_id IS
    'Identifier for the drop-off location';
COMMENT ON COLUMN trip.lang_iso_code IS
    'ISO639-1 two-character language codes';
COMMENT ON COLUMN trip.off_id IS
    'Identifier for an official';

-- PRIMARY KEY FOR THE TRIP TABLE
ALTER TABLE trip
    ADD CONSTRAINT trip_pk PRIMARY KEY (
        trip_id
    );

-- UNIQUE CONSTRAINST FOR THE TRIP TABLE
ALTER TABLE trip
    ADD CONSTRAINT trip_uq UNIQUE (
        trip_int_pickupdt,
        trip_int_dropoffdt,
        veh_vin,
        driver_id
    );

-- Add all missing FK Constraints below here

-- OFFICIAL FK FROM CONTRY_REGION
ALTER TABLE official
    ADD CONSTRAINT country_region_official_fk FOREIGN KEY (
        cr_ioc_code
    )
        REFERENCES country_region (
            cr_ioc_code
        );

-- ITSELF
ALTER TABLE official
    ADD CONSTRAINT official_official_fk FOREIGN KEY (
        off_cdm
    )
        REFERENCES official (
            off_id
        );

-- VEHICLE FK FROM VEHICLE_MODEL
ALTER TABLE vehicle
    ADD CONSTRAINT vehicle_model_vehicle_fk FOREIGN KEY (
        vm_model_id
    )
        REFERENCES vehicle_model (
            vm_model_id
        );

-- TRIP FK FROM VEHICLE TABLE
ALTER TABLE trip
    ADD CONSTRAINT vehicle_trip_fk FOREIGN KEY (
        veh_vin
    )
        REFERENCES vehicle (
            veh_vin
        );

-- TRIP FK FROM DRIVER TABLE
ALTER TABLE trip
    ADD CONSTRAINT driver_trip_fk FOREIGN KEY (
        driver_id
    )
        REFERENCES driver (
            driver_id
        );

-- TRIP FK FROM LOCATION TABLE
ALTER TABLE trip
    ADD CONSTRAINT location_pick_up_trip_fk FOREIGN KEY (
        pickup_locn_id
    )
        REFERENCES location (
            locn_id
        );

-- TRIP FK FROM LOCATION TABLE
ALTER TABLE trip
    ADD CONSTRAINT location_drop_off_trip_fk FOREIGN KEY (
        dropoff_locn_id
    )
        REFERENCES location (
            locn_id
        );

-- TRIP FK FROM LANGUAGE TABLE
ALTER TABLE trip
    ADD CONSTRAINT language_trip_fk FOREIGN KEY (
        lang_iso_code
    )
        REFERENCES language (
            lang_iso_code
        );

-- TRIP FK FROM OFFICIAL TABLE
ALTER TABLE trip
    ADD CONSTRAINT official_trip_fk FOREIGN KEY (
        off_id
    )
        REFERENCES official (
            off_id
        );