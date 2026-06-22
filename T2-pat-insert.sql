/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-pat-insert.sql

--Student ID: 33326460
--Student Name: Nguyen Khang Huynh

/* Comments for your marker:
In task 2, I:
Insert 10 officials where each 2 official will be a group (same country, total 5 countries) containing one CDM and OFFICIAL
Insert 10 Vehicles including 1,2,3,4,5,7,8,9 model
Insert 20 countries where 5 CDM will take turn to book a single driver with the preferred language. 
In the next 10 trip, there will be some official (non CDM) books the trips, there will be different driver get booked (for other tasks)

*/

--------------------------------------
--INSERT INTO official 10 entries
--------------------------------------
INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    1,
    'Khang',
    'Nguyen',
    'VIE',
    NULL
);

INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    2,
    'Gumball',
    'Waterson',
    'VIE',
    1
);

INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    3,
    'Darwin',
    'Waterson',
    'JPN',
    NULL
);

INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    4,
    'Richard',
    'Waterson',
    'JPN',
    3
);

INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    5,
    'Upin',
    'Boy',
    'GER',
    NULL
);

INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    6,
    'Ipin',
    'Boy',
    'GER',
    5
);

INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    7,
    'Ming',
    'Choong',
    'CHN',
    NULL
);

INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    8,
    'Cheng',
    'Zhou',
    'CHN',
    7
);

INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    9,
    'Amanda',
    'Zhou',
    'FRA',
    NULL
);

INSERT INTO official (
    off_id,
    off_given,
    off_family,
    cr_ioc_code,
    off_cdm
) VALUES (
    10,
    'Angus',
    'Barber',
    'FRA',
    9
);

--------------------------------------
--INSERT INTO vehicle 10 entries
--------------------------------------
INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    'AAAAAAAAAAAAAAAAA',
    'AB001AB',
    TO_DATE('2000', 'yyyy'),
    100000,
    10,
    1
);

INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    'AAAAAAAAAAAAAAAAB',
    'AB002AB',
    TO_DATE('2002', 'yyyy'),
    120000,
    9,
    2
);

INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    'AAAAAAAAAAAAAAAAC',
    'AB003AB',
    TO_DATE('2001', 'yyyy'),
    130000,
    8,
    3
);

INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    'AAAAAAAAAAAAAAAAD',
    'AB004AB',
    TO_DATE('2001', 'yyyy'),
    100000,
    8,
    3
);

INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    'AAAAAAAAAAAAAAAAE',
    'AB005AB',
    TO_DATE('2009', 'yyyy'),
    140000,
    6,
    4
);

INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    'AAAAAAAAAAAAAAAAF',
    'AB006AB',
    TO_DATE('2020', 'yyyy'),
    160000,
    6,
    5
);

INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    'AAAAAAAAAAAAAAAAG',
    'AB007AB',
    TO_DATE('1999', 'yyyy'),
    140000,
    3,
    7
);

INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    'AAAAAAAAAAAAAAAAH',
    'AB008AB',
    TO_DATE('2023', 'yyyy'),
    155000,
    9,
    9
);

INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    'AAAAAAAAAAAAAAAAI',
    'AB009AB',
    TO_DATE('2023', 'yyyy'),
    150000,
    9,
    9
);

INSERT INTO vehicle (
    veh_vin,
    veh_rego,
    veh_year,
    veh_curr_odo,
    veh_nopassengers,
    vm_model_id
) VALUES (
    'AAAAAAAAAAAAAAAAJ',
    'AB010AB',
    TO_DATE('2022', 'yyyy'),
    145900,
    5,
    8
);

--------------------------------------
--INSERT INTO trip 20 entries
--------------------------------------

ALTER TABLE trip DISABLE CONSTRAINT trip_uq;

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
    51,
    2,
    TO_DATE('21-JUL-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    TO_DATE('22-JUL-2024 21:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    'AAAAAAAAAAAAAAAAA',
    2002,
    101,
    102,
    'en',
    1
);

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
    52,
    2,
    TO_DATE('21-JUL-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    TO_DATE('22-JUL-2024 21:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    'AAAAAAAAAAAAAAAAB',
    2010,
    101,
    102,
    'ja',
    3
);

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
    53,
    2,
    TO_DATE('21-JUL-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    TO_DATE('21-JUL-2024 21:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    'AAAAAAAAAAAAAAAAC',
    2001,
    102,
    103,
    'de',
    5
);

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
    54,
    2,
    TO_DATE('21-JUL-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    TO_DATE('21-JUL-2024 21:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    'AAAAAAAAAAAAAAAAD',
    2013,
    102,
    103,
    'zh',
    7
);

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
    55,
    2,
    TO_DATE('21-JUL-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    TO_DATE('23-JUL-2024 19:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    'AAAAAAAAAAAAAAAAE',
    2003,
    101,
    103,
    'fr',
    9
);

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
    56,
    2,
    TO_DATE('23-JUL-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    TO_DATE('26-JUL-2024 22:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    'AAAAAAAAAAAAAAAAA',
    2002,
    102,
    103,
    'en',
    1
);

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
    57,
    2,
    TO_DATE('23-JUL-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    TO_DATE('23-JUL-2024 21:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    'AAAAAAAAAAAAAAAAB',
    2010,
    102,
    104,
    'ja',
    3
);

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
    58,
    2,
    TO_DATE('23-JUL-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    TO_DATE('24-JUL-2024 21:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    'AAAAAAAAAAAAAAAAC',
    2001,
    103,
    104,
    'de',
    5
);

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
    59,
    2,
    TO_DATE('24-JUL-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    TO_DATE('25-JUL-2024 21:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    'AAAAAAAAAAAAAAAAD',
    2013,
    103,
    105,
    'zh',
    7
);

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
    60,
    2,
    TO_DATE('24-JUL-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    TO_DATE('25-JUL-2024 19:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    'AAAAAAAAAAAAAAAAE',
    2003,
    103,
    106,
    'fr',
    9
);

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
    61,
    2,
    TO_DATE('01-AUG-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    TO_DATE('01-AUG-2024 12:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    TO_DATE('03-AUG-2024 22:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    'AAAAAAAAAAAAAAAAA',
    2002,
    103,
    106,
    'en',
    1
);

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
    62,
    2,
    TO_DATE('02-AUG-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    TO_DATE('04-AUG-2024 21:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    TO_DATE('04-AUG-2024 23:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    'AAAAAAAAAAAAAAAAB',
    2010,
    104,
    108,
    'ja',
    3
);

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
    63,
    2,
    TO_DATE('06-AUG-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    TO_DATE('06-AUG-2024 13:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    TO_DATE('07-AUG-2024 21:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    TO_DATE('07-AUG-2024 19:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    'AAAAAAAAAAAAAAAAC',
    2001,
    104,
    107,
    'de',
    5
);

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
    64,
    2,
    TO_DATE('06-AUG-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    TO_DATE('06-AUG-2024 13:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    TO_DATE('07-AUG-2024 21:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    TO_DATE('07-AUG-2024 19:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    'AAAAAAAAAAAAAAAAD',
    2013,
    105,
    109,
    'zh',
    7
);

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
    65,
    2,
    TO_DATE('02-AUG-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    TO_DATE('07-AUG-2024 19:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    'AAAAAAAAAAAAAAAAE',
    2003,
    106,
    109,
    'fr',
    9
);

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
    66,
    2,
    TO_DATE('09-AUG-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    TO_DATE('09-AUG-2024 15:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    'AAAAAAAAAAAAAAAAF',
    2015,
    109,
    101,
    'fr',
    8
);

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
    67,
    2,
    TO_DATE('09-AUG-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    TO_DATE('09-AUG-2024 10:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    TO_DATE('09-AUG-2024 15:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    TO_DATE('09-AUG-2024 19:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    'AAAAAAAAAAAAAAAAD',
    2013,
    109,
    101,
    'zh',
    6
);
-- For task 3
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
    68,
    2,
    TO_DATE('10-AUG-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    TO_DATE('11-AUG-2024 10:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    'AAAAAAAAAAAAAAAAI',
    2014,
    106,
    115,
    'en',
    2
);

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
    69,
    2,
    TO_DATE('11-AUG-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    TO_DATE('14-AUG-2024 21:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    'AAAAAAAAAAAAAAAAB',
    2010,
    108,
    101,
    'ja',
    3
);

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
    70,
    2,
    TO_DATE('10-AUG-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    TO_DATE('10-AUG-2024 13:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    TO_DATE('12-AUG-2024 21:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    TO_DATE('12-AUG-2024 19:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    'AAAAAAAAAAAAAAAAC',
    2001,
    107,
    101,
    'de',
    6
);
-- For task 4
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
    71,
    2,
    TO_DATE('12-AUG-2024 09:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    TO_DATE('13-AUG-2024 10:00:00', 'DD-MON-YYYY HH24:MI:SS'),
    NULL,
    'AAAAAAAAAAAAAAAAI',
    2004,
    115,
    117,
    'en',
    2
);

ALTER TABLE trip ENABLE CONSTRAINT trip_uq;

COMMIT;