/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T3-pat-dml.sql

--Student ID: 33326460
--Student Name: Nguyen Khang Huynh

/* Comments for your marker:
I follow the requirement in the context, I put more comments to describe the task below
I used the syntax of week 8 and 9 to find the data instead of manually searching for it
*/

/*(a)*/
-- DROP sequence before it start
DROP SEQUENCE official_seq;
DROP SEQUENCE trip_seq;

-- Create the sequence for the official and trip id
CREATE SEQUENCE official_seq START WITH 100 INCREMENT BY 10;

CREATE SEQUENCE trip_seq START WITH 100 INCREMENT BY 10;

/*(b)*/
-- Insert the official Franklin Gateau
INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    official_seq.NEXTVAL,
    'Franklin',
    'Gateau',
   (
    SELECT
        CR_IOC_CODE
    FROM
        NHUY0018.COUNTRY_REGION
    WHERE
        UPPER(CR_NAME) = UPPER('St Vincent and the Grenadines')
),NULL
);

-- Insert the vehicle plate 1C4SDHCT9FC614231
INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    '1C4SDHCT9FC614231',
    'AB901CL',
    TO_DATE('2000', 'yyyy'),
    103000,
    6,
   (
    SELECT
        vm_model_id
    FROM
        nhuy0018.vehicle_model
    WHERE
        upper(vm_model) = 'ALPHARD'
        AND man_id = (
            SELECT
                man_id
            FROM
                nhuy0018.manufacturer
            WHERE
                upper(man_name) = 'TOYOTA'
        )
)
);

COMMIT;

/*(c)*/
ALTER TABLE trip DISABLE CONSTRAINT trip_uq;

-- INSERT INTO FIRST TRIP
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
    trip_seq.NEXTVAL,
    2,
    TO_DATE('30-JUL-2024 12:30:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    TO_DATE('30-JUL-2024 14:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    '1C4SDHCT9FC614231',
   (
    SELECT
        DRIVER_ID
    FROM
        NHUY0018.DRIVER
    WHERE
        UPPER(DRIVER_GIVEN) = UPPER('Claire')
        AND UPPER(DRIVER_FAMILY) = UPPER('Robert')
        AND UPPER(DRIVER_LICENCE) = UPPER('55052a543210')
),
(
    SELECT
        LOCN_ID
    FROM
        NHUY0018.LOCATION
    WHERE
        UPPER(LOCN_NAME) = UPPER('Olympic and Paralympic Village')
),
(
    SELECT
        LOCN_ID
    FROM
        NHUY0018.LOCATION
    WHERE
        UPPER(LOCN_NAME) = UPPER('Porte de la Chapelle Arena')
),
(
    SELECT
        L.LANG_ISO_CODE
    FROM
        NHUY0018.DRIVER D
        JOIN NHUY0018.DRIVER_LANGUAGE L
        ON D.DRIVER_ID = L.DRIVER_ID
    WHERE
        L.LANG_ISO_CODE = (
            SELECT
                LANG_ISO_CODE
            FROM
                NHUY0018.LANGUAGE
            WHERE
                UPPER(LANG_NAME) = UPPER('English')
        )
        AND UPPER(D.DRIVER_GIVEN) = UPPER('Claire')
        AND UPPER(D.DRIVER_FAMILY) = UPPER('Robert')
        AND UPPER(D.DRIVER_LICENCE) = UPPER('55052a543210')
),
(
    SELECT
        OFF_ID
    FROM
        NHUY0018.OFFICIAL
    WHERE
        UPPER(OFF_GIVEN) = UPPER('Franklin')
        AND UPPER(OFF_FAMILY) = UPPER('Gateau')
)
);

-- INSERT INTO SECOND TRIP
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
    trip_seq.NEXTVAL,
    2,
    TO_DATE('30-JUL-2024 08:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    TO_DATE('30-JUL-2024 09:15:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    '1C4SDHCT9FC614231',
    (
    SELECT
        DRIVER_ID
    FROM
        NHUY0018.DRIVER
    WHERE
        UPPER(DRIVER_GIVEN) = UPPER('Claire')
        AND UPPER(DRIVER_FAMILY) = UPPER('Robert')
        AND UPPER(DRIVER_LICENCE) = UPPER('55052a543210')
),
(
    SELECT
        LOCN_ID
    FROM
        NHUY0018.LOCATION
    WHERE
        UPPER(LOCN_NAME) = UPPER('Porte de la Chapelle Arena')
),
(
    SELECT
        LOCN_ID
    FROM
        NHUY0018.LOCATION
    WHERE
        UPPER(LOCN_NAME) = UPPER('Olympic and Paralympic Village')
),
(
    SELECT
        L.LANG_ISO_CODE
    FROM
        NHUY0018.DRIVER D
        JOIN NHUY0018.DRIVER_LANGUAGE L
        ON D.DRIVER_ID = L.DRIVER_ID
    WHERE
        L.LANG_ISO_CODE = (
            SELECT
                LANG_ISO_CODE
            FROM
                NHUY0018.LANGUAGE
            WHERE
                UPPER(LANG_NAME) = UPPER('English')
        )
        AND UPPER(D.DRIVER_GIVEN) = UPPER('Claire')
        AND UPPER(D.DRIVER_FAMILY) = UPPER('Robert')
        AND UPPER(D.DRIVER_LICENCE) = UPPER('55052a543210')
),
(
    SELECT
        OFF_ID
    FROM
        NHUY0018.OFFICIAL
    WHERE
        UPPER(OFF_GIVEN) = UPPER('Franklin')
        AND UPPER(OFF_FAMILY) = UPPER('Gateau')
)
);

ALTER TABLE trip ENABLE CONSTRAINT trip_uq;

COMMIT;

/*(d)*/
ALTER TABLE trip DISABLE CONSTRAINT trip_uq;

UPDATE trip
SET
    trip_act_dropoffdt = TO_DATE(
        '30-JUL-2024 14:15:00',
        'DD-MON-YYYY HH24:MI:SS'
    )
WHERE
    pickup_locn_id = (
        SELECT
            locn_id
        FROM
            nhuy0018.location
        WHERE
            upper(locn_name) = upper('Olympic and Paralympic Village')
    )
    AND dropoff_locn_id = (
        SELECT
            locn_id
        FROM
            nhuy0018.location
        WHERE
            upper(locn_name) = upper('Porte de la Chapelle Arena')
    );

DELETE FROM trip
WHERE
    driver_id = (
        SELECT
            driver_id
        FROM
            nhuy0018.driver
        WHERE
            upper(driver_given) = upper('Claire')
            AND upper(driver_family) = upper('Robert')
            AND upper(driver_licence) = upper('55052a543210')
    )
    AND (trip_int_pickupdt > TO_DATE('30-JUL-2024 17:00:00', 'DD-MON-YYYY HH24:MI:SS')
    OR trip_act_pickupdt > TO_DATE('30-JUL-2024 17:00:00', 'DD-MON-YYYY HH24:MI:SS') );

ALTER TABLE trip ENABLE CONSTRAINT trip_uq;

COMMIT;