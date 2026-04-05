package com.example.springhelloworld;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController

public class FareService {

    private final Map<String, Integer> stations = new HashMap<>();

    public FareService(){
        stations.put("Centrepoint", 5);
        stations.put("Emirates", 5);
        stations.put("Airport Terminal 3", 5);
        stations.put("Airport Terminal 1", 5);
        stations.put("Al Garhoud", 5);
        stations.put("City Centre Deira", 5);
        stations.put("Al Rigga", 5);
        stations.put("Union", 5);
        stations.put("Burjuman", 6);
        stations.put("ADCB", 6);
        stations.put("max", 6);
        stations.put("World Trade Center", 6);
        stations.put("Emirates Towers", 6);
        stations.put("Financial Centre", 6);
        stations.put("Burj Khalifa / Dubai Mall", 6);
        stations.put("Business Bay", 3);
        stations.put("ONPASSIVE", 3);
        stations.put("Equiti", 2);
        stations.put("Mall of the Emirates", 2);
        stations.put("InsuranceMarket", 2);
        stations.put("Dubai Internet City", 2);
        stations.put("Al Fardan Exchange", 2);
        stations.put("Sobha Realty", 2);
        stations.put("DMCC", 2);
        stations.put("National Paints", 2);
        stations.put("Ibn Battuta", 2);
        stations.put("Energy", 2);
        stations.put("Danube", 2);
        stations.put("Life Pharmacy", 2);
        stations.put("The Gardens", 2);
        stations.put("Discovery Gardens", 2);
        stations.put("Al Furjan", 2);
        stations.put("Jumeirah Golf Estates", 1);
        stations.put("Dubai Investment Park", 1);
        stations.put("EXPO 2020", 1);
        stations.put("e&", 5);
        stations.put("Al Qusais", 5);
        stations.put("Dubai Airport Free Zone", 5);
        stations.put("Al Nahda", 5);
        stations.put("Stadium", 5);
        stations.put("Al Qiyadah", 5);
        stations.put("Abu Hail", 5);
        stations.put("Abu Baker Al Siddique", 5);
        stations.put("Salah Al Din", 5);
        stations.put("Baniyas Square", 5);
        stations.put("Gold Souq", 5);
        stations.put("Al Ras", 5);
        stations.put("Al Gubaiba", 6);
        stations.put("Sharaf DG", 6);
        stations.put("Oud Metha", 6);
        stations.put("Dubai Healthcare City", 6);
        stations.put("Al Jadaf", 6);
        stations.put("Creek", 6);
        stations.put("Jumeirah Beach Residence 1", 2);
        stations.put("Jumeirah Beach Residence 2", 2);
        stations.put("Jumeirah Lakes Towers", 2);
        stations.put("Dubai Marina Mall", 2);
        stations.put("Dubai Marina", 2);
        stations.put("Marina Towers", 2);
        stations.put("Mina Seyahi", 2);
        stations.put("Media City", 2);
        stations.put("Palm Jumeirah", 2);
        stations.put("Knowledge Village", 2);
        stations.put("Al Sufouh", 2);
    }

    @GetMapping("/fare")

    public String getFare(@RequestParam String start, @RequestParam String end, @RequestParam String cardType){
        int fare = calculateFare(start, end, cardType);
        return "" + fare;
    }

    public int calculateFare(String from, String to, String card){
        Integer fromZone = stations.get(from.trim());
        Integer endZone = stations.get(to.trim());

        if(fromZone == null || endZone == null){
            return -1;
        }

        int zonesApart = Math.abs(fromZone - endZone);

        switch (zonesApart){
            case 0:
                switch (card.toLowerCase()) {
                    case "silver": return 3;
                    case "gold": return 6;
                    case "red": return 4;
                    default: return 0;
                }
            case 1:
                switch (card.toLowerCase()) {
                    case "silver": return 5;
                    case "gold": return 10;
                    case "red": return 6;
                    default: return 0;
                }
            default:
                switch (card.toLowerCase()) {
                    case "silver": return 8;
                    case "gold": return 15;
                    case "red": return 9;
                    default: return 0;
                }
        }

    }
}
