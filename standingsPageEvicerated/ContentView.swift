//
//  newStandings.swift
//  app2
//
//  Created by Thea Yocum on 10/15/25.
//
import SwiftUI
import SwiftSoup

//This is white
var jet = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
//This is white smoke
var olive = UIColor(hue: 0/360, saturation: 2/100, brightness: 95/100, alpha: 1)
//This is off-black
var snow = UIColor(red: 21/255, green: 21/255, blue: 32/255, alpha: 1)
var pink = UIColor(red: 207/255, green: 0/255, blue: 126/255, alpha: 1)
var blue = UIColor(red: 83/255, green: 199/255, blue: 231/255, alpha: 1)
var purple = UIColor(red: 145/255, green: 100/255, blue: 179/255, alpha: 1)
var race = UIColor(hue: 0/360, saturation: 0/100, brightness: 88/100, alpha: 1)
var pinky = UIColor(hue: 323/360, saturation: 45/100, brightness: 91/100, alpha: 1)


struct Driver: Identifiable {
    let personValue: Int
    let name: String
    let id = UUID()
}

struct ContentView: View {
    
    let drivers = [
            Driver(personValue: 1, name: "EDG"), //Jessica Edgar
            Driver(personValue: 2, name: "PUL"), //Abbi Pulling
            Driver(personValue: 3, name: "BUS"), //Bianca Bustamante
            Driver(personValue: 4, name: "BUH"), //Léna Bühler
            Driver(personValue: 5, name: "SCH"), //Carrie Schreiner
            Driver(personValue: 6, name: "MAR"), //Nerea Martí
            Driver(personValue: 7, name: ""), //empty page???
            Driver(personValue: 8, name: ""), //* Driver 1 TBA
            Driver(personValue: 9, name: ""), //* Driver 2 TBA
            Driver(personValue: 10, name: ""), //* Driver 3 TBA
            Driver(personValue: 11, name: ""), //* Driver 4 TBA
            Driver(personValue: 12, name: ""), //* Driver 5 TBA
            Driver(personValue: 13, name: ""), //* Driver 6 TBA
            Driver(personValue: 14, name: ""), //* Driver 7 TBA
            Driver(personValue: 15, name: ""), //* Driver 8 TBA
            Driver(personValue: 16, name: ""), //* Driver 9 TBA
            Driver(personValue: 17, name: ""), //* Wild Card
            Driver(personValue: 18, name: ""), //* Driver 11 TBA
            Driver(personValue: 19, name: ""), //* Driver 12 TBA
            Driver(personValue: 20, name: ""), //* Driver 14 TBA
            Driver(personValue: 21, name: ""), //* Driver 15 TBA
            Driver(personValue: 22, name: ""), //* Driver 16 TBA
            Driver(personValue: 23, name: "LOV"), //Lola Lovinfosse
            Driver(personValue: 24, name: "CAC"), //Maite Cáceres
            Driver(personValue: 25, name: "GIL"), //Megan Gilkes
            Driver(personValue: 26, name: "CHO"), //Chloe Chong
            Driver(personValue: 27, name: "AAL"), //Amna Al Qubaisi
            Driver(personValue: 28, name: "HAL"), //Hamda Al Qubaisi
            Driver(personValue: 29, name: "DEH"), //Emely De Heus
            Driver(personValue: 30, name: "GRA"), //Chloe Grant
            Driver(personValue: 31, name: "GAR"), //Marta García
            Driver(personValue: 32, name: "BLO"), //Lia Block
            Driver(personValue: 33, name: "HAU"), //Tina Hausmann
            Driver(personValue: 34, name: "PIN"), //Doriane Pin
            Driver(personValue: 35, name: "CHA"), //Chloe Chambers
            Driver(personValue: 36, name: "WEU"), //Maya Weug
            Driver(personValue: 37, name: "NOB"), //Aurelia Nobels
            Driver(personValue: 38, name: ""), //Reema Juffali
            Driver(personValue: 39, name: "CRO"), //Courtney Crone
            Driver(personValue: 40, name: "GAD"), //Nina Gademan
            Driver(personValue: 41, name: "LLO"), //Ella Lloyd
            Driver(personValue: 42, name: "PAL"), //Alisha Palmowski
            Driver(personValue: 43, name: ""), //Logan Hannah
            Driver(personValue: 44, name: "FEL"), //Emma Felbermayr
            Driver(personValue: 45, name: "LAR"), //Alba Larsen
            Driver(personValue: 46, name: "FER"), //Rafaela Ferreira
            Driver(personValue: 47, name: ""), //empty page???
            Driver(personValue: 48, name: "SHI"), //Wei Shi (WCD)
            Driver(personValue: 49, name: "HAV"), //Nicole Havrda
            Driver(personValue: 50, name: "ANA"), //Aiva Anagnostiadis
            Driver(personValue: 51, name: "CIC"), //Joanne Ciconte
            Driver(personValue: 52, name: "FAY"), //Farah AlYousef (WCD)
            Driver(personValue: 53, name: "DOB"), //Ava Dobson (WCD)
            Driver(personValue: 54, name: "PAA"), //Mathilda Paatz (WCD)
            Driver(personValue: 55, name: "KOS"), //Esmee Kosterman (WCD)
            Driver(personValue: 56, name: "BRU"), //Megan Bruce
            Driver(personValue: 57, name: "BIL"), //Lisa Billard (WCD)
            Driver(personValue: 58, name: "ROB"), //Rachel Robertson
            Driver(personValue: 59, name: "") //empty page!!!
        ]
    
    var body: some View {
        let url = URL (string: "https://www.f1academy.com/Racing-Series/Standings/Driver")!
        let html = try? String(contentsOf: url, encoding: .utf8)
        let document = try! SwiftSoup.parse(html ?? "")
        
        NavigationView{
            ScrollView{
                VStack{
                    Grid(alignment: .leading, horizontalSpacing: 1, verticalSpacing: 25){
                        
                        ForEach(0...24, id: \.self) {
                            let standing = try! document.select("tbody tr:eq(\($0)) .pos")
                            let pts = try! document.select("tbody tr:eq(\($0)) .total-points")
                            let person = try! document.select("tbody tr:eq(\($0)) .visible-desktop-up")
                            let shortPerson = try! document.select("tbody tr:eq(\($0)) .visible-desktop-down")
                            let abrv = try! document.select("tbody tr:eq(\($0)) .visible-desktop-down")
                            
                            let activeDriver = drivers.last {$0.name == "\(try! abrv.text())"}

                            let histno = activeDriver?.personValue
                            
                            NavigationLink {
                                let url = URL (string: "https://www.f1academy.com/Racing-Series/Drivers/\(histno ?? 0)/THISWEBSITEISSOSTUPID")!
                                let html = try? String(contentsOf: url, encoding: .utf8)
                                let document = try! SwiftSoup.parse(html ?? "")
                        
                                let firstName = try! document.select("div .f1-driver-detail--name")
                                let lastName = try! document.select("div.row div.teams-driver-item:eq(0) div.last-name span")
                                let number = try! document.select("div.row div.teams-driver-item:eq(0) .driver-carno")

                                
                                Text("\(try! firstName.text())")

                            } label: {
                                GridRow {
                                    Text("\(try! standing.text())")
                                        .padding(.leading, 5)
                                        .padding(.trailing, 20)
                                    Image("\(try! abrv.text())" + "_headshot")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                        .padding(.trailing, 15)
                                    Text("\(try! person.text())")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text("\(try! pts.text())")
                                        .frame(alignment: .trailing)
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(Color(.gray))
                                }
                                .font(.custom("Formula1-Display-Regular", size: 14))
                            }
                        }
                    }
                }
                .foregroundStyle(Color(snow))
                .font(.custom("ProximaNova-Medium", size: 15))
                .frame(maxWidth: .infinity)
            }
            .padding(20)
        }
    }
}

struct DriverView: View {
    
    var body: some View {
        Text("hello world :(")
//        let url = URL (string: "https://www.f1academy.com/Racing-Series/Drivers")!
//        let html = try? String(contentsOf: url, encoding: .utf8)
//        let document = try! SwiftSoup.parse(html ?? "")
//        
//        let firstName = try! document.select("div.row div.teams-driver-item:eq(\(driver.personValue)) .first-name")
//        let lastName = try! document.select("div.row div.teams-driver-item:eq(\(driver.personValue)) div.last-name span")
//        let number = try! document.select("div.row div.teams-driver-item:eq(\(driver.personValue)) .driver-carno")
//        
//        ScrollView {
//            LazyVStack (pinnedViews: .sectionHeaders) {
//                VStack{
//                    ScrollViewReader { proxy in
//                        ZStack{
//                            GeometryReader {proxy in
//                                Image("\(try! lastName.text().replacingOccurrences(of: " ", with: ""))")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: proxy.size.width, height: 275) //275
//                            }
//                            VStack{
//                                Spacer()
//                                VStack{
//                                    Text("\(try! firstName.text())")
//                                        .foregroundColor(Color(jet))
//                                        .font(.custom("Formula1-Display-Regular", size: 20))
//                                    Text("\(try! lastName.text().replacingOccurrences(of: " ", with: ""))" .uppercased())
//                                        .font(.custom("Formula1-Display-Regular", size: 30))
//                                        .fontWeight(.bold)
//                                        .foregroundColor(Color(jet))
//                                        .frame(maxWidth: .infinity)
//                                    HStack {
//                                        Text("IM")
//                                            .font(.custom("Formula1-Display-Regular", size: 40))
//                                            .foregroundColor(Color(snow))
//                                        Text("\(try! number.text())")
//                                            .font(.custom("Formula1-Display-Regular", size: 30))
//                                            .foregroundColor(Color(jet))
//                                    }
//                                }
//                                .padding(.top, 163)
//                                .background(
//                                    LinearGradient(gradient: Gradient(colors: [Color(UIColor(red: 41/255, green: 42/255, blue: 39/255, alpha: 0)), Color(UIColor(red: 41/255, green: 42/255, blue: 39/255, alpha: 0.70))]), startPoint: .top, endPoint: .bottom)
//                                )
//                            }
//                        }
//                        
//                        HStack {
//                            Button("Statistics") {
//                                proxy.scrollTo("Stats", anchor: .top)
//                            }
//                            Button("Biography") {
//                                proxy.scrollTo("Bio", anchor: .top)
//                            }
//                            .padding(.leading, 15)
//                            .padding(.trailing, 15)
//                            Button("Results") {
//                                proxy.scrollTo("Res", anchor: .top)
//                            }
//                            .padding(10)
//                        }
//                        .font(.custom("Formula1-Display-Regular", size: 16))
//                        .foregroundColor(Color(snow))
//                        .frame(maxWidth: .infinity)
//                        .background(
//                            Color(olive)
//                        )
//                        Statistics(driver: driver)
//                            .id("Stats")
//                        Biography(driver: driver)
//                            .id("Bio")
//                        Results()
//                            .id("Res")
//                    }
//                }
//            }
//        }
    }
}



#Preview {
    ContentView()
}
