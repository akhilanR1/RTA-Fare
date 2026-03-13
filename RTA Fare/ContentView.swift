import SwiftUI

struct ContentView: View {
    

    let stations: [String: Int] = [
        "Centrepoint": 5,
        "Emirates": 5,
        "Airport Terminal 3": 5,
        "Airport Terminal 1": 5,
        "Al Garhoud": 5,
        "City Centre Deira": 5,
        "Al Rigga": 5,
        "Union": 5,
        "Burjuman": 6,
        "ADCB": 6,
        "max": 6,
        "World Trade Center": 6,
        "Emirates Towers": 6,
        "Financial Centre": 6,
        "Burj Khalifa / Dubai Mall": 6,
        "Business Bay": 3,
        "ONPASSIVE": 3,
        "Equiti": 2,
        "Mall of the Emirates": 2,
        "InsuranceMarket": 2,
        "Dubai Internet City": 2,
        "Al Fardan Exchange": 2,
        "Sobha Realty": 2,
        "DMCC": 2,
        "National Paints": 2,
        "Ibn Battuta": 2,
        "Energy": 2,
        "Danube": 2,
        "Life Pharmacy": 2,
        "The Gardens": 2,
        "Discovery Gardens": 2,
        "Al Furjan": 2,
        "Jumeirah Golf Estates": 1,
        "Dubai Investment Park": 1,
        "EXPO 2020": 1,
        "e&": 5,
        "Al Qusais": 5,
        "Dubai Airport Free Zone": 5,
        "Al Nahda": 5,
        "Stadium": 5,
        "Al Qiyadah": 5,
        "Abu Hail": 5,
        "Abu Baker Al Siddique": 5,
        "Salah Al Din": 5,
        "Baniyas Square": 5,
        "Gold Souq": 5,
        "Al Ras": 5,
        "Al Gubaiba": 6,
        "Sharaf DG": 6,
        "Oud Metha": 6,
        "Dubai Healthcare City": 6,
        "Al Jadaf": 6,
        "Creek": 6,
        "Jumeirah Beach Residence 1": 2,
        "Jumeirah Beach Residence 2": 2,
        "Jumeirah Lakes Towers": 2,
        "Dubai Marina Mall": 2,
        "Dubai Marina": 2,
        "Marina Towers": 2,
        "Mina Seyahi": 2,
        "Media City": 2,
        "Palm Jumeirah": 2,
        "Knowledge Village": 2,
        "Al Sufouh": 2
    ]
    
    @State private var startStation = "Burjuman"
    @State private var endStation = "Mall of the Emirates"
    @State private var selectedCardType = "Silver"
    @State private var fare: Double?
    
    let cardTypes = ["Silver", "Red", "Gold"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Dubai Metro Zones Map")) {
                    HStack {
                        Spacer()
                        Image("download")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 300)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                        Spacer()
                    }
                }
                
                Section(header: Text("Select Stations")) {
                    Picker("From", selection: $startStation) {
                        ForEach(stations.keys.sorted(), id: \.self) { station in
                            Text(station)
                        }
                    }
                    
                    Picker("To", selection: $endStation) {
                        ForEach(stations.keys.sorted(), id: \.self) { station in
                            Text(station)
                        }
                    }
                }
                
                Section(header: Text("Card Type")) {
                    Picker("Nol Card", selection: $selectedCardType) {
                        ForEach(cardTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                

                Section {
                    Button(action: {
                        fare = calculateFare(from: startStation, to: endStation, cardType: selectedCardType)
                    }) {
                        HStack {
                            Spacer()
                            Text("Calculate Fare")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                            Spacer()
                        }
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 4)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                if let fare = fare {
                    Section(header: Text("Your Fare")) {
                        Text("AED \(fare, specifier: "%.2f")")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.green)
                    }
                }
            }
            .navigationTitle("Dubai Metro Fare")
        }
    }
    
    func calculateFare(from: String, to: String, cardType: String) -> Double {
        guard let fromZone = stations[from], let toZone = stations[to] else { return 0.0 }
        let zonesApart = abs(fromZone - toZone)
        
        switch zonesApart {
        case 0:
            switch cardType {
            case "Silver": return 3.0
            case "Gold":   return 6.0
            case "Red":    return 4.0
            default:       return 0.0
            }
        case 1:
            switch cardType {
            case "Silver": return 5.0
            case "Gold":   return 10.0
            case "Red":    return 6.0
            default:       return 0.0
            }
        case 2...:
            switch cardType {
            case "Silver": return 7.5
            case "Gold":   return 15.0
            case "Red":    return 8.5
            default:       return 0.0
            }
        default:
            return 0.0
        }
    }
}
