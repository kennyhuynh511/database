--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T5-pat-plsql.sql

--Student ID: 33326460
--Student Name: Nguyen Khang Huynh

/* Comments for your marker:
Task 5a: I create the trigger for the DRIVER_SUSPENDED column to suspend the driver when the total driver's demerit points is larger than 4
Task 5b: I create the procedure for the trip insertion to validate the incoming data of the trip.
*/

SET SERVEROUTPUT ON

SET ECHO ON

--(a)
-- Adding the table new value
ALTER TABLE driver
    ADD (
        driver_dem_point NUMBER(2) DEFAULT 0 NOT NULL
    );

-- Showing the table structure after adding new role column
DESC DRIVER;

-- Write your trigger statement,
-- finish it with a slash(/) followed by a blank line
CREATE OR REPLACE TRIGGER driver_upd_suspended AFTER
    UPDATE OF comp_valid ON nhuy0018.complaint FOR EACH ROW WHEN (new.comp_valid = upper('T') )
BEGIN
    UPDATE nhuy0018.driver
    SET
        driver_suspended = upper(
            'Y'
        )
    WHERE
        driver_dem_point >= 4;
    dbms_output.put_line('Successful checking the Driver Suspended status');
END;
/

-- Write Test Harness for (a)
-- 1 Before value and insert into complaint
SELECT
    *
FROM
    nhuy0018.driver
ORDER BY
    driver_id;

SELECT
    *
FROM
    nhuy0018.complaint
ORDER BY
    off_id,
    trip_id;

-- 1: Validate complaint of trip 51 to T and increase the demerit point driver trip 51 by 1 point
BEGIN
    INSERT INTO complaint (
        off_id,
        trip_id,
        comp_cato,
        comp_dem_point,
        comp_dt,
        comp_detail,
        comp_valid
    ) VALUES (
        1,
        51,
        'failing to assist',
        1,
        TO_DATE('23-JUL-2024 22:00:00', 'DD-MON-YYYY HH24:MI:SS'),
        'Not assist',
        'N'
    );
    UPDATE nhuy0018.driver
    SET
        driver_dem_point = driver_dem_point + 1
    WHERE
        driver_id = (
            SELECT
                driver_id
            FROM
                trip
            WHERE
                off_id = 1
                AND trip_id = 51
        );
    UPDATE nhuy0018.complaint
    SET
        comp_valid = upper(
            'T'
        )
    WHERE
        off_id = 1
        AND trip_id = 51;
END;
/

-- after value
SELECT
    *
FROM
    nhuy0018.driver
ORDER BY
    driver_id;

SELECT
    *
FROM
    nhuy0018.complaint
ORDER BY
    off_id,
    trip_id;

-- 2: Validate complaint of trip 56 to T and increase the demerit point driver trip 56 by 2 points
BEGIN
    INSERT INTO complaint (
        off_id,
        trip_id,
        comp_cato,
        comp_dem_point,
        comp_dt,
        comp_detail,
        comp_valid
    ) VALUES (
        1,
        56,
        'rude behaviour',
        2,
        TO_DATE('27-JUL-2024 22:00:00', 'DD-MON-YYYY HH24:MI:SS'),
        'Hit me',
        'N'
    );
    UPDATE nhuy0018.driver
    SET
        driver_dem_point = driver_dem_point + 2
    WHERE
        driver_id = (
            SELECT
                driver_id
            FROM
                trip
            WHERE
                off_id = 1
                AND trip_id = 56
        );
    UPDATE nhuy0018.complaint
    SET
        comp_valid = upper(
            'T'
        )
    WHERE
        off_id = 1
        AND trip_id = 56;
END;
/

-- after value
SELECT
    *
FROM
    nhuy0018.driver
ORDER BY
    driver_id;

SELECT
    *
FROM
    nhuy0018.complaint
ORDER BY
    off_id,
    trip_id;

-- 3: Validate complaint of trip 61 to T and increase the demerit point driver trip 61 by 1 point
BEGIN
    INSERT INTO complaint (
        off_id,
        trip_id,
        comp_cato,
        comp_dem_point,
        comp_dt,
        comp_detail,
        comp_valid
    ) VALUES (
        1,
        61,
        'late arrival',
        1,
        TO_DATE('04-AUG-2024 22:00:00', 'DD-MON-YYYY HH24:MI:SS'),
        'Came late 3 hours late',
        'N'
    );
    UPDATE nhuy0018.driver
    SET
        driver_dem_point = driver_dem_point + 1
    WHERE
        driver_id = (
            SELECT
                driver_id
            FROM
                trip
            WHERE
                off_id = 1
                AND trip_id = 61
        );
    UPDATE nhuy0018.complaint
    SET
        comp_valid = upper(
            'T'
        )
    WHERE
        off_id = 1
        AND trip_id = 61;
END;
/

-- after value
SELECT
    *
FROM
    nhuy0018.driver
ORDER BY
    driver_id;

SELECT
    *
FROM
    nhuy0018.complaint
ORDER BY
    off_id,
    trip_id;

-- 4: Check and validate trip 61 with the demerit point to 1 point
BEGIN
    INSERT INTO complaint (
        off_id,
        trip_id,
        comp_cato,
        comp_dem_point,
        comp_dt,
        comp_detail,
        comp_valid
    ) VALUES (
        2,
        71,
        'rude behaviour',
        2,
        TO_DATE('13-NOV-2024 22:00:00', 'DD-MON-YYYY HH24:MI:SS'),
        'Hit me',
        'N'
    );
    UPDATE nhuy0018.complaint
    SET
        comp_valid = upper(
            'F'
        )
    WHERE
        off_id = 2
        AND trip_id = 71;
END;
/

-- after value
SELECT
    *
FROM
    nhuy0018.driver
ORDER BY
    driver_id;

SELECT
    *
FROM
    nhuy0018.complaint
ORDER BY
    off_id,
    trip_id;

--(b)
-- Create the sequence for the procedure trip id
DROP SEQUENCE p_trip_seq;

CREATE SEQUENCE p_trip_seq START WITH 101 INCREMENT BY 10;

-- Complete the procedure below
-- finish it with a slash(/) followed by a blank line
CREATE OR REPLACE PROCEDURE prc_insert_trip (
    p_off_id IN NUMBER,
    p_nopassengers IN NUMBER,
    p_int_pickupdt IN DATE,
    p_int_dropoffdt IN DATE,
    p_pickup_locn_name IN VARCHAR2,
    p_dropoff_locn_name IN VARCHAR2,
    p_lang_name IN VARCHAR2,
    p_veh_vin IN CHAR,
    p_driver_id IN NUMBER,
    p_output OUT VARCHAR2
) IS
    var_off               NUMBER;
    var_nopassengers      NUMBER;
    var_pickup_locn_name  NUMBER;
    var_dropoff_locn_name NUMBER;
    var_lang_name         NUMBER;
    var_veh_vin           NUMBER;
    var_driver_id         NUMBER;
    var_trip_amount       NUMBER;
BEGIN
    SELECT
        count(*) INTO var_off
    FROM
        nhuy0018.official
    WHERE
        off_id = p_off_id;
    SELECT
        count(*) INTO var_nopassengers
    FROM
        nhuy0018.vehicle
    WHERE
        upper(veh_vin) = upper(p_veh_vin)
        AND veh_nopassengers > p_nopassengers
        AND p_nopassengers > 0;
    SELECT
        count(*) INTO var_pickup_locn_name
    FROM
        nhuy0018.location
    WHERE
        upper(locn_name) = upper(p_pickup_locn_name);
    SELECT
        count(*) INTO var_dropoff_locn_name
    FROM
        nhuy0018.location
    WHERE
        upper(locn_name) = upper(p_dropoff_locn_name);
    SELECT
        count(*) INTO var_lang_name
    FROM
        nhuy0018.language
    WHERE
        upper(lang_name) = upper(p_lang_name);
    SELECT
        count(*) INTO var_veh_vin
    FROM
        nhuy0018.vehicle
    WHERE
        upper(veh_vin) = upper(p_veh_vin);
    SELECT
        count(*) INTO var_driver_id
    FROM
        nhuy0018.driver
    WHERE
        driver_id = p_driver_id;
    IF ( var_off = 0 ) THEN
        p_output := 'Invalid official id, new trip insert process cancelled';
    ELSE
        IF ( var_veh_vin = 0 ) THEN
            p_output := 'Invalid vin of the assigned vehicle, new trip insert process cancelled';
        ELSE
            IF ( p_int_pickupdt > p_int_dropoffdt ) THEN
                p_output := 'Invalid pick up and dropoff date and time, new trip insert process cancelled';
            ELSE
                IF ( var_pickup_locn_name = 0 ) THEN
                    p_output := 'Invalid pick up location, new trip insert process cancelled';
                ELSE
                    IF ( var_dropoff_locn_name = 0 ) THEN
                        p_output := 'Invalid drop off location, new trip insert process cancelled';
                    ELSE
                        IF ( upper(p_dropoff_locn_name) = upper(p_pickup_locn_name) ) THEN
                            p_output := 'Same drop off and pick up location, new trip insert process cancelled';
                        ELSE
                            IF ( var_driver_id = 0 ) THEN
                                p_output := 'Invalid driver id, new trip insert process cancelled';
                            ELSE
                                IF ( var_nopassengers = 0 ) THEN
                                    p_output := 'Invalid number of passengers to the vehicle size, new trip insert process cancelled';
                                ELSE
                                    IF ( var_lang_name = 0 ) THEN
                                        p_output := 'Invalid language name, new trip insert process cancelled';
                                    ELSE
                                        SELECT
                                            count(*) INTO var_trip_amount
                                        FROM
                                            nhuy0018.trip
                                        WHERE
                                            p_off_id = off_id
                                            AND p_nopassengers = trip_nopassengers
                                            AND p_int_pickupdt = trip_int_pickupdt
                                            AND p_int_dropoffdt = trip_int_dropoffdt
                                            AND pickup_locn_id = (
                                                SELECT
                                                    locn_id
                                                FROM
                                                    nhuy0018.location
                                                WHERE
                                                    upper(p_pickup_locn_name) = upper(locn_name)
                                            )
                                            AND dropoff_locn_id = (
                                                SELECT
                                                    locn_id
                                                FROM
                                                    nhuy0018.location
                                                WHERE
                                                    upper(p_dropoff_locn_name) = upper(locn_name)
                                            )
                                            AND lang_iso_code = (
                                                SELECT
                                                    lang_iso_code
                                                FROM
                                                    nhuy0018.language
                                                WHERE
                                                    upper(p_lang_name) = upper(lang_name)
                                            )
                                            AND upper(p_veh_vin) = upper(veh_vin)
                                            AND p_driver_id = driver_id;
                                        IF ( var_trip_amount <> 0 ) THEN
                                            p_output := 'Trip exists in the system';
                                        ELSE
                                            INSERT INTO trip (
                                                trip_id,
                                                trip_nopassengers,
                                                trip_int_pickupdt,
                                                trip_act_pickupdt,
                                                trip_int_dropoffdt,
                                                trip_act_dropoffdt,
                                                veh_vin,
                                                driver_id,
                                                pickup_locn_id,
                                                dropoff_locn_id,
                                                lang_iso_code,
                                                off_id
                                            ) VALUES (
                                                p_trip_seq.NEXTVAL,
                                                p_nopassengers,
                                                p_int_pickupdt,
                                                NULL,
                                                p_int_dropoffdt,
                                                NULL,
                                                p_veh_vin,
                                                p_driver_id,
                                                ( SELECT locn_id FROM nhuy0018.location WHERE upper(p_pickup_locn_name) = upper(locn_name) ),
                                                ( SELECT locn_id FROM nhuy0018.location WHERE upper(p_dropoff_locn_name) = upper(locn_name) ),
                                                ( SELECT lang_iso_code FROM nhuy0018.language WHERE upper(p_lang_name) = upper(lang_name) ),
                                                p_off_id
                                            );
                                            p_output := 'The new trip for official '
                                                        || p_off_id
                                                        || ' has been recorded';
                                        END IF;
                                    END IF;
                                END IF;
                            END IF;
                        END IF;
                    END IF;
                END IF;
            END IF;
        END IF;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        p_output := sqlerrm;
END;
/

-- Write Test Harness for (b)
--Test harness
--before value
SELECT
    *
FROM
    nhuy0018.trip
WHERE
    off_id = 1
ORDER BY
    trip_id;

ALTER TABLE nhuy0018.trip DISABLE CONSTRAINT trip_uq;

--1
--execute the procedure - valid entries
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip(1, 2, to_date('11-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), to_date('12-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), 'Bordeaux Stadium', 'Bercy Arena', 'English', 'AAAAAAAAAAAAAAAAA', 2002, output);
    dbms_output.put_line(output);
END;
/

--after value
SELECT
    *
FROM
    nhuy0018.trip
WHERE
    off_id = 1
ORDER BY
    trip_id;

--2
--execute the procedure - invalid official entries
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip(-1, 2, to_date('11-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), to_date('12-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), 'Bordeaux Stadium', 'Bercy Arena', 'English', 'AAAAAAAAAAAAAAAAA', 2002, output);
    dbms_output.put_line(output);
END;
/

--after value
SELECT
    *
FROM
    nhuy0018.trip
WHERE
    off_id = 1
ORDER BY
    trip_id;

--3
--execute the procedure - invalid number of passengers (must be the same as the number of passengers in the assigned vehicle) entries
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip(1, 0, to_date('11-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), to_date('12-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), 'Bordeaux Stadium', 'Bercy Arena', 'English', 'AAAAAAAAAAAAAAAAA', 2002, output);
    dbms_output.put_line(output);
END;
/

--after value
SELECT
    *
FROM
    nhuy0018.trip
WHERE
    off_id = 1
ORDER BY
    trip_id;

--4
--execute the procedure - invalid pick up and drop off date and time entries
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip(1, 2, to_date('12-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), to_date('11-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), 'Bordeaux Stadium', 'Bercy Arena', 'English', 'AAAAAAAAAAAAAAAAA', 2002, output);
    dbms_output.put_line(output);
END;
/

--after value
SELECT
    *
FROM
    nhuy0018.trip
WHERE
    off_id = 1
ORDER BY
    trip_id;

--5
--execute the procedure - invalid pick up location entries
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip(1, 2, to_date('11-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), to_date('12-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), 'Pick up', 'Bercy Arena', 'English', 'AAAAAAAAAAAAAAAAA', 2002, output);
    dbms_output.put_line(output);
END;
/

--after value
SELECT
    *
FROM
    nhuy0018.trip
WHERE
    off_id = 1
ORDER BY
    trip_id;

--6
--execute the procedure - invalid drop off location entries
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip(1, 2, to_date('11-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), to_date('12-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), 'Bordeaux Stadium', 'Dropoff', 'English', 'AAAAAAAAAAAAAAAAA', 2002, output);
    dbms_output.put_line(output);
END;
/

--after value
SELECT
    *
FROM
    nhuy0018.trip
WHERE
    off_id = 1
ORDER BY
    trip_id;

--7
--execute the procedure - Invalid prefered language entries
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip(1, 2, to_date('11-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), to_date('12-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), 'Bordeaux Stadium', 'Bercy Arena', 'Language', 'AAAAAAAAAAAAAAAAA', 2002, output);
    dbms_output.put_line(output);
END;
/

--after value
SELECT
    *
FROM
    nhuy0018.trip
WHERE
    off_id = 1
ORDER BY
    trip_id;

--8
--execute the procedure - invalid vehicle vin entries
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip(1, 2, to_date('11-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), to_date('12-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), 'Bordeaux Stadium', 'Bercy Arena', 'English', 'AAAAAAAAAAAAAAABQ', 2002, output);
    dbms_output.put_line(output);
END;
/

--after value
SELECT
    *
FROM
    nhuy0018.trip
WHERE
    off_id = 1
ORDER BY
    trip_id;

ALTER TABLE nhuy0018.trip ENABLE CONSTRAINT trip_uq;

--9
--execute the procedure - invalid driver id
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip(1, 2, to_date('11-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), to_date('12-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), 'Bordeaux Stadium', 'Bercy Arena', 'English', 'AAAAAAAAAAAAAAAAA', 1232, output);
    dbms_output.put_line(output);
END;
/

--after value
SELECT
    *
FROM
    nhuy0018.trip
WHERE
    off_id = 1
ORDER BY
    trip_id;

--10
--execute the procedure - invalid number of passengers exceed the vehicle limitation
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip(1, 99, to_date('11-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), to_date('12-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), 'Bordeaux Stadium', 'Bercy Arena', 'English', 'AAAAAAAAAAAAAAAAA', 2002, output);
    dbms_output.put_line(output);
END;
/

--after value
SELECT
    *
FROM
    nhuy0018.trip
WHERE
    off_id = 1
ORDER BY
    trip_id;

--11
--execute the procedure - invalid same pick up and dropoff entries
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_insert_trip(1, 2, to_date('11-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), to_date('12-NOV-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'), 'Bordeaux Stadium', 'Bordeaux Stadium', 'English', 'AAAAAAAAAAAAAAAAA', 2002, output);
    dbms_output.put_line(output);
END;
/

--after value
SELECT
    *
FROM
    nhuy0018.trip
WHERE
    off_id = 1
ORDER BY
    trip_id;

--close the transaction
ROLLBACK;