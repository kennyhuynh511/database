// *****PLEASE ENTER YOUR DETAILS BELOW*****
// T6-pat-mongo.mongodb.js

// Student ID: 33326460
// Student Name: Nguyen Khang Huynh

//Comments for your marker: I use insertMany, find, update for this task

// ===================================================================================
// Do not add new comments to this playground
// OR modify or remove any of the comments below (items marked with //)
// ===================================================================================

// Use (connect to) your database - you MUST update xyz001
// with your authcate username

use("nhuy0018");

// (b)
// PLEASE PLACE REQUIRED MONGODB COMMAND TO CREATE THE COLLECTION HERE
// YOU MAY PICK ANY COLLECTION NAME
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Drop collection
db.driver_trip.drop();

// Create collection and insert documents
db.getCollectionNames();
db.driver_trip.insertMany([
  {
    "_id": 2001,
    "name": "Pierre Martin",
    "licence_num": "120501123456",
    "no_of_trips": 4,
    "suspended": "N",
    "trips_info": [
      {
        "trip_id": 53,
        "veh_vin": "AAAAAAAAAAAAAAAAC",
        "pick-up": {
          "location_id": 102,
          "location_name": "Bercy Arena",
          "intended_datetime": "21/07/2024 09:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 103,
          "location_name": "Champ de Mars Arena",
          "intended_datetime": "21/07/2024 21:00",
          "actual_datetime": "21/07/2024 21:00"
        }
      },
      {
        "trip_id": 70,
        "veh_vin": "AAAAAAAAAAAAAAAAC",
        "pick-up": {
          "location_id": 107,
          "location_name": "North Paris Arena",
          "intended_datetime": "10/08/2024 09:00",
          "actual_datetime": "10/08/2024 13:00"
        },
        "drop off": {
          "location_id": 101,
          "location_name": "Bordeaux Stadium",
          "intended_datetime": "12/08/2024 21:00",
          "actual_datetime": "12/08/2024 21:00"
        }
      },
      {
        "trip_id": 63,
        "veh_vin": "AAAAAAAAAAAAAAAAC",
        "pick-up": {
          "location_id": 104,
          "location_name": "Eiffel Tower Stadium",
          "intended_datetime": "06/08/2024 09:00",
          "actual_datetime": "06/08/2024 13:00"
        },
        "drop off": {
          "location_id": 107,
          "location_name": "North Paris Arena",
          "intended_datetime": "07/08/2024 21:00",
          "actual_datetime": "07/08/2024 21:00"
        }
      },
      {
        "trip_id": 58,
        "veh_vin": "AAAAAAAAAAAAAAAAC",
        "pick-up": {
          "location_id": 103,
          "location_name": "Champ de Mars Arena",
          "intended_datetime": "23/07/2024 09:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 104,
          "location_name": "Eiffel Tower Stadium",
          "intended_datetime": "24/07/2024 21:00",
          "actual_datetime": "24/07/2024 21:00"
        }
      }
    ]
  },
  {
    "_id": 2002,
    "name": "Marie Dupont",
    "licence_num": "34082A789012",
    "no_of_trips": 4,
    "suspended": "Y",
    "trips_info": [
      {
        "trip_id": 51,
        "veh_vin": "AAAAAAAAAAAAAAAAA",
        "pick-up": {
          "location_id": 101,
          "location_name": "Bordeaux Stadium",
          "intended_datetime": "21/07/2024 09:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 102,
          "location_name": "Bercy Arena",
          "intended_datetime": "22/07/2024 21:00",
          "actual_datetime": "22/07/2024 21:00"
        }
      },
      {
        "trip_id": 101,
        "veh_vin": "AAAAAAAAAAAAAAAAA",
        "pick-up": {
          "location_id": 101,
          "location_name": "Bordeaux Stadium",
          "intended_datetime": "11/11/2024 09:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 102,
          "location_name": "Bercy Arena",
          "intended_datetime": "12/11/2024 09:00",
          "actual_datetime": "12/11/2024 09:00"
        }
      },
      {
        "trip_id": 61,
        "veh_vin": "AAAAAAAAAAAAAAAAA",
        "pick-up": {
          "location_id": 103,
          "location_name": "Champ de Mars Arena",
          "intended_datetime": "01/08/2024 09:00",
          "actual_datetime": "01/08/2024 12:00"
        },
        "drop off": {
          "location_id": 106,
          "location_name": "La Beaujoire Stadium",
          "intended_datetime": "03/08/2024 22:00",
          "actual_datetime": "03/08/2024 22:00"
        }
      },
      {
        "trip_id": 56,
        "veh_vin": "AAAAAAAAAAAAAAAAA",
        "pick-up": {
          "location_id": 102,
          "location_name": "Bercy Arena",
          "intended_datetime": "23/07/2024 09:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 103,
          "location_name": "Champ de Mars Arena",
          "intended_datetime": "26/07/2024 22:00",
          "actual_datetime": "26/07/2024 22:00"
        }
      }
    ]
  },
  {
    "_id": 2003,
    "name": "Louis Dubois",
    "licence_num": "45112B654321",
    "no_of_trips": 3,
    "suspended": "N",
    "trips_info": [
      {
        "trip_id": 55,
        "veh_vin": "AAAAAAAAAAAAAAAAE",
        "pick-up": {
          "location_id": 101,
          "location_name": "Bordeaux Stadium",
          "intended_datetime": "21/07/2024 09:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 103,
          "location_name": "Champ de Mars Arena",
          "intended_datetime": "23/07/2024 19:00",
          "actual_datetime": "23/07/2024 19:00"
        }
      },
      {
        "trip_id": 65,
        "veh_vin": "AAAAAAAAAAAAAAAAE",
        "pick-up": {
          "location_id": 106,
          "location_name": "La Beaujoire Stadium",
          "intended_datetime": "02/08/2024 09:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 109,
          "location_name": "Paris La Defense Arena",
          "intended_datetime": "07/08/2024 19:00",
          "actual_datetime": "07/08/2024 19:00"
        }
      },
      {
        "trip_id": 60,
        "veh_vin": "AAAAAAAAAAAAAAAAE",
        "pick-up": {
          "location_id": 103,
          "location_name": "Champ de Mars Arena",
          "intended_datetime": "24/07/2024 09:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 106,
          "location_name": "La Beaujoire Stadium",
          "intended_datetime": "25/07/2024 19:00",
          "actual_datetime": "25/07/2024 19:00"
        }
      }
    ]
  },
  {
    "_id": 2004,
    "name": "Antoine Lefevre",
    "licence_num": "670495098765",
    "no_of_trips": 1,
    "suspended": "N",
    "trips_info": [
      {
        "trip_id": 71,
        "veh_vin": "AAAAAAAAAAAAAAAAI",
        "pick-up": {
          "location_id": 115,
          "location_name": "Eiffel Tower",
          "intended_datetime": "12/08/2024 09:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 117,
          "location_name": "Tuileries Garden",
          "intended_datetime": "13/08/2024 10:00",
          "actual_datetime": "13/08/2024 10:00"
        }
      }
    ]
  },
  {
    "_id": 2010,
    "name": "Naoki Fujimoto",
    "licence_num": "110685765432",
    "no_of_trips": 4,
    "suspended": "N",
    "trips_info": [
      {
        "trip_id": 52,
        "veh_vin": "AAAAAAAAAAAAAAAAB",
        "pick-up": {
          "location_id": 101,
          "location_name": "Bordeaux Stadium",
          "intended_datetime": "21/07/2024 09:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 102,
          "location_name": "Bercy Arena",
          "intended_datetime": "22/07/2024 21:00",
          "actual_datetime": "22/07/2024 21:00"
        }
      },
      {
        "trip_id": 69,
        "veh_vin": "AAAAAAAAAAAAAAAAB",
        "pick-up": {
          "location_id": 108,
          "location_name": "Parc des Princes",
          "intended_datetime": "11/08/2024 09:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 101,
          "location_name": "Bordeaux Stadium",
          "intended_datetime": "14/08/2024 21:00",
          "actual_datetime": "14/08/2024 21:00"
        }
      },
      {
        "trip_id": 62,
        "veh_vin": "AAAAAAAAAAAAAAAAB",
        "pick-up": {
          "location_id": 104,
          "location_name": "Eiffel Tower Stadium",
          "intended_datetime": "02/08/2024 09:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 108,
          "location_name": "Parc des Princes",
          "intended_datetime": "04/08/2024 21:00",
          "actual_datetime": "04/08/2024 21:00"
        }
      },
      {
        "trip_id": 57,
        "veh_vin": "AAAAAAAAAAAAAAAAB",
        "pick-up": {
          "location_id": 102,
          "location_name": "Bercy Arena",
          "intended_datetime": "23/07/2024 09:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 104,
          "location_name": "Eiffel Tower Stadium",
          "intended_datetime": "23/07/2024 21:00",
          "actual_datetime": "23/07/2024 21:00"
        }
      }
    ]
  },
  {
    "_id": 2013,
    "name": "Lei Xiong",
    "licence_num": "441270890123",
    "no_of_trips": 4,
    "suspended": "N",
    "trips_info": [
      {
        "trip_id": 54,
        "veh_vin": "AAAAAAAAAAAAAAAAD",
        "pick-up": {
          "location_id": 102,
          "location_name": "Bercy Arena",
          "intended_datetime": "21/07/2024 09:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 103,
          "location_name": "Champ de Mars Arena",
          "intended_datetime": "21/07/2024 21:00",
          "actual_datetime": "21/07/2024 21:00"
        }
      },
      {
        "trip_id": 67,
        "veh_vin": "AAAAAAAAAAAAAAAAD",
        "pick-up": {
          "location_id": 109,
          "location_name": "Paris La Defense Arena",
          "intended_datetime": "09/08/2024 09:00",
          "actual_datetime": "09/08/2024 10:00"
        },
        "drop off": {
          "location_id": 101,
          "location_name": "Bordeaux Stadium",
          "intended_datetime": "09/08/2024 15:00",
          "actual_datetime": "09/08/2024 15:00"
        }
      },
      {
        "trip_id": 64,
        "veh_vin": "AAAAAAAAAAAAAAAAD",
        "pick-up": {
          "location_id": 105,
          "location_name": "South Paris Arena",
          "intended_datetime": "06/08/2024 09:00",
          "actual_datetime": "06/08/2024 13:00"
        },
        "drop off": {
          "location_id": 109,
          "location_name": "Paris La Defense Arena",
          "intended_datetime": "07/08/2024 21:00",
          "actual_datetime": "07/08/2024 21:00"
        }
      },
      {
        "trip_id": 59,
        "veh_vin": "AAAAAAAAAAAAAAAAD",
        "pick-up": {
          "location_id": 103,
          "location_name": "Champ de Mars Arena",
          "intended_datetime": "24/07/2024 09:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 105,
          "location_name": "South Paris Arena",
          "intended_datetime": "25/07/2024 21:00",
          "actual_datetime": "25/07/2024 21:00"
        }
      }
    ]
  },
  {
    "_id": 2014,
    "name": "Claire Robert",
    "licence_num": "55052a543210",
    "no_of_trips": 2,
    "suspended": "N",
    "trips_info": [
      {
        "trip_id": 100,
        "veh_vin": "1C4SDHCT9FC614231",
        "pick-up": {
          "location_id": 113,
          "location_name": "Olympic and Paralympic village",
          "intended_datetime": "30/07/2024 12:30",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 111,
          "location_name": "Porte de La Chapelle Arena",
          "intended_datetime": "30/07/2024 14:00",
          "actual_datetime": "30/07/2024 14:00"
        }
      },
      {
        "trip_id": 110,
        "veh_vin": "1C4SDHCT9FC614231",
        "pick-up": {
          "location_id": 111,
          "location_name": "Porte de La Chapelle Arena",
          "intended_datetime": "30/07/2024 08:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 113,
          "location_name": "Olympic and Paralympic village",
          "intended_datetime": "30/07/2024 09:15",
          "actual_datetime": "30/07/2024 09:15"
        }
      }
    ]
  },
  {
    "_id": 2015,
    "name": "Nathalie Renaud",
    "licence_num": "660725432109",
    "no_of_trips": 1,
    "suspended": "N",
    "trips_info": [
      {
        "trip_id": 66,
        "veh_vin": "AAAAAAAAAAAAAAAAF",
        "pick-up": {
          "location_id": 109,
          "location_name": "Paris La Defense Arena",
          "intended_datetime": "09/08/2024 09:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 101,
          "location_name": "Bordeaux Stadium",
          "intended_datetime": "09/08/2024 15:00",
          "actual_datetime": "09/08/2024 15:00"
        }
      }
    ]
  }
]);
// List all documents you added
db.driver_trip.find({});

// (c)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer
db.driver_trip.find(
  {
    "$or": [
      {
        "trips_info.drop off.location_name": { "$eq": "Champions Park" }
      },
      {
        "trips_info.drop off.location_name": {
          "$eq": "Porte de La Chapelle Arena"
        }
      }
    ]
  },
  { "_id": 0, "name": 1, "licence_num": 1 }
);

// (d)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Show document before the new trip is added and the driver is suspended
db.driver_trip.find({ "_id": 2004 });
// Add new trip and set the driver to suspended
db.driver_trip.updateOne(
  { "_id": 2004 },
  {
    "$push": {
      "trips_info": {
        "trip_id": 999,
        "veh_vin": "AAAAAAAAAAAAAAAAH",
        "pick-up": {
          "location_id": 117,
          "location_name": "Tuileries Garden",
          "intended_datetime": "10/08/2024 09:00",
          "actual_datetime": null
        },
        "drop off": {
          "location_id": 118,
          "location_name": "Sainte-Chapelle",
          "intended_datetime": "10/08/2024 12:00",
          "actual_datetime": null
        }
      }
    }
  }
);
// Illustrate/confirm changes made
db.driver_trip.find({ "_id": 2004 });
