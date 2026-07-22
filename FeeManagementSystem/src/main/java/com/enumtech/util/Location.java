package com.enumtech.util;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Location {

    public static final Map<String, List<String>> STATE_CITY_MAP = new HashMap<>();

    static {
        System.out.println("Location are initialized successfully....");

        // Maharashtra (updated with more cities)
        STATE_CITY_MAP.put("Maharashtra",
                Arrays.asList(
                        "Mumbai",
                        "Pune",
                        "Nagpur",
                        "Nashik",
                        "Aurangabad"
                ));

        // Karnataka (updated with more cities)
        STATE_CITY_MAP.put("Karnataka",
                Arrays.asList(
                        "Bengaluru",
                        "Mysuru",
                        "Mangaluru",
                        "Hubballi"
                ));

        // Gujarat (already existed, kept as is)
        STATE_CITY_MAP.put("Gujarat",
                Arrays.asList(
                        "Ahmedabad",
                        "Surat",
                        "Vadodara"
                ));

        // Telangana (new)
        STATE_CITY_MAP.put("Telangana",
                Arrays.asList(
                        "Hyderabad",
                        "Warangal",
                        "Nizamabad",
                        "Karimnagar",
                        "Khammam"
                ));

        // Uttar Pradesh (new)
        STATE_CITY_MAP.put("Uttar Pradesh",
                Arrays.asList(
                        "Lucknow",
                        "Kanpur",
                        "Agra"
                ));

        // Bihar (new)
        STATE_CITY_MAP.put("Bihar",
                Arrays.asList(
                        "Patna",
                        "Gaya",
                        "Bhagalpur",
                        "Muzaffarpur"
                ));

        // Himachal Pradesh (new)
        STATE_CITY_MAP.put("Himachal Pradesh",
                Arrays.asList(
                        "Shimla",
                        "Manali",
                        "Dharamshala"
                ));
    }

    public static List<String> getCitiesByState(String state) {
        return STATE_CITY_MAP.getOrDefault(state, Collections.emptyList());
    }
}
