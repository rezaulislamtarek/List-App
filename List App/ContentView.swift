//
//  ContentView.swift
//  List App
//
//  Created by Rezaul Islam on 10/7/23.
//

import SwiftUI

struct Place : Identifiable{
    let id = UUID()
    let name :String
    let photo :String
}

func getPlaces() -> [Place] {
    /*
     "Liberation-War-Museum"
     "Mahasthangarh"
     "Mainamati 1"
     "National-Memorial"
     "PanamCity"
     "Shaheed-Minar
     ""Shat-Gombuj-Mosque"
     "Star-Mosque"

     */
    return [
        Place(name: "Star Mosque", photo: "Star-Mosque"),
        Place(name: "Shat Gombuj Mosque", photo: "Shat-Gombuj-Mosque"),
        Place(name: "Shaheed Minar", photo: "Shaheed-Minar"),
        Place(name: "PanamCity", photo: "PanamCity"),
        Place(name: "National Memorial", photo: "National-Memorial"),
        Place(name: "Mainamati", photo: "Mainamati 1"),
        Place(name: "Mahasthangarh", photo: "Mahasthangarh"),
        Place(name: "Liberation War Museum", photo: "Liberation-War-Museum"),
    ]
}
 

struct ContentView: View {
    @State var places = getPlaces()
    @State var search = ""
 
    var body: some View {
        NavigationView{
            List(places) { place in
                HStack {
                    Image(place.photo)
                        .resizable()
                        .frame(maxWidth: 60, maxHeight: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    Text(place.name)
                        .font(.title3)
                }
                .swipeActions(edge: .leading){
                    Button{
                        //action
                        print("heart")
                    }label: {
                        Image(systemName: "heart")
                    }.tint(Color.green)
                }
                .swipeActions(edge:.trailing){
                    Button{
                        //action
                        print("Archive")
                    }label: {
                        Image(systemName: "archivebox")
                    }
                    .tint(.red)
                }
                .searchable(text: $search, placement: .navigationBarDrawer(displayMode: .always))
                    .onChange(of: search, perform: { value in
                        if !value.isEmpty && value.count >= 1{
                            places = places.filter{
                                $0.name.lowercased().hasPrefix(value.lowercased())
                            }
                        }else{
                            places = getPlaces()
                        }
                    } )
                    .listRowSeparator(.hidden)
                    
                
            }
            .listStyle(.inset)
            .navigationTitle("Places")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
