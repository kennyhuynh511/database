/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-pat-json.sql

--Student ID: 33326460
--Student Name: Nguyen Khang Huynh

/* Comments for your marker: The Structure for the MongoDB (I use syntax of week 8 and week 9 to find the required data from another table)
*/

-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT TO GENERATE 
-- THE COLLECTION OF JSON DOCUMENTS HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
        JSON_OBJECT(
            '_id' VALUE DRIVER_ID,
                    'name' VALUE DRIVER_GIVEN
                                 || ' '
                                 || DRIVER_FAMILY,
                    'licence_num' VALUE DRIVER_LICENCE,
                    'no_of_trips' VALUE COUNT(TRIP_ID),
                    'suspended' VALUE DRIVER_SUSPENDED,
                    'trips_info' VALUE JSON_ARRAYAGG(
                JSON_OBJECT(
                    'trip_id' VALUE TRIP_ID,
                            'veh_vin' VALUE VEH_VIN,
                            'pick-up' VALUE
                        JSON_OBJECT(
                            'location_id' VALUE PICKUP_LOCN_ID,
                            'location_name' VALUE(
                                SELECT
                                    LOCN_NAME
                                FROM
                                    NHUY0018.LOCATION
                                WHERE
                                    LOCN_ID = PICKUP_LOCN_ID
                            ),
                            'intended_datetime' VALUE TO_CHAR(TRIP_INT_PICKUPDT, 'DD/MM/YYYY HH24:MI'),
                            'actual_datetime' VALUE TO_CHAR(TRIP_ACT_PICKUPDT, 'DD/MM/YYYY HH24:MI')
                        ),
                            'drop off' VALUE
                        JSON_OBJECT(
                            'location_id' VALUE DROPOFF_LOCN_ID,
                            'location_name' VALUE(
                                SELECT
                                    LOCN_NAME
                                FROM
                                    NHUY0018.LOCATION
                                WHERE
                                    LOCN_ID = DROPOFF_LOCN_ID
                            ),
                            'intended_datetime' VALUE TO_CHAR(TRIP_INT_DROPOFFDT, 'DD/MM/YYYY HH24:MI'),
                            'actual_datetime' VALUE TO_CHAR(TRIP_INT_DROPOFFDT, 'DD/MM/YYYY HH24:MI')
                        )
                )
            )
        FORMAT JSON)
        || ','
FROM
         NHUY0018.DRIVER
    NATURAL JOIN NHUY0018.TRIP
GROUP BY
    DRIVER_ID,
    DRIVER_GIVEN,
    DRIVER_FAMILY,
    DRIVER_LICENCE,
    DRIVER_SUSPENDED
ORDER BY
    DRIVER_ID;