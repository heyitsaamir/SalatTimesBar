//
//  SalatTimeData.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/5/23.
//

import Foundation

let JSON = """
{
    "code": 200,
    "status": "OK",
    "data": [
        {
            "timings": {
                "Fajr": "2023-01-01T06:23:00-08:00 (PST)",
                "Sunrise": "2023-01-01T07:56:00-08:00 (PST)",
                "Dhuhr": "2023-01-01T12:12:00-08:00 (PST)",
                "Asr": "2023-01-01T14:12:00-08:00 (PST)",
                "Sunset": "2023-01-01T16:28:00-08:00 (PST)",
                "Maghrib": "2023-01-01T16:28:00-08:00 (PST)",
                "Isha": "2023-01-01T18:02:00-08:00 (PST)",
                "Imsak": "2023-01-01T06:13:00-08:00 (PST)",
                "Midnight": "2023-01-01T00:12:00-08:00 (PST)",
                "Firstthird": "2023-01-01T21:38:00-08:00 (PST)",
                "Lastthird": "2023-01-01T02:47:00-08:00 (PST)"
            },
            "date": {
                "readable": "01 Jan 2023",
                "timestamp": "1672592461",
                "gregorian": {
                    "date": "01-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "01",
                    "weekday": {
                        "en": "Sunday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "08-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "08",
                    "weekday": {
                        "en": "Al Ahad",
                        "ar": "الاحد"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-02T06:23:00-08:00 (PST)",
                "Sunrise": "2023-01-02T07:56:00-08:00 (PST)",
                "Dhuhr": "2023-01-02T12:13:00-08:00 (PST)",
                "Asr": "2023-01-02T14:12:00-08:00 (PST)",
                "Sunset": "2023-01-02T16:29:00-08:00 (PST)",
                "Maghrib": "2023-01-02T16:29:00-08:00 (PST)",
                "Isha": "2023-01-02T18:03:00-08:00 (PST)",
                "Imsak": "2023-01-02T06:13:00-08:00 (PST)",
                "Midnight": "2023-01-02T00:13:00-08:00 (PST)",
                "Firstthird": "2023-01-02T21:38:00-08:00 (PST)",
                "Lastthird": "2023-01-02T02:47:00-08:00 (PST)"
            },
            "date": {
                "readable": "02 Jan 2023",
                "timestamp": "1672678861",
                "gregorian": {
                    "date": "02-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "02",
                    "weekday": {
                        "en": "Monday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "09-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "09",
                    "weekday": {
                        "en": "Al Athnayn",
                        "ar": "الاثنين"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-03T06:23:00-08:00 (PST)",
                "Sunrise": "2023-01-03T07:56:00-08:00 (PST)",
                "Dhuhr": "2023-01-03T12:13:00-08:00 (PST)",
                "Asr": "2023-01-03T14:13:00-08:00 (PST)",
                "Sunset": "2023-01-03T16:30:00-08:00 (PST)",
                "Maghrib": "2023-01-03T16:30:00-08:00 (PST)",
                "Isha": "2023-01-03T18:04:00-08:00 (PST)",
                "Imsak": "2023-01-03T06:13:00-08:00 (PST)",
                "Midnight": "2023-01-03T00:13:00-08:00 (PST)",
                "Firstthird": "2023-01-03T21:39:00-08:00 (PST)",
                "Lastthird": "2023-01-03T02:48:00-08:00 (PST)"
            },
            "date": {
                "readable": "03 Jan 2023",
                "timestamp": "1672765261",
                "gregorian": {
                    "date": "03-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "03",
                    "weekday": {
                        "en": "Tuesday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "10-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "10",
                    "weekday": {
                        "en": "Al Thalaata",
                        "ar": "الثلاثاء"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-04T06:23:00-08:00 (PST)",
                "Sunrise": "2023-01-04T07:56:00-08:00 (PST)",
                "Dhuhr": "2023-01-04T12:14:00-08:00 (PST)",
                "Asr": "2023-01-04T14:14:00-08:00 (PST)",
                "Sunset": "2023-01-04T16:31:00-08:00 (PST)",
                "Maghrib": "2023-01-04T16:31:00-08:00 (PST)",
                "Isha": "2023-01-04T18:04:00-08:00 (PST)",
                "Imsak": "2023-01-04T06:13:00-08:00 (PST)",
                "Midnight": "2023-01-04T00:14:00-08:00 (PST)",
                "Firstthird": "2023-01-04T21:40:00-08:00 (PST)",
                "Lastthird": "2023-01-04T02:48:00-08:00 (PST)"
            },
            "date": {
                "readable": "04 Jan 2023",
                "timestamp": "1672851661",
                "gregorian": {
                    "date": "04-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "04",
                    "weekday": {
                        "en": "Wednesday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "11-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "11",
                    "weekday": {
                        "en": "Al Arba'a",
                        "ar": "الاربعاء"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-05T06:23:00-08:00 (PST)",
                "Sunrise": "2023-01-05T07:56:00-08:00 (PST)",
                "Dhuhr": "2023-01-05T12:14:00-08:00 (PST)",
                "Asr": "2023-01-05T14:15:00-08:00 (PST)",
                "Sunset": "2023-01-05T16:32:00-08:00 (PST)",
                "Maghrib": "2023-01-05T16:32:00-08:00 (PST)",
                "Isha": "2023-01-05T18:05:00-08:00 (PST)",
                "Imsak": "2023-01-05T06:13:00-08:00 (PST)",
                "Midnight": "2023-01-05T00:14:00-08:00 (PST)",
                "Firstthird": "2023-01-05T21:40:00-08:00 (PST)",
                "Lastthird": "2023-01-05T02:48:00-08:00 (PST)"
            },
            "date": {
                "readable": "05 Jan 2023",
                "timestamp": "1672938061",
                "gregorian": {
                    "date": "05-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "05",
                    "weekday": {
                        "en": "Thursday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "12-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "12",
                    "weekday": {
                        "en": "Al Khamees",
                        "ar": "الخميس"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-06T06:23:00-08:00 (PST)",
                "Sunrise": "2023-01-06T07:56:00-08:00 (PST)",
                "Dhuhr": "2023-01-06T12:14:00-08:00 (PST)",
                "Asr": "2023-01-06T14:16:00-08:00 (PST)",
                "Sunset": "2023-01-06T16:34:00-08:00 (PST)",
                "Maghrib": "2023-01-06T16:34:00-08:00 (PST)",
                "Isha": "2023-01-06T18:06:00-08:00 (PST)",
                "Imsak": "2023-01-06T06:13:00-08:00 (PST)",
                "Midnight": "2023-01-06T00:15:00-08:00 (PST)",
                "Firstthird": "2023-01-06T21:41:00-08:00 (PST)",
                "Lastthird": "2023-01-06T02:48:00-08:00 (PST)"
            },
            "date": {
                "readable": "06 Jan 2023",
                "timestamp": "1673024461",
                "gregorian": {
                    "date": "06-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "06",
                    "weekday": {
                        "en": "Friday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "13-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "13",
                    "weekday": {
                        "en": "Al Juma'a",
                        "ar": "الجمعة"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-07T06:23:00-08:00 (PST)",
                "Sunrise": "2023-01-07T07:56:00-08:00 (PST)",
                "Dhuhr": "2023-01-07T12:15:00-08:00 (PST)",
                "Asr": "2023-01-07T14:17:00-08:00 (PST)",
                "Sunset": "2023-01-07T16:35:00-08:00 (PST)",
                "Maghrib": "2023-01-07T16:35:00-08:00 (PST)",
                "Isha": "2023-01-07T18:07:00-08:00 (PST)",
                "Imsak": "2023-01-07T06:13:00-08:00 (PST)",
                "Midnight": "2023-01-07T00:15:00-08:00 (PST)",
                "Firstthird": "2023-01-07T21:42:00-08:00 (PST)",
                "Lastthird": "2023-01-07T02:49:00-08:00 (PST)"
            },
            "date": {
                "readable": "07 Jan 2023",
                "timestamp": "1673110861",
                "gregorian": {
                    "date": "07-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "07",
                    "weekday": {
                        "en": "Saturday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "14-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "14",
                    "weekday": {
                        "en": "Al Sabt",
                        "ar": "السبت"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-08T06:23:00-08:00 (PST)",
                "Sunrise": "2023-01-08T07:55:00-08:00 (PST)",
                "Dhuhr": "2023-01-08T12:15:00-08:00 (PST)",
                "Asr": "2023-01-08T14:18:00-08:00 (PST)",
                "Sunset": "2023-01-08T16:36:00-08:00 (PST)",
                "Maghrib": "2023-01-08T16:36:00-08:00 (PST)",
                "Isha": "2023-01-08T18:08:00-08:00 (PST)",
                "Imsak": "2023-01-08T06:13:00-08:00 (PST)",
                "Midnight": "2023-01-08T00:16:00-08:00 (PST)",
                "Firstthird": "2023-01-08T21:42:00-08:00 (PST)",
                "Lastthird": "2023-01-08T02:49:00-08:00 (PST)"
            },
            "date": {
                "readable": "08 Jan 2023",
                "timestamp": "1673197261",
                "gregorian": {
                    "date": "08-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "08",
                    "weekday": {
                        "en": "Sunday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "15-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "15",
                    "weekday": {
                        "en": "Al Ahad",
                        "ar": "الاحد"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-09T06:22:00-08:00 (PST)",
                "Sunrise": "2023-01-09T07:55:00-08:00 (PST)",
                "Dhuhr": "2023-01-09T12:16:00-08:00 (PST)",
                "Asr": "2023-01-09T14:19:00-08:00 (PST)",
                "Sunset": "2023-01-09T16:37:00-08:00 (PST)",
                "Maghrib": "2023-01-09T16:37:00-08:00 (PST)",
                "Isha": "2023-01-09T18:09:00-08:00 (PST)",
                "Imsak": "2023-01-09T06:12:00-08:00 (PST)",
                "Midnight": "2023-01-09T00:16:00-08:00 (PST)",
                "Firstthird": "2023-01-09T21:43:00-08:00 (PST)",
                "Lastthird": "2023-01-09T02:49:00-08:00 (PST)"
            },
            "date": {
                "readable": "09 Jan 2023",
                "timestamp": "1673283661",
                "gregorian": {
                    "date": "09-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "09",
                    "weekday": {
                        "en": "Monday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "16-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "16",
                    "weekday": {
                        "en": "Al Athnayn",
                        "ar": "الاثنين"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-10T06:22:00-08:00 (PST)",
                "Sunrise": "2023-01-10T07:54:00-08:00 (PST)",
                "Dhuhr": "2023-01-10T12:16:00-08:00 (PST)",
                "Asr": "2023-01-10T14:20:00-08:00 (PST)",
                "Sunset": "2023-01-10T16:38:00-08:00 (PST)",
                "Maghrib": "2023-01-10T16:38:00-08:00 (PST)",
                "Isha": "2023-01-10T18:11:00-08:00 (PST)",
                "Imsak": "2023-01-10T06:12:00-08:00 (PST)",
                "Midnight": "2023-01-10T00:16:00-08:00 (PST)",
                "Firstthird": "2023-01-10T21:44:00-08:00 (PST)",
                "Lastthird": "2023-01-10T02:49:00-08:00 (PST)"
            },
            "date": {
                "readable": "10 Jan 2023",
                "timestamp": "1673370061",
                "gregorian": {
                    "date": "10-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "10",
                    "weekday": {
                        "en": "Tuesday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "17-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "17",
                    "weekday": {
                        "en": "Al Thalaata",
                        "ar": "الثلاثاء"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-11T06:22:00-08:00 (PST)",
                "Sunrise": "2023-01-11T07:54:00-08:00 (PST)",
                "Dhuhr": "2023-01-11T12:17:00-08:00 (PST)",
                "Asr": "2023-01-11T14:21:00-08:00 (PST)",
                "Sunset": "2023-01-11T16:40:00-08:00 (PST)",
                "Maghrib": "2023-01-11T16:40:00-08:00 (PST)",
                "Isha": "2023-01-11T18:12:00-08:00 (PST)",
                "Imsak": "2023-01-11T06:12:00-08:00 (PST)",
                "Midnight": "2023-01-11T00:17:00-08:00 (PST)",
                "Firstthird": "2023-01-11T21:44:00-08:00 (PST)",
                "Lastthird": "2023-01-11T02:49:00-08:00 (PST)"
            },
            "date": {
                "readable": "11 Jan 2023",
                "timestamp": "1673456461",
                "gregorian": {
                    "date": "11-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "11",
                    "weekday": {
                        "en": "Wednesday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "18-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "18",
                    "weekday": {
                        "en": "Al Arba'a",
                        "ar": "الاربعاء"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-12T06:22:00-08:00 (PST)",
                "Sunrise": "2023-01-12T07:53:00-08:00 (PST)",
                "Dhuhr": "2023-01-12T12:17:00-08:00 (PST)",
                "Asr": "2023-01-12T14:22:00-08:00 (PST)",
                "Sunset": "2023-01-12T16:41:00-08:00 (PST)",
                "Maghrib": "2023-01-12T16:41:00-08:00 (PST)",
                "Isha": "2023-01-12T18:13:00-08:00 (PST)",
                "Imsak": "2023-01-12T06:12:00-08:00 (PST)",
                "Midnight": "2023-01-12T00:17:00-08:00 (PST)",
                "Firstthird": "2023-01-12T21:45:00-08:00 (PST)",
                "Lastthird": "2023-01-12T02:49:00-08:00 (PST)"
            },
            "date": {
                "readable": "12 Jan 2023",
                "timestamp": "1673542861",
                "gregorian": {
                    "date": "12-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "12",
                    "weekday": {
                        "en": "Thursday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "19-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "19",
                    "weekday": {
                        "en": "Al Khamees",
                        "ar": "الخميس"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-13T06:21:00-08:00 (PST)",
                "Sunrise": "2023-01-13T07:53:00-08:00 (PST)",
                "Dhuhr": "2023-01-13T12:17:00-08:00 (PST)",
                "Asr": "2023-01-13T14:23:00-08:00 (PST)",
                "Sunset": "2023-01-13T16:42:00-08:00 (PST)",
                "Maghrib": "2023-01-13T16:42:00-08:00 (PST)",
                "Isha": "2023-01-13T18:14:00-08:00 (PST)",
                "Imsak": "2023-01-13T06:11:00-08:00 (PST)",
                "Midnight": "2023-01-13T00:18:00-08:00 (PST)",
                "Firstthird": "2023-01-13T21:46:00-08:00 (PST)",
                "Lastthird": "2023-01-13T02:49:00-08:00 (PST)"
            },
            "date": {
                "readable": "13 Jan 2023",
                "timestamp": "1673629261",
                "gregorian": {
                    "date": "13-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "13",
                    "weekday": {
                        "en": "Friday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "20-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "20",
                    "weekday": {
                        "en": "Al Juma'a",
                        "ar": "الجمعة"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-14T06:21:00-08:00 (PST)",
                "Sunrise": "2023-01-14T07:52:00-08:00 (PST)",
                "Dhuhr": "2023-01-14T12:18:00-08:00 (PST)",
                "Asr": "2023-01-14T14:24:00-08:00 (PST)",
                "Sunset": "2023-01-14T16:43:00-08:00 (PST)",
                "Maghrib": "2023-01-14T16:43:00-08:00 (PST)",
                "Isha": "2023-01-14T18:15:00-08:00 (PST)",
                "Imsak": "2023-01-14T06:11:00-08:00 (PST)",
                "Midnight": "2023-01-14T00:18:00-08:00 (PST)",
                "Firstthird": "2023-01-14T21:46:00-08:00 (PST)",
                "Lastthird": "2023-01-14T02:49:00-08:00 (PST)"
            },
            "date": {
                "readable": "14 Jan 2023",
                "timestamp": "1673715661",
                "gregorian": {
                    "date": "14-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "14",
                    "weekday": {
                        "en": "Saturday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "21-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "21",
                    "weekday": {
                        "en": "Al Sabt",
                        "ar": "السبت"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-15T06:20:00-08:00 (PST)",
                "Sunrise": "2023-01-15T07:52:00-08:00 (PST)",
                "Dhuhr": "2023-01-15T12:18:00-08:00 (PST)",
                "Asr": "2023-01-15T14:25:00-08:00 (PST)",
                "Sunset": "2023-01-15T16:45:00-08:00 (PST)",
                "Maghrib": "2023-01-15T16:45:00-08:00 (PST)",
                "Isha": "2023-01-15T18:16:00-08:00 (PST)",
                "Imsak": "2023-01-15T06:10:00-08:00 (PST)",
                "Midnight": "2023-01-15T00:18:00-08:00 (PST)",
                "Firstthird": "2023-01-15T21:47:00-08:00 (PST)",
                "Lastthird": "2023-01-15T02:49:00-08:00 (PST)"
            },
            "date": {
                "readable": "15 Jan 2023",
                "timestamp": "1673802061",
                "gregorian": {
                    "date": "15-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "15",
                    "weekday": {
                        "en": "Sunday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "22-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "22",
                    "weekday": {
                        "en": "Al Ahad",
                        "ar": "الاحد"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-16T06:20:00-08:00 (PST)",
                "Sunrise": "2023-01-16T07:51:00-08:00 (PST)",
                "Dhuhr": "2023-01-16T12:18:00-08:00 (PST)",
                "Asr": "2023-01-16T14:26:00-08:00 (PST)",
                "Sunset": "2023-01-16T16:46:00-08:00 (PST)",
                "Maghrib": "2023-01-16T16:46:00-08:00 (PST)",
                "Isha": "2023-01-16T18:17:00-08:00 (PST)",
                "Imsak": "2023-01-16T06:10:00-08:00 (PST)",
                "Midnight": "2023-01-16T00:19:00-08:00 (PST)",
                "Firstthird": "2023-01-16T21:48:00-08:00 (PST)",
                "Lastthird": "2023-01-16T02:49:00-08:00 (PST)"
            },
            "date": {
                "readable": "16 Jan 2023",
                "timestamp": "1673888461",
                "gregorian": {
                    "date": "16-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "16",
                    "weekday": {
                        "en": "Monday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "23-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "23",
                    "weekday": {
                        "en": "Al Athnayn",
                        "ar": "الاثنين"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-17T06:19:00-08:00 (PST)",
                "Sunrise": "2023-01-17T07:50:00-08:00 (PST)",
                "Dhuhr": "2023-01-17T12:19:00-08:00 (PST)",
                "Asr": "2023-01-17T14:27:00-08:00 (PST)",
                "Sunset": "2023-01-17T16:48:00-08:00 (PST)",
                "Maghrib": "2023-01-17T16:48:00-08:00 (PST)",
                "Isha": "2023-01-17T18:19:00-08:00 (PST)",
                "Imsak": "2023-01-17T06:09:00-08:00 (PST)",
                "Midnight": "2023-01-17T00:19:00-08:00 (PST)",
                "Firstthird": "2023-01-17T21:49:00-08:00 (PST)",
                "Lastthird": "2023-01-17T02:49:00-08:00 (PST)"
            },
            "date": {
                "readable": "17 Jan 2023",
                "timestamp": "1673974861",
                "gregorian": {
                    "date": "17-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "17",
                    "weekday": {
                        "en": "Tuesday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "24-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "24",
                    "weekday": {
                        "en": "Al Thalaata",
                        "ar": "الثلاثاء"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-18T06:19:00-08:00 (PST)",
                "Sunrise": "2023-01-18T07:50:00-08:00 (PST)",
                "Dhuhr": "2023-01-18T12:19:00-08:00 (PST)",
                "Asr": "2023-01-18T14:29:00-08:00 (PST)",
                "Sunset": "2023-01-18T16:49:00-08:00 (PST)",
                "Maghrib": "2023-01-18T16:49:00-08:00 (PST)",
                "Isha": "2023-01-18T18:20:00-08:00 (PST)",
                "Imsak": "2023-01-18T06:09:00-08:00 (PST)",
                "Midnight": "2023-01-18T00:19:00-08:00 (PST)",
                "Firstthird": "2023-01-18T21:49:00-08:00 (PST)",
                "Lastthird": "2023-01-18T02:49:00-08:00 (PST)"
            },
            "date": {
                "readable": "18 Jan 2023",
                "timestamp": "1674061261",
                "gregorian": {
                    "date": "18-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "18",
                    "weekday": {
                        "en": "Wednesday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "25-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "25",
                    "weekday": {
                        "en": "Al Arba'a",
                        "ar": "الاربعاء"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-19T06:18:00-08:00 (PST)",
                "Sunrise": "2023-01-19T07:49:00-08:00 (PST)",
                "Dhuhr": "2023-01-19T12:19:00-08:00 (PST)",
                "Asr": "2023-01-19T14:30:00-08:00 (PST)",
                "Sunset": "2023-01-19T16:50:00-08:00 (PST)",
                "Maghrib": "2023-01-19T16:50:00-08:00 (PST)",
                "Isha": "2023-01-19T18:21:00-08:00 (PST)",
                "Imsak": "2023-01-19T06:08:00-08:00 (PST)",
                "Midnight": "2023-01-19T00:20:00-08:00 (PST)",
                "Firstthird": "2023-01-19T21:50:00-08:00 (PST)",
                "Lastthird": "2023-01-19T02:49:00-08:00 (PST)"
            },
            "date": {
                "readable": "19 Jan 2023",
                "timestamp": "1674147661",
                "gregorian": {
                    "date": "19-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "19",
                    "weekday": {
                        "en": "Thursday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "26-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "26",
                    "weekday": {
                        "en": "Al Khamees",
                        "ar": "الخميس"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-20T06:18:00-08:00 (PST)",
                "Sunrise": "2023-01-20T07:48:00-08:00 (PST)",
                "Dhuhr": "2023-01-20T12:20:00-08:00 (PST)",
                "Asr": "2023-01-20T14:31:00-08:00 (PST)",
                "Sunset": "2023-01-20T16:52:00-08:00 (PST)",
                "Maghrib": "2023-01-20T16:52:00-08:00 (PST)",
                "Isha": "2023-01-20T18:22:00-08:00 (PST)",
                "Imsak": "2023-01-20T06:08:00-08:00 (PST)",
                "Midnight": "2023-01-20T00:20:00-08:00 (PST)",
                "Firstthird": "2023-01-20T21:51:00-08:00 (PST)",
                "Lastthird": "2023-01-20T02:49:00-08:00 (PST)"
            },
            "date": {
                "readable": "20 Jan 2023",
                "timestamp": "1674234061",
                "gregorian": {
                    "date": "20-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "20",
                    "weekday": {
                        "en": "Friday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "27-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "27",
                    "weekday": {
                        "en": "Al Juma'a",
                        "ar": "الجمعة"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-21T06:17:00-08:00 (PST)",
                "Sunrise": "2023-01-21T07:47:00-08:00 (PST)",
                "Dhuhr": "2023-01-21T12:20:00-08:00 (PST)",
                "Asr": "2023-01-21T14:32:00-08:00 (PST)",
                "Sunset": "2023-01-21T16:53:00-08:00 (PST)",
                "Maghrib": "2023-01-21T16:53:00-08:00 (PST)",
                "Isha": "2023-01-21T18:23:00-08:00 (PST)",
                "Imsak": "2023-01-21T06:07:00-08:00 (PST)",
                "Midnight": "2023-01-21T00:20:00-08:00 (PST)",
                "Firstthird": "2023-01-21T21:51:00-08:00 (PST)",
                "Lastthird": "2023-01-21T02:49:00-08:00 (PST)"
            },
            "date": {
                "readable": "21 Jan 2023",
                "timestamp": "1674320461",
                "gregorian": {
                    "date": "21-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "21",
                    "weekday": {
                        "en": "Saturday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "28-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "28",
                    "weekday": {
                        "en": "Al Sabt",
                        "ar": "السبت"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-22T06:16:00-08:00 (PST)",
                "Sunrise": "2023-01-22T07:46:00-08:00 (PST)",
                "Dhuhr": "2023-01-22T12:20:00-08:00 (PST)",
                "Asr": "2023-01-22T14:33:00-08:00 (PST)",
                "Sunset": "2023-01-22T16:55:00-08:00 (PST)",
                "Maghrib": "2023-01-22T16:55:00-08:00 (PST)",
                "Isha": "2023-01-22T18:25:00-08:00 (PST)",
                "Imsak": "2023-01-22T06:06:00-08:00 (PST)",
                "Midnight": "2023-01-22T00:20:00-08:00 (PST)",
                "Firstthird": "2023-01-22T21:52:00-08:00 (PST)",
                "Lastthird": "2023-01-22T02:49:00-08:00 (PST)"
            },
            "date": {
                "readable": "22 Jan 2023",
                "timestamp": "1674406861",
                "gregorian": {
                    "date": "22-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "22",
                    "weekday": {
                        "en": "Sunday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "29-06-1444",
                    "format": "DD-MM-YYYY",
                    "day": "29",
                    "weekday": {
                        "en": "Al Ahad",
                        "ar": "الاحد"
                    },
                    "month": {
                        "number": 6,
                        "en": "Jumādá al-ākhirah",
                        "ar": "جُمادى الآخرة"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-23T06:15:00-08:00 (PST)",
                "Sunrise": "2023-01-23T07:45:00-08:00 (PST)",
                "Dhuhr": "2023-01-23T12:20:00-08:00 (PST)",
                "Asr": "2023-01-23T14:35:00-08:00 (PST)",
                "Sunset": "2023-01-23T16:56:00-08:00 (PST)",
                "Maghrib": "2023-01-23T16:56:00-08:00 (PST)",
                "Isha": "2023-01-23T18:26:00-08:00 (PST)",
                "Imsak": "2023-01-23T06:05:00-08:00 (PST)",
                "Midnight": "2023-01-23T00:21:00-08:00 (PST)",
                "Firstthird": "2023-01-23T21:53:00-08:00 (PST)",
                "Lastthird": "2023-01-23T02:49:00-08:00 (PST)"
            },
            "date": {
                "readable": "23 Jan 2023",
                "timestamp": "1674493261",
                "gregorian": {
                    "date": "23-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "23",
                    "weekday": {
                        "en": "Monday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "01-07-1444",
                    "format": "DD-MM-YYYY",
                    "day": "01",
                    "weekday": {
                        "en": "Al Athnayn",
                        "ar": "الاثنين"
                    },
                    "month": {
                        "number": 7,
                        "en": "Rajab",
                        "ar": "رَجَب"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-24T06:15:00-08:00 (PST)",
                "Sunrise": "2023-01-24T07:44:00-08:00 (PST)",
                "Dhuhr": "2023-01-24T12:21:00-08:00 (PST)",
                "Asr": "2023-01-24T14:36:00-08:00 (PST)",
                "Sunset": "2023-01-24T16:58:00-08:00 (PST)",
                "Maghrib": "2023-01-24T16:58:00-08:00 (PST)",
                "Isha": "2023-01-24T18:27:00-08:00 (PST)",
                "Imsak": "2023-01-24T06:05:00-08:00 (PST)",
                "Midnight": "2023-01-24T00:21:00-08:00 (PST)",
                "Firstthird": "2023-01-24T21:53:00-08:00 (PST)",
                "Lastthird": "2023-01-24T02:49:00-08:00 (PST)"
            },
            "date": {
                "readable": "24 Jan 2023",
                "timestamp": "1674579661",
                "gregorian": {
                    "date": "24-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "24",
                    "weekday": {
                        "en": "Tuesday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "02-07-1444",
                    "format": "DD-MM-YYYY",
                    "day": "02",
                    "weekday": {
                        "en": "Al Thalaata",
                        "ar": "الثلاثاء"
                    },
                    "month": {
                        "number": 7,
                        "en": "Rajab",
                        "ar": "رَجَب"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-25T06:14:00-08:00 (PST)",
                "Sunrise": "2023-01-25T07:43:00-08:00 (PST)",
                "Dhuhr": "2023-01-25T12:21:00-08:00 (PST)",
                "Asr": "2023-01-25T14:37:00-08:00 (PST)",
                "Sunset": "2023-01-25T16:59:00-08:00 (PST)",
                "Maghrib": "2023-01-25T16:59:00-08:00 (PST)",
                "Isha": "2023-01-25T18:29:00-08:00 (PST)",
                "Imsak": "2023-01-25T06:04:00-08:00 (PST)",
                "Midnight": "2023-01-25T00:21:00-08:00 (PST)",
                "Firstthird": "2023-01-25T21:54:00-08:00 (PST)",
                "Lastthird": "2023-01-25T02:49:00-08:00 (PST)"
            },
            "date": {
                "readable": "25 Jan 2023",
                "timestamp": "1674666061",
                "gregorian": {
                    "date": "25-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "25",
                    "weekday": {
                        "en": "Wednesday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "03-07-1444",
                    "format": "DD-MM-YYYY",
                    "day": "03",
                    "weekday": {
                        "en": "Al Arba'a",
                        "ar": "الاربعاء"
                    },
                    "month": {
                        "number": 7,
                        "en": "Rajab",
                        "ar": "رَجَب"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-26T06:13:00-08:00 (PST)",
                "Sunrise": "2023-01-26T07:42:00-08:00 (PST)",
                "Dhuhr": "2023-01-26T12:21:00-08:00 (PST)",
                "Asr": "2023-01-26T14:38:00-08:00 (PST)",
                "Sunset": "2023-01-26T17:01:00-08:00 (PST)",
                "Maghrib": "2023-01-26T17:01:00-08:00 (PST)",
                "Isha": "2023-01-26T18:30:00-08:00 (PST)",
                "Imsak": "2023-01-26T06:03:00-08:00 (PST)",
                "Midnight": "2023-01-26T00:21:00-08:00 (PST)",
                "Firstthird": "2023-01-26T21:55:00-08:00 (PST)",
                "Lastthird": "2023-01-26T02:48:00-08:00 (PST)"
            },
            "date": {
                "readable": "26 Jan 2023",
                "timestamp": "1674752461",
                "gregorian": {
                    "date": "26-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "26",
                    "weekday": {
                        "en": "Thursday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "04-07-1444",
                    "format": "DD-MM-YYYY",
                    "day": "04",
                    "weekday": {
                        "en": "Al Khamees",
                        "ar": "الخميس"
                    },
                    "month": {
                        "number": 7,
                        "en": "Rajab",
                        "ar": "رَجَب"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-27T06:12:00-08:00 (PST)",
                "Sunrise": "2023-01-27T07:41:00-08:00 (PST)",
                "Dhuhr": "2023-01-27T12:21:00-08:00 (PST)",
                "Asr": "2023-01-27T14:39:00-08:00 (PST)",
                "Sunset": "2023-01-27T17:02:00-08:00 (PST)",
                "Maghrib": "2023-01-27T17:02:00-08:00 (PST)",
                "Isha": "2023-01-27T18:31:00-08:00 (PST)",
                "Imsak": "2023-01-27T06:02:00-08:00 (PST)",
                "Midnight": "2023-01-27T00:22:00-08:00 (PST)",
                "Firstthird": "2023-01-27T21:55:00-08:00 (PST)",
                "Lastthird": "2023-01-27T02:48:00-08:00 (PST)"
            },
            "date": {
                "readable": "27 Jan 2023",
                "timestamp": "1674838861",
                "gregorian": {
                    "date": "27-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "27",
                    "weekday": {
                        "en": "Friday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "05-07-1444",
                    "format": "DD-MM-YYYY",
                    "day": "05",
                    "weekday": {
                        "en": "Al Juma'a",
                        "ar": "الجمعة"
                    },
                    "month": {
                        "number": 7,
                        "en": "Rajab",
                        "ar": "رَجَب"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-28T06:11:00-08:00 (PST)",
                "Sunrise": "2023-01-28T07:40:00-08:00 (PST)",
                "Dhuhr": "2023-01-28T12:22:00-08:00 (PST)",
                "Asr": "2023-01-28T14:41:00-08:00 (PST)",
                "Sunset": "2023-01-28T17:04:00-08:00 (PST)",
                "Maghrib": "2023-01-28T17:04:00-08:00 (PST)",
                "Isha": "2023-01-28T18:33:00-08:00 (PST)",
                "Imsak": "2023-01-28T06:01:00-08:00 (PST)",
                "Midnight": "2023-01-28T00:22:00-08:00 (PST)",
                "Firstthird": "2023-01-28T21:56:00-08:00 (PST)",
                "Lastthird": "2023-01-28T02:48:00-08:00 (PST)"
            },
            "date": {
                "readable": "28 Jan 2023",
                "timestamp": "1674925261",
                "gregorian": {
                    "date": "28-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "28",
                    "weekday": {
                        "en": "Saturday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "06-07-1444",
                    "format": "DD-MM-YYYY",
                    "day": "06",
                    "weekday": {
                        "en": "Al Sabt",
                        "ar": "السبت"
                    },
                    "month": {
                        "number": 7,
                        "en": "Rajab",
                        "ar": "رَجَب"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-29T06:10:00-08:00 (PST)",
                "Sunrise": "2023-01-29T07:39:00-08:00 (PST)",
                "Dhuhr": "2023-01-29T12:22:00-08:00 (PST)",
                "Asr": "2023-01-29T14:42:00-08:00 (PST)",
                "Sunset": "2023-01-29T17:05:00-08:00 (PST)",
                "Maghrib": "2023-01-29T17:05:00-08:00 (PST)",
                "Isha": "2023-01-29T18:34:00-08:00 (PST)",
                "Imsak": "2023-01-29T06:00:00-08:00 (PST)",
                "Midnight": "2023-01-29T00:22:00-08:00 (PST)",
                "Firstthird": "2023-01-29T21:57:00-08:00 (PST)",
                "Lastthird": "2023-01-29T02:48:00-08:00 (PST)"
            },
            "date": {
                "readable": "29 Jan 2023",
                "timestamp": "1675011661",
                "gregorian": {
                    "date": "29-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "29",
                    "weekday": {
                        "en": "Sunday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "07-07-1444",
                    "format": "DD-MM-YYYY",
                    "day": "07",
                    "weekday": {
                        "en": "Al Ahad",
                        "ar": "الاحد"
                    },
                    "month": {
                        "number": 7,
                        "en": "Rajab",
                        "ar": "رَجَب"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-30T06:09:00-08:00 (PST)",
                "Sunrise": "2023-01-30T07:37:00-08:00 (PST)",
                "Dhuhr": "2023-01-30T12:22:00-08:00 (PST)",
                "Asr": "2023-01-30T14:43:00-08:00 (PST)",
                "Sunset": "2023-01-30T17:07:00-08:00 (PST)",
                "Maghrib": "2023-01-30T17:07:00-08:00 (PST)",
                "Isha": "2023-01-30T18:35:00-08:00 (PST)",
                "Imsak": "2023-01-30T05:59:00-08:00 (PST)",
                "Midnight": "2023-01-30T00:22:00-08:00 (PST)",
                "Firstthird": "2023-01-30T21:57:00-08:00 (PST)",
                "Lastthird": "2023-01-30T02:47:00-08:00 (PST)"
            },
            "date": {
                "readable": "30 Jan 2023",
                "timestamp": "1675098061",
                "gregorian": {
                    "date": "30-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "30",
                    "weekday": {
                        "en": "Monday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "08-07-1444",
                    "format": "DD-MM-YYYY",
                    "day": "08",
                    "weekday": {
                        "en": "Al Athnayn",
                        "ar": "الاثنين"
                    },
                    "month": {
                        "number": 7,
                        "en": "Rajab",
                        "ar": "رَجَب"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        },
        {
            "timings": {
                "Fajr": "2023-01-31T06:08:00-08:00 (PST)",
                "Sunrise": "2023-01-31T07:36:00-08:00 (PST)",
                "Dhuhr": "2023-01-31T12:22:00-08:00 (PST)",
                "Asr": "2023-01-31T14:45:00-08:00 (PST)",
                "Sunset": "2023-01-31T17:09:00-08:00 (PST)",
                "Maghrib": "2023-01-31T17:09:00-08:00 (PST)",
                "Isha": "2023-01-31T18:37:00-08:00 (PST)",
                "Imsak": "2023-01-31T05:58:00-08:00 (PST)",
                "Midnight": "2023-01-31T00:22:00-08:00 (PST)",
                "Firstthird": "2023-01-31T21:58:00-08:00 (PST)",
                "Lastthird": "2023-01-31T02:47:00-08:00 (PST)"
            },
            "date": {
                "readable": "31 Jan 2023",
                "timestamp": "1675184461",
                "gregorian": {
                    "date": "31-01-2023",
                    "format": "DD-MM-YYYY",
                    "day": "31",
                    "weekday": {
                        "en": "Tuesday"
                    },
                    "month": {
                        "number": 1,
                        "en": "January"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "09-07-1444",
                    "format": "DD-MM-YYYY",
                    "day": "09",
                    "weekday": {
                        "en": "Al Thalaata",
                        "ar": "الثلاثاء"
                    },
                    "month": {
                        "number": 7,
                        "en": "Rajab",
                        "ar": "رَجَب"
                    },
                    "year": "1444",
                    "designation": {
                        "abbreviated": "AH",
                        "expanded": "Anno Hegirae"
                    },
                    "holidays": []
                }
            },
            "meta": {
                "latitude": 47.492615,
                "longitude": -122.149167,
                "timezone": "America/Los_Angeles",
                "method": {
                    "id": 2,
                    "name": "Islamic Society of North America (ISNA)",
                    "params": {
                        "Fajr": 15,
                        "Isha": 15
                    },
                    "location": {
                        "latitude": 39.70421229999999,
                        "longitude": -86.39943869999999
                    }
                },
                "latitudeAdjustmentMethod": "ANGLE_BASED",
                "midnightMode": "STANDARD",
                "school": "STANDARD",
                "offset": {
                    "Imsak": 0,
                    "Fajr": 0,
                    "Sunrise": 0,
                    "Dhuhr": 0,
                    "Asr": 0,
                    "Maghrib": 0,
                    "Sunset": 0,
                    "Isha": 0,
                    "Midnight": 0
                }
            }
        }
    ]
}
"""

struct SalatTimesJson: Decodable {
    struct SalatTimeDay: Decodable {
        struct SalatTimeDate: Decodable {
            var readable: String
            var timestamp: String
            
            var date: Date? {
                if let timeIntervalSince1970 = Double(self.timestamp) {
                    return Date(timeIntervalSince1970: timeIntervalSince1970)
                }
                
                return nil
            }
        }
        var timings: [String: String]
        var date: SalatTimeDate
    }
    
    var data:[SalatTimeDay]
}

let jsonData = JSON.data(using: .utf8)

let isoFormatter = ISO8601DateFormatter()

func build() {
    let dataForJanuary: SalatTimesJson = try! JSONDecoder().decode(SalatTimesJson.self, from: jsonData!)
    let results = dataForJanuary.data.flatMap { salatTimeDay in
        return salatTimeDay.timings.compactMap { (key, value) -> SalatTime? in
            if let salatType = SalatType(rawValue: key), let salatTime = isoFormatter.date(from: value) {
                return SalatTime(type: salatType, time: salatTime)
            }
            
            return nil
        }
    }.sorted { a, b in
        a.time.compare(b.time) == .orderedAscending
    }
    
    print(results)
}
