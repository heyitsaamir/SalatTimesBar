//
//  SalatTimeData.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/5/23.
//

import Foundation
import Alamofire

let JSON = """
{
    "code": 200,
    "status": "OK",
    "data": [
        {
            "timings": {
                "Fajr": "2023-08-01T03:58:00-07:00 (PDT)",
                "Sunrise": "2023-08-01T05:46:00-07:00 (PDT)",
                "Dhuhr": "2023-08-01T13:15:00-07:00 (PDT)",
                "Asr": "2023-08-01T17:18:00-07:00 (PDT)",
                "Sunset": "2023-08-01T20:43:00-07:00 (PDT)",
                "Maghrib": "2023-08-01T20:43:00-07:00 (PDT)",
                "Isha": "2023-08-01T22:31:00-07:00 (PDT)",
                "Imsak": "2023-08-01T03:48:00-07:00 (PDT)",
                "Midnight": "2023-08-02T01:15:00-07:00 (PDT)",
                "Firstthird": "2023-08-01T23:44:00-07:00 (PDT)",
                "Lastthird": "2023-08-01T02:45:00-07:00 (PDT)"
            },
            "date": {
                "readable": "01 Aug 2023",
                "timestamp": "1690905661",
                "gregorian": {
                    "date": "01-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "01",
                    "weekday": {
                        "en": "Tuesday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "14-01-1445",
                    "format": "DD-MM-YYYY",
                    "day": "14",
                    "weekday": {
                        "en": "Al Thalaata",
                        "ar": "الثلاثاء"
                    },
                    "month": {
                        "number": 1,
                        "en": "Muḥarram",
                        "ar": "مُحَرَّم"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-02T04:00:00-07:00 (PDT)",
                "Sunrise": "2023-08-02T05:48:00-07:00 (PDT)",
                "Dhuhr": "2023-08-02T13:15:00-07:00 (PDT)",
                "Asr": "2023-08-02T17:18:00-07:00 (PDT)",
                "Sunset": "2023-08-02T20:41:00-07:00 (PDT)",
                "Maghrib": "2023-08-02T20:41:00-07:00 (PDT)",
                "Isha": "2023-08-02T22:28:00-07:00 (PDT)",
                "Imsak": "2023-08-02T03:50:00-07:00 (PDT)",
                "Midnight": "2023-08-03T01:15:00-07:00 (PDT)",
                "Firstthird": "2023-08-02T23:43:00-07:00 (PDT)",
                "Lastthird": "2023-08-02T02:46:00-07:00 (PDT)"
            },
            "date": {
                "readable": "02 Aug 2023",
                "timestamp": "1690992061",
                "gregorian": {
                    "date": "02-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "02",
                    "weekday": {
                        "en": "Wednesday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "15-01-1445",
                    "format": "DD-MM-YYYY",
                    "day": "15",
                    "weekday": {
                        "en": "Al Arba'a",
                        "ar": "الاربعاء"
                    },
                    "month": {
                        "number": 1,
                        "en": "Muḥarram",
                        "ar": "مُحَرَّم"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-03T04:02:00-07:00 (PDT)",
                "Sunrise": "2023-08-03T05:49:00-07:00 (PDT)",
                "Dhuhr": "2023-08-03T13:15:00-07:00 (PDT)",
                "Asr": "2023-08-03T17:17:00-07:00 (PDT)",
                "Sunset": "2023-08-03T20:40:00-07:00 (PDT)",
                "Maghrib": "2023-08-03T20:40:00-07:00 (PDT)",
                "Isha": "2023-08-03T22:26:00-07:00 (PDT)",
                "Imsak": "2023-08-03T03:52:00-07:00 (PDT)",
                "Midnight": "2023-08-04T01:14:00-07:00 (PDT)",
                "Firstthird": "2023-08-03T23:43:00-07:00 (PDT)",
                "Lastthird": "2023-08-03T02:46:00-07:00 (PDT)"
            },
            "date": {
                "readable": "03 Aug 2023",
                "timestamp": "1691078461",
                "gregorian": {
                    "date": "03-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "03",
                    "weekday": {
                        "en": "Thursday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "16-01-1445",
                    "format": "DD-MM-YYYY",
                    "day": "16",
                    "weekday": {
                        "en": "Al Khamees",
                        "ar": "الخميس"
                    },
                    "month": {
                        "number": 1,
                        "en": "Muḥarram",
                        "ar": "مُحَرَّم"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-04T04:04:00-07:00 (PDT)",
                "Sunrise": "2023-08-04T05:50:00-07:00 (PDT)",
                "Dhuhr": "2023-08-04T13:15:00-07:00 (PDT)",
                "Asr": "2023-08-04T17:16:00-07:00 (PDT)",
                "Sunset": "2023-08-04T20:38:00-07:00 (PDT)",
                "Maghrib": "2023-08-04T20:38:00-07:00 (PDT)",
                "Isha": "2023-08-04T22:24:00-07:00 (PDT)",
                "Imsak": "2023-08-04T03:54:00-07:00 (PDT)",
                "Midnight": "2023-08-05T01:14:00-07:00 (PDT)",
                "Firstthird": "2023-08-04T23:42:00-07:00 (PDT)",
                "Lastthird": "2023-08-04T02:46:00-07:00 (PDT)"
            },
            "date": {
                "readable": "04 Aug 2023",
                "timestamp": "1691164861",
                "gregorian": {
                    "date": "04-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "04",
                    "weekday": {
                        "en": "Friday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "17-01-1445",
                    "format": "DD-MM-YYYY",
                    "day": "17",
                    "weekday": {
                        "en": "Al Juma'a",
                        "ar": "الجمعة"
                    },
                    "month": {
                        "number": 1,
                        "en": "Muḥarram",
                        "ar": "مُحَرَّم"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-05T04:06:00-07:00 (PDT)",
                "Sunrise": "2023-08-05T05:52:00-07:00 (PDT)",
                "Dhuhr": "2023-08-05T13:15:00-07:00 (PDT)",
                "Asr": "2023-08-05T17:16:00-07:00 (PDT)",
                "Sunset": "2023-08-05T20:37:00-07:00 (PDT)",
                "Maghrib": "2023-08-05T20:37:00-07:00 (PDT)",
                "Isha": "2023-08-05T22:22:00-07:00 (PDT)",
                "Imsak": "2023-08-05T03:56:00-07:00 (PDT)",
                "Midnight": "2023-08-06T01:14:00-07:00 (PDT)",
                "Firstthird": "2023-08-05T23:42:00-07:00 (PDT)",
                "Lastthird": "2023-08-05T02:47:00-07:00 (PDT)"
            },
            "date": {
                "readable": "05 Aug 2023",
                "timestamp": "1691251261",
                "gregorian": {
                    "date": "05-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "05",
                    "weekday": {
                        "en": "Saturday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "18-01-1445",
                    "format": "DD-MM-YYYY",
                    "day": "18",
                    "weekday": {
                        "en": "Al Sabt",
                        "ar": "السبت"
                    },
                    "month": {
                        "number": 1,
                        "en": "Muḥarram",
                        "ar": "مُحَرَّم"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-06T04:08:00-07:00 (PDT)",
                "Sunrise": "2023-08-06T05:53:00-07:00 (PDT)",
                "Dhuhr": "2023-08-06T13:14:00-07:00 (PDT)",
                "Asr": "2023-08-06T17:15:00-07:00 (PDT)",
                "Sunset": "2023-08-06T20:35:00-07:00 (PDT)",
                "Maghrib": "2023-08-06T20:35:00-07:00 (PDT)",
                "Isha": "2023-08-06T22:20:00-07:00 (PDT)",
                "Imsak": "2023-08-06T03:58:00-07:00 (PDT)",
                "Midnight": "2023-08-07T01:14:00-07:00 (PDT)",
                "Firstthird": "2023-08-06T23:41:00-07:00 (PDT)",
                "Lastthird": "2023-08-06T02:47:00-07:00 (PDT)"
            },
            "date": {
                "readable": "06 Aug 2023",
                "timestamp": "1691337661",
                "gregorian": {
                    "date": "06-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "06",
                    "weekday": {
                        "en": "Sunday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "19-01-1445",
                    "format": "DD-MM-YYYY",
                    "day": "19",
                    "weekday": {
                        "en": "Al Ahad",
                        "ar": "الاحد"
                    },
                    "month": {
                        "number": 1,
                        "en": "Muḥarram",
                        "ar": "مُحَرَّم"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-07T04:10:00-07:00 (PDT)",
                "Sunrise": "2023-08-07T05:54:00-07:00 (PDT)",
                "Dhuhr": "2023-08-07T13:14:00-07:00 (PDT)",
                "Asr": "2023-08-07T17:14:00-07:00 (PDT)",
                "Sunset": "2023-08-07T20:34:00-07:00 (PDT)",
                "Maghrib": "2023-08-07T20:34:00-07:00 (PDT)",
                "Isha": "2023-08-07T22:18:00-07:00 (PDT)",
                "Imsak": "2023-08-07T04:00:00-07:00 (PDT)",
                "Midnight": "2023-08-08T01:14:00-07:00 (PDT)",
                "Firstthird": "2023-08-07T23:41:00-07:00 (PDT)",
                "Lastthird": "2023-08-07T02:47:00-07:00 (PDT)"
            },
            "date": {
                "readable": "07 Aug 2023",
                "timestamp": "1691424061",
                "gregorian": {
                    "date": "07-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "07",
                    "weekday": {
                        "en": "Monday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "20-01-1445",
                    "format": "DD-MM-YYYY",
                    "day": "20",
                    "weekday": {
                        "en": "Al Athnayn",
                        "ar": "الاثنين"
                    },
                    "month": {
                        "number": 1,
                        "en": "Muḥarram",
                        "ar": "مُحَرَّم"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-08T04:12:00-07:00 (PDT)",
                "Sunrise": "2023-08-08T05:55:00-07:00 (PDT)",
                "Dhuhr": "2023-08-08T13:14:00-07:00 (PDT)",
                "Asr": "2023-08-08T17:14:00-07:00 (PDT)",
                "Sunset": "2023-08-08T20:32:00-07:00 (PDT)",
                "Maghrib": "2023-08-08T20:32:00-07:00 (PDT)",
                "Isha": "2023-08-08T22:15:00-07:00 (PDT)",
                "Imsak": "2023-08-08T04:02:00-07:00 (PDT)",
                "Midnight": "2023-08-09T01:14:00-07:00 (PDT)",
                "Firstthird": "2023-08-08T23:40:00-07:00 (PDT)",
                "Lastthird": "2023-08-08T02:48:00-07:00 (PDT)"
            },
            "date": {
                "readable": "08 Aug 2023",
                "timestamp": "1691510461",
                "gregorian": {
                    "date": "08-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "08",
                    "weekday": {
                        "en": "Tuesday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "21-01-1445",
                    "format": "DD-MM-YYYY",
                    "day": "21",
                    "weekday": {
                        "en": "Al Thalaata",
                        "ar": "الثلاثاء"
                    },
                    "month": {
                        "number": 1,
                        "en": "Muḥarram",
                        "ar": "مُحَرَّم"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-09T04:14:00-07:00 (PDT)",
                "Sunrise": "2023-08-09T05:57:00-07:00 (PDT)",
                "Dhuhr": "2023-08-09T13:14:00-07:00 (PDT)",
                "Asr": "2023-08-09T17:13:00-07:00 (PDT)",
                "Sunset": "2023-08-09T20:31:00-07:00 (PDT)",
                "Maghrib": "2023-08-09T20:31:00-07:00 (PDT)",
                "Isha": "2023-08-09T22:13:00-07:00 (PDT)",
                "Imsak": "2023-08-09T04:04:00-07:00 (PDT)",
                "Midnight": "2023-08-10T01:14:00-07:00 (PDT)",
                "Firstthird": "2023-08-09T23:39:00-07:00 (PDT)",
                "Lastthird": "2023-08-09T02:48:00-07:00 (PDT)"
            },
            "date": {
                "readable": "09 Aug 2023",
                "timestamp": "1691596861",
                "gregorian": {
                    "date": "09-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "09",
                    "weekday": {
                        "en": "Wednesday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "22-01-1445",
                    "format": "DD-MM-YYYY",
                    "day": "22",
                    "weekday": {
                        "en": "Al Arba'a",
                        "ar": "الاربعاء"
                    },
                    "month": {
                        "number": 1,
                        "en": "Muḥarram",
                        "ar": "مُحَرَّم"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-10T04:16:00-07:00 (PDT)",
                "Sunrise": "2023-08-10T05:58:00-07:00 (PDT)",
                "Dhuhr": "2023-08-10T13:14:00-07:00 (PDT)",
                "Asr": "2023-08-10T17:12:00-07:00 (PDT)",
                "Sunset": "2023-08-10T20:29:00-07:00 (PDT)",
                "Maghrib": "2023-08-10T20:29:00-07:00 (PDT)",
                "Isha": "2023-08-10T22:11:00-07:00 (PDT)",
                "Imsak": "2023-08-10T04:06:00-07:00 (PDT)",
                "Midnight": "2023-08-11T01:14:00-07:00 (PDT)",
                "Firstthird": "2023-08-10T23:39:00-07:00 (PDT)",
                "Lastthird": "2023-08-10T02:48:00-07:00 (PDT)"
            },
            "date": {
                "readable": "10 Aug 2023",
                "timestamp": "1691683261",
                "gregorian": {
                    "date": "10-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "10",
                    "weekday": {
                        "en": "Thursday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "23-01-1445",
                    "format": "DD-MM-YYYY",
                    "day": "23",
                    "weekday": {
                        "en": "Al Khamees",
                        "ar": "الخميس"
                    },
                    "month": {
                        "number": 1,
                        "en": "Muḥarram",
                        "ar": "مُحَرَّم"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-11T04:18:00-07:00 (PDT)",
                "Sunrise": "2023-08-11T05:59:00-07:00 (PDT)",
                "Dhuhr": "2023-08-11T13:14:00-07:00 (PDT)",
                "Asr": "2023-08-11T17:12:00-07:00 (PDT)",
                "Sunset": "2023-08-11T20:28:00-07:00 (PDT)",
                "Maghrib": "2023-08-11T20:28:00-07:00 (PDT)",
                "Isha": "2023-08-11T22:08:00-07:00 (PDT)",
                "Imsak": "2023-08-11T04:08:00-07:00 (PDT)",
                "Midnight": "2023-08-12T01:13:00-07:00 (PDT)",
                "Firstthird": "2023-08-11T23:38:00-07:00 (PDT)",
                "Lastthird": "2023-08-11T02:49:00-07:00 (PDT)"
            },
            "date": {
                "readable": "11 Aug 2023",
                "timestamp": "1691769661",
                "gregorian": {
                    "date": "11-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "11",
                    "weekday": {
                        "en": "Friday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "24-01-1445",
                    "format": "DD-MM-YYYY",
                    "day": "24",
                    "weekday": {
                        "en": "Al Juma'a",
                        "ar": "الجمعة"
                    },
                    "month": {
                        "number": 1,
                        "en": "Muḥarram",
                        "ar": "مُحَرَّم"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-12T04:20:00-07:00 (PDT)",
                "Sunrise": "2023-08-12T06:01:00-07:00 (PDT)",
                "Dhuhr": "2023-08-12T13:14:00-07:00 (PDT)",
                "Asr": "2023-08-12T17:11:00-07:00 (PDT)",
                "Sunset": "2023-08-12T20:26:00-07:00 (PDT)",
                "Maghrib": "2023-08-12T20:26:00-07:00 (PDT)",
                "Isha": "2023-08-12T22:06:00-07:00 (PDT)",
                "Imsak": "2023-08-12T04:10:00-07:00 (PDT)",
                "Midnight": "2023-08-13T01:13:00-07:00 (PDT)",
                "Firstthird": "2023-08-12T23:37:00-07:00 (PDT)",
                "Lastthird": "2023-08-12T02:49:00-07:00 (PDT)"
            },
            "date": {
                "readable": "12 Aug 2023",
                "timestamp": "1691856061",
                "gregorian": {
                    "date": "12-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "12",
                    "weekday": {
                        "en": "Saturday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "25-01-1445",
                    "format": "DD-MM-YYYY",
                    "day": "25",
                    "weekday": {
                        "en": "Al Sabt",
                        "ar": "السبت"
                    },
                    "month": {
                        "number": 1,
                        "en": "Muḥarram",
                        "ar": "مُحَرَّم"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-13T04:22:00-07:00 (PDT)",
                "Sunrise": "2023-08-13T06:02:00-07:00 (PDT)",
                "Dhuhr": "2023-08-13T13:13:00-07:00 (PDT)",
                "Asr": "2023-08-13T17:10:00-07:00 (PDT)",
                "Sunset": "2023-08-13T20:24:00-07:00 (PDT)",
                "Maghrib": "2023-08-13T20:24:00-07:00 (PDT)",
                "Isha": "2023-08-13T22:04:00-07:00 (PDT)",
                "Imsak": "2023-08-13T04:12:00-07:00 (PDT)",
                "Midnight": "2023-08-14T01:13:00-07:00 (PDT)",
                "Firstthird": "2023-08-13T23:37:00-07:00 (PDT)",
                "Lastthird": "2023-08-13T02:49:00-07:00 (PDT)"
            },
            "date": {
                "readable": "13 Aug 2023",
                "timestamp": "1691942461",
                "gregorian": {
                    "date": "13-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "13",
                    "weekday": {
                        "en": "Sunday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "26-01-1445",
                    "format": "DD-MM-YYYY",
                    "day": "26",
                    "weekday": {
                        "en": "Al Ahad",
                        "ar": "الاحد"
                    },
                    "month": {
                        "number": 1,
                        "en": "Muḥarram",
                        "ar": "مُحَرَّم"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-14T04:24:00-07:00 (PDT)",
                "Sunrise": "2023-08-14T06:03:00-07:00 (PDT)",
                "Dhuhr": "2023-08-14T13:13:00-07:00 (PDT)",
                "Asr": "2023-08-14T17:09:00-07:00 (PDT)",
                "Sunset": "2023-08-14T20:22:00-07:00 (PDT)",
                "Maghrib": "2023-08-14T20:22:00-07:00 (PDT)",
                "Isha": "2023-08-14T22:02:00-07:00 (PDT)",
                "Imsak": "2023-08-14T04:14:00-07:00 (PDT)",
                "Midnight": "2023-08-15T01:13:00-07:00 (PDT)",
                "Firstthird": "2023-08-14T23:36:00-07:00 (PDT)",
                "Lastthird": "2023-08-14T02:50:00-07:00 (PDT)"
            },
            "date": {
                "readable": "14 Aug 2023",
                "timestamp": "1692028861",
                "gregorian": {
                    "date": "14-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "14",
                    "weekday": {
                        "en": "Monday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "27-01-1445",
                    "format": "DD-MM-YYYY",
                    "day": "27",
                    "weekday": {
                        "en": "Al Athnayn",
                        "ar": "الاثنين"
                    },
                    "month": {
                        "number": 1,
                        "en": "Muḥarram",
                        "ar": "مُحَرَّم"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-15T04:26:00-07:00 (PDT)",
                "Sunrise": "2023-08-15T06:05:00-07:00 (PDT)",
                "Dhuhr": "2023-08-15T13:13:00-07:00 (PDT)",
                "Asr": "2023-08-15T17:08:00-07:00 (PDT)",
                "Sunset": "2023-08-15T20:21:00-07:00 (PDT)",
                "Maghrib": "2023-08-15T20:21:00-07:00 (PDT)",
                "Isha": "2023-08-15T21:59:00-07:00 (PDT)",
                "Imsak": "2023-08-15T04:16:00-07:00 (PDT)",
                "Midnight": "2023-08-16T01:13:00-07:00 (PDT)",
                "Firstthird": "2023-08-15T23:35:00-07:00 (PDT)",
                "Lastthird": "2023-08-15T02:50:00-07:00 (PDT)"
            },
            "date": {
                "readable": "15 Aug 2023",
                "timestamp": "1692115261",
                "gregorian": {
                    "date": "15-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "15",
                    "weekday": {
                        "en": "Tuesday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "28-01-1445",
                    "format": "DD-MM-YYYY",
                    "day": "28",
                    "weekday": {
                        "en": "Al Thalaata",
                        "ar": "الثلاثاء"
                    },
                    "month": {
                        "number": 1,
                        "en": "Muḥarram",
                        "ar": "مُحَرَّم"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-16T04:28:00-07:00 (PDT)",
                "Sunrise": "2023-08-16T06:06:00-07:00 (PDT)",
                "Dhuhr": "2023-08-16T13:13:00-07:00 (PDT)",
                "Asr": "2023-08-16T17:07:00-07:00 (PDT)",
                "Sunset": "2023-08-16T20:19:00-07:00 (PDT)",
                "Maghrib": "2023-08-16T20:19:00-07:00 (PDT)",
                "Isha": "2023-08-16T21:57:00-07:00 (PDT)",
                "Imsak": "2023-08-16T04:18:00-07:00 (PDT)",
                "Midnight": "2023-08-17T01:12:00-07:00 (PDT)",
                "Firstthird": "2023-08-16T23:35:00-07:00 (PDT)",
                "Lastthird": "2023-08-16T02:50:00-07:00 (PDT)"
            },
            "date": {
                "readable": "16 Aug 2023",
                "timestamp": "1692201661",
                "gregorian": {
                    "date": "16-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "16",
                    "weekday": {
                        "en": "Wednesday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "29-01-1445",
                    "format": "DD-MM-YYYY",
                    "day": "29",
                    "weekday": {
                        "en": "Al Arba'a",
                        "ar": "الاربعاء"
                    },
                    "month": {
                        "number": 1,
                        "en": "Muḥarram",
                        "ar": "مُحَرَّم"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-17T04:30:00-07:00 (PDT)",
                "Sunrise": "2023-08-17T06:07:00-07:00 (PDT)",
                "Dhuhr": "2023-08-17T13:13:00-07:00 (PDT)",
                "Asr": "2023-08-17T17:06:00-07:00 (PDT)",
                "Sunset": "2023-08-17T20:17:00-07:00 (PDT)",
                "Maghrib": "2023-08-17T20:17:00-07:00 (PDT)",
                "Isha": "2023-08-17T21:55:00-07:00 (PDT)",
                "Imsak": "2023-08-17T04:20:00-07:00 (PDT)",
                "Midnight": "2023-08-18T01:12:00-07:00 (PDT)",
                "Firstthird": "2023-08-17T23:34:00-07:00 (PDT)",
                "Lastthird": "2023-08-17T02:51:00-07:00 (PDT)"
            },
            "date": {
                "readable": "17 Aug 2023",
                "timestamp": "1692288061",
                "gregorian": {
                    "date": "17-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "17",
                    "weekday": {
                        "en": "Thursday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "30-01-1445",
                    "format": "DD-MM-YYYY",
                    "day": "30",
                    "weekday": {
                        "en": "Al Khamees",
                        "ar": "الخميس"
                    },
                    "month": {
                        "number": 1,
                        "en": "Muḥarram",
                        "ar": "مُحَرَّم"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-18T04:31:00-07:00 (PDT)",
                "Sunrise": "2023-08-18T06:09:00-07:00 (PDT)",
                "Dhuhr": "2023-08-18T13:12:00-07:00 (PDT)",
                "Asr": "2023-08-18T17:06:00-07:00 (PDT)",
                "Sunset": "2023-08-18T20:15:00-07:00 (PDT)",
                "Maghrib": "2023-08-18T20:15:00-07:00 (PDT)",
                "Isha": "2023-08-18T21:52:00-07:00 (PDT)",
                "Imsak": "2023-08-18T04:21:00-07:00 (PDT)",
                "Midnight": "2023-08-19T01:12:00-07:00 (PDT)",
                "Firstthird": "2023-08-18T23:33:00-07:00 (PDT)",
                "Lastthird": "2023-08-18T02:51:00-07:00 (PDT)"
            },
            "date": {
                "readable": "18 Aug 2023",
                "timestamp": "1692374461",
                "gregorian": {
                    "date": "18-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "18",
                    "weekday": {
                        "en": "Friday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "01-02-1445",
                    "format": "DD-MM-YYYY",
                    "day": "01",
                    "weekday": {
                        "en": "Al Juma'a",
                        "ar": "الجمعة"
                    },
                    "month": {
                        "number": 2,
                        "en": "Ṣafar",
                        "ar": "صَفَر"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-19T04:33:00-07:00 (PDT)",
                "Sunrise": "2023-08-19T06:10:00-07:00 (PDT)",
                "Dhuhr": "2023-08-19T13:12:00-07:00 (PDT)",
                "Asr": "2023-08-19T17:05:00-07:00 (PDT)",
                "Sunset": "2023-08-19T20:14:00-07:00 (PDT)",
                "Maghrib": "2023-08-19T20:14:00-07:00 (PDT)",
                "Isha": "2023-08-19T21:50:00-07:00 (PDT)",
                "Imsak": "2023-08-19T04:23:00-07:00 (PDT)",
                "Midnight": "2023-08-20T01:12:00-07:00 (PDT)",
                "Firstthird": "2023-08-19T23:32:00-07:00 (PDT)",
                "Lastthird": "2023-08-19T02:51:00-07:00 (PDT)"
            },
            "date": {
                "readable": "19 Aug 2023",
                "timestamp": "1692460861",
                "gregorian": {
                    "date": "19-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "19",
                    "weekday": {
                        "en": "Saturday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "02-02-1445",
                    "format": "DD-MM-YYYY",
                    "day": "02",
                    "weekday": {
                        "en": "Al Sabt",
                        "ar": "السبت"
                    },
                    "month": {
                        "number": 2,
                        "en": "Ṣafar",
                        "ar": "صَفَر"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-20T04:35:00-07:00 (PDT)",
                "Sunrise": "2023-08-20T06:11:00-07:00 (PDT)",
                "Dhuhr": "2023-08-20T13:12:00-07:00 (PDT)",
                "Asr": "2023-08-20T17:04:00-07:00 (PDT)",
                "Sunset": "2023-08-20T20:12:00-07:00 (PDT)",
                "Maghrib": "2023-08-20T20:12:00-07:00 (PDT)",
                "Isha": "2023-08-20T21:48:00-07:00 (PDT)",
                "Imsak": "2023-08-20T04:25:00-07:00 (PDT)",
                "Midnight": "2023-08-21T01:12:00-07:00 (PDT)",
                "Firstthird": "2023-08-20T23:32:00-07:00 (PDT)",
                "Lastthird": "2023-08-20T02:51:00-07:00 (PDT)"
            },
            "date": {
                "readable": "20 Aug 2023",
                "timestamp": "1692547261",
                "gregorian": {
                    "date": "20-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "20",
                    "weekday": {
                        "en": "Sunday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "03-02-1445",
                    "format": "DD-MM-YYYY",
                    "day": "03",
                    "weekday": {
                        "en": "Al Ahad",
                        "ar": "الاحد"
                    },
                    "month": {
                        "number": 2,
                        "en": "Ṣafar",
                        "ar": "صَفَر"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-21T04:37:00-07:00 (PDT)",
                "Sunrise": "2023-08-21T06:13:00-07:00 (PDT)",
                "Dhuhr": "2023-08-21T13:12:00-07:00 (PDT)",
                "Asr": "2023-08-21T17:03:00-07:00 (PDT)",
                "Sunset": "2023-08-21T20:10:00-07:00 (PDT)",
                "Maghrib": "2023-08-21T20:10:00-07:00 (PDT)",
                "Isha": "2023-08-21T21:45:00-07:00 (PDT)",
                "Imsak": "2023-08-21T04:27:00-07:00 (PDT)",
                "Midnight": "2023-08-22T01:11:00-07:00 (PDT)",
                "Firstthird": "2023-08-21T23:31:00-07:00 (PDT)",
                "Lastthird": "2023-08-21T02:52:00-07:00 (PDT)"
            },
            "date": {
                "readable": "21 Aug 2023",
                "timestamp": "1692633661",
                "gregorian": {
                    "date": "21-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "21",
                    "weekday": {
                        "en": "Monday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "04-02-1445",
                    "format": "DD-MM-YYYY",
                    "day": "04",
                    "weekday": {
                        "en": "Al Athnayn",
                        "ar": "الاثنين"
                    },
                    "month": {
                        "number": 2,
                        "en": "Ṣafar",
                        "ar": "صَفَر"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-22T04:39:00-07:00 (PDT)",
                "Sunrise": "2023-08-22T06:14:00-07:00 (PDT)",
                "Dhuhr": "2023-08-22T13:11:00-07:00 (PDT)",
                "Asr": "2023-08-22T17:02:00-07:00 (PDT)",
                "Sunset": "2023-08-22T20:08:00-07:00 (PDT)",
                "Maghrib": "2023-08-22T20:08:00-07:00 (PDT)",
                "Isha": "2023-08-22T21:43:00-07:00 (PDT)",
                "Imsak": "2023-08-22T04:29:00-07:00 (PDT)",
                "Midnight": "2023-08-23T01:11:00-07:00 (PDT)",
                "Firstthird": "2023-08-22T23:30:00-07:00 (PDT)",
                "Lastthird": "2023-08-22T02:52:00-07:00 (PDT)"
            },
            "date": {
                "readable": "22 Aug 2023",
                "timestamp": "1692720061",
                "gregorian": {
                    "date": "22-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "22",
                    "weekday": {
                        "en": "Tuesday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "05-02-1445",
                    "format": "DD-MM-YYYY",
                    "day": "05",
                    "weekday": {
                        "en": "Al Thalaata",
                        "ar": "الثلاثاء"
                    },
                    "month": {
                        "number": 2,
                        "en": "Ṣafar",
                        "ar": "صَفَر"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-23T04:41:00-07:00 (PDT)",
                "Sunrise": "2023-08-23T06:15:00-07:00 (PDT)",
                "Dhuhr": "2023-08-23T13:11:00-07:00 (PDT)",
                "Asr": "2023-08-23T17:01:00-07:00 (PDT)",
                "Sunset": "2023-08-23T20:06:00-07:00 (PDT)",
                "Maghrib": "2023-08-23T20:06:00-07:00 (PDT)",
                "Isha": "2023-08-23T21:41:00-07:00 (PDT)",
                "Imsak": "2023-08-23T04:31:00-07:00 (PDT)",
                "Midnight": "2023-08-24T01:11:00-07:00 (PDT)",
                "Firstthird": "2023-08-23T23:29:00-07:00 (PDT)",
                "Lastthird": "2023-08-23T02:52:00-07:00 (PDT)"
            },
            "date": {
                "readable": "23 Aug 2023",
                "timestamp": "1692806461",
                "gregorian": {
                    "date": "23-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "23",
                    "weekday": {
                        "en": "Wednesday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "06-02-1445",
                    "format": "DD-MM-YYYY",
                    "day": "06",
                    "weekday": {
                        "en": "Al Arba'a",
                        "ar": "الاربعاء"
                    },
                    "month": {
                        "number": 2,
                        "en": "Ṣafar",
                        "ar": "صَفَر"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-24T04:42:00-07:00 (PDT)",
                "Sunrise": "2023-08-24T06:17:00-07:00 (PDT)",
                "Dhuhr": "2023-08-24T13:11:00-07:00 (PDT)",
                "Asr": "2023-08-24T17:00:00-07:00 (PDT)",
                "Sunset": "2023-08-24T20:04:00-07:00 (PDT)",
                "Maghrib": "2023-08-24T20:04:00-07:00 (PDT)",
                "Isha": "2023-08-24T21:38:00-07:00 (PDT)",
                "Imsak": "2023-08-24T04:32:00-07:00 (PDT)",
                "Midnight": "2023-08-25T01:11:00-07:00 (PDT)",
                "Firstthird": "2023-08-24T23:29:00-07:00 (PDT)",
                "Lastthird": "2023-08-24T02:53:00-07:00 (PDT)"
            },
            "date": {
                "readable": "24 Aug 2023",
                "timestamp": "1692892861",
                "gregorian": {
                    "date": "24-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "24",
                    "weekday": {
                        "en": "Thursday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "07-02-1445",
                    "format": "DD-MM-YYYY",
                    "day": "07",
                    "weekday": {
                        "en": "Al Khamees",
                        "ar": "الخميس"
                    },
                    "month": {
                        "number": 2,
                        "en": "Ṣafar",
                        "ar": "صَفَر"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-25T04:44:00-07:00 (PDT)",
                "Sunrise": "2023-08-25T06:18:00-07:00 (PDT)",
                "Dhuhr": "2023-08-25T13:11:00-07:00 (PDT)",
                "Asr": "2023-08-25T16:59:00-07:00 (PDT)",
                "Sunset": "2023-08-25T20:03:00-07:00 (PDT)",
                "Maghrib": "2023-08-25T20:03:00-07:00 (PDT)",
                "Isha": "2023-08-25T21:36:00-07:00 (PDT)",
                "Imsak": "2023-08-25T04:34:00-07:00 (PDT)",
                "Midnight": "2023-08-26T01:10:00-07:00 (PDT)",
                "Firstthird": "2023-08-25T23:28:00-07:00 (PDT)",
                "Lastthird": "2023-08-25T02:53:00-07:00 (PDT)"
            },
            "date": {
                "readable": "25 Aug 2023",
                "timestamp": "1692979261",
                "gregorian": {
                    "date": "25-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "25",
                    "weekday": {
                        "en": "Friday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "08-02-1445",
                    "format": "DD-MM-YYYY",
                    "day": "08",
                    "weekday": {
                        "en": "Al Juma'a",
                        "ar": "الجمعة"
                    },
                    "month": {
                        "number": 2,
                        "en": "Ṣafar",
                        "ar": "صَفَر"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-26T04:46:00-07:00 (PDT)",
                "Sunrise": "2023-08-26T06:19:00-07:00 (PDT)",
                "Dhuhr": "2023-08-26T13:10:00-07:00 (PDT)",
                "Asr": "2023-08-26T16:57:00-07:00 (PDT)",
                "Sunset": "2023-08-26T20:01:00-07:00 (PDT)",
                "Maghrib": "2023-08-26T20:01:00-07:00 (PDT)",
                "Isha": "2023-08-26T21:34:00-07:00 (PDT)",
                "Imsak": "2023-08-26T04:36:00-07:00 (PDT)",
                "Midnight": "2023-08-27T01:10:00-07:00 (PDT)",
                "Firstthird": "2023-08-26T23:27:00-07:00 (PDT)",
                "Lastthird": "2023-08-26T02:53:00-07:00 (PDT)"
            },
            "date": {
                "readable": "26 Aug 2023",
                "timestamp": "1693065661",
                "gregorian": {
                    "date": "26-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "26",
                    "weekday": {
                        "en": "Saturday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "09-02-1445",
                    "format": "DD-MM-YYYY",
                    "day": "09",
                    "weekday": {
                        "en": "Al Sabt",
                        "ar": "السبت"
                    },
                    "month": {
                        "number": 2,
                        "en": "Ṣafar",
                        "ar": "صَفَر"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-27T04:48:00-07:00 (PDT)",
                "Sunrise": "2023-08-27T06:21:00-07:00 (PDT)",
                "Dhuhr": "2023-08-27T13:10:00-07:00 (PDT)",
                "Asr": "2023-08-27T16:56:00-07:00 (PDT)",
                "Sunset": "2023-08-27T19:59:00-07:00 (PDT)",
                "Maghrib": "2023-08-27T19:59:00-07:00 (PDT)",
                "Isha": "2023-08-27T21:31:00-07:00 (PDT)",
                "Imsak": "2023-08-27T04:38:00-07:00 (PDT)",
                "Midnight": "2023-08-28T01:10:00-07:00 (PDT)",
                "Firstthird": "2023-08-27T23:26:00-07:00 (PDT)",
                "Lastthird": "2023-08-27T02:53:00-07:00 (PDT)"
            },
            "date": {
                "readable": "27 Aug 2023",
                "timestamp": "1693152061",
                "gregorian": {
                    "date": "27-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "27",
                    "weekday": {
                        "en": "Sunday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "10-02-1445",
                    "format": "DD-MM-YYYY",
                    "day": "10",
                    "weekday": {
                        "en": "Al Ahad",
                        "ar": "الاحد"
                    },
                    "month": {
                        "number": 2,
                        "en": "Ṣafar",
                        "ar": "صَفَر"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-28T04:50:00-07:00 (PDT)",
                "Sunrise": "2023-08-28T06:22:00-07:00 (PDT)",
                "Dhuhr": "2023-08-28T13:10:00-07:00 (PDT)",
                "Asr": "2023-08-28T16:55:00-07:00 (PDT)",
                "Sunset": "2023-08-28T19:57:00-07:00 (PDT)",
                "Maghrib": "2023-08-28T19:57:00-07:00 (PDT)",
                "Isha": "2023-08-28T21:29:00-07:00 (PDT)",
                "Imsak": "2023-08-28T04:40:00-07:00 (PDT)",
                "Midnight": "2023-08-29T01:09:00-07:00 (PDT)",
                "Firstthird": "2023-08-28T23:25:00-07:00 (PDT)",
                "Lastthird": "2023-08-28T02:54:00-07:00 (PDT)"
            },
            "date": {
                "readable": "28 Aug 2023",
                "timestamp": "1693238461",
                "gregorian": {
                    "date": "28-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "28",
                    "weekday": {
                        "en": "Monday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "11-02-1445",
                    "format": "DD-MM-YYYY",
                    "day": "11",
                    "weekday": {
                        "en": "Al Athnayn",
                        "ar": "الاثنين"
                    },
                    "month": {
                        "number": 2,
                        "en": "Ṣafar",
                        "ar": "صَفَر"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-29T04:51:00-07:00 (PDT)",
                "Sunrise": "2023-08-29T06:23:00-07:00 (PDT)",
                "Dhuhr": "2023-08-29T13:10:00-07:00 (PDT)",
                "Asr": "2023-08-29T16:54:00-07:00 (PDT)",
                "Sunset": "2023-08-29T19:55:00-07:00 (PDT)",
                "Maghrib": "2023-08-29T19:55:00-07:00 (PDT)",
                "Isha": "2023-08-29T21:27:00-07:00 (PDT)",
                "Imsak": "2023-08-29T04:41:00-07:00 (PDT)",
                "Midnight": "2023-08-30T01:09:00-07:00 (PDT)",
                "Firstthird": "2023-08-29T23:24:00-07:00 (PDT)",
                "Lastthird": "2023-08-29T02:54:00-07:00 (PDT)"
            },
            "date": {
                "readable": "29 Aug 2023",
                "timestamp": "1693324861",
                "gregorian": {
                    "date": "29-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "29",
                    "weekday": {
                        "en": "Tuesday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "12-02-1445",
                    "format": "DD-MM-YYYY",
                    "day": "12",
                    "weekday": {
                        "en": "Al Thalaata",
                        "ar": "الثلاثاء"
                    },
                    "month": {
                        "number": 2,
                        "en": "Ṣafar",
                        "ar": "صَفَر"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-30T04:53:00-07:00 (PDT)",
                "Sunrise": "2023-08-30T06:25:00-07:00 (PDT)",
                "Dhuhr": "2023-08-30T13:09:00-07:00 (PDT)",
                "Asr": "2023-08-30T16:53:00-07:00 (PDT)",
                "Sunset": "2023-08-30T19:53:00-07:00 (PDT)",
                "Maghrib": "2023-08-30T19:53:00-07:00 (PDT)",
                "Isha": "2023-08-30T21:24:00-07:00 (PDT)",
                "Imsak": "2023-08-30T04:43:00-07:00 (PDT)",
                "Midnight": "2023-08-31T01:09:00-07:00 (PDT)",
                "Firstthird": "2023-08-30T23:24:00-07:00 (PDT)",
                "Lastthird": "2023-08-30T02:54:00-07:00 (PDT)"
            },
            "date": {
                "readable": "30 Aug 2023",
                "timestamp": "1693411261",
                "gregorian": {
                    "date": "30-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "30",
                    "weekday": {
                        "en": "Wednesday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "13-02-1445",
                    "format": "DD-MM-YYYY",
                    "day": "13",
                    "weekday": {
                        "en": "Al Arba'a",
                        "ar": "الاربعاء"
                    },
                    "month": {
                        "number": 2,
                        "en": "Ṣafar",
                        "ar": "صَفَر"
                    },
                    "year": "1445",
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
                "Fajr": "2023-08-31T04:55:00-07:00 (PDT)",
                "Sunrise": "2023-08-31T06:26:00-07:00 (PDT)",
                "Dhuhr": "2023-08-31T13:09:00-07:00 (PDT)",
                "Asr": "2023-08-31T16:52:00-07:00 (PDT)",
                "Sunset": "2023-08-31T19:51:00-07:00 (PDT)",
                "Maghrib": "2023-08-31T19:51:00-07:00 (PDT)",
                "Isha": "2023-08-31T21:22:00-07:00 (PDT)",
                "Imsak": "2023-08-31T04:45:00-07:00 (PDT)",
                "Midnight": "2023-09-01T01:08:00-07:00 (PDT)",
                "Firstthird": "2023-08-31T23:23:00-07:00 (PDT)",
                "Lastthird": "2023-08-31T02:54:00-07:00 (PDT)"
            },
            "date": {
                "readable": "31 Aug 2023",
                "timestamp": "1693497661",
                "gregorian": {
                    "date": "31-08-2023",
                    "format": "DD-MM-YYYY",
                    "day": "31",
                    "weekday": {
                        "en": "Thursday"
                    },
                    "month": {
                        "number": 8,
                        "en": "August"
                    },
                    "year": "2023",
                    "designation": {
                        "abbreviated": "AD",
                        "expanded": "Anno Domini"
                    }
                },
                "hijri": {
                    "date": "14-02-1445",
                    "format": "DD-MM-YYYY",
                    "day": "14",
                    "weekday": {
                        "en": "Al Khamees",
                        "ar": "الخميس"
                    },
                    "month": {
                        "number": 2,
                        "en": "Ṣafar",
                        "ar": "صَفَر"
                    },
                    "year": "1445",
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

enum NetworkError: String, Error {
    // Throw when an invalid password is entered
    case InvalidDate = "InvalidDate"
    
    case InvalidData = "InvalidData"
    
    case NotAsked = "NotAsked"
}

struct Parameters: Encodable {
    let address: String
    let month: Int
    let year: Int
    let iso8601: String
}

func fetchAthanTime(for date: Date, onComplete: @escaping (Result<SalatTimesJson, NetworkError>) -> Void) {
    let components = date.get(.year, .month)
    guard let year = components.year, let month = components.month else {
        onComplete(.failure(.InvalidDate))
        return
    }
    let parameters = Parameters(address: "621 Ilwaco Pl NE, Renton, WA", month: month, year: year, iso8601: "true")
    let task = AF.request("http://api.aladhan.com/v1/calendarByAddress", method: .get, parameters: parameters).responseDecodable(of:SalatTimesJson.self) { response in
        switch response.result {
        case .success(let salatTime):
            onComplete(.success(salatTime))
        case .failure:
            onComplete(.failure(.InvalidData))
        }
    }
    task.resume()
}

class AthanTimings: ObservableObject {
    @Published var salatTimes = Result<[SalatTime], NetworkError>.failure(.NotAsked)
    @Published var currentSalatTimes = Result<CurrentSalatTimes, NetworkError>.failure(.NotAsked)
    func fetch() {
        fetchAthanTime(for: Date.now) { data in
            switch data {
            case .success(let json):
                let results = json.data.flatMap { salatTimeDay in
                    return salatTimeDay.timings.compactMap { (key, value) -> SalatTime? in
                        if let salatType = SalatType(rawValue: key), let salatTime = isoFormatter.date(from: value) {
                            return SalatTime(type: salatType, time: salatTime)
                        }
                        
                        return nil
                    }
                }.sorted { a, b in
                    a.time.compare(b.time) == .orderedAscending
                }
                
                self.salatTimes = .success(results)
                var currentSalatTime = CurrentSalatTimes(salatTimes: results)
                currentSalatTime.computeCurrentSalatIndex()
                self.currentSalatTimes = .success(currentSalatTime)
            case .failure(let error):
                self.salatTimes = .failure(error)
                self.currentSalatTimes = .failure(error)
            }
        }
    }
}
