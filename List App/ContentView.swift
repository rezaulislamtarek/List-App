//
//  ContentView.swift
//  List App
//
//  Created by Rezaul Islam on 10/7/23.
//

import SwiftUI

 

struct ContentView: View {
    
    @State var dateList : [Date] = []
    
    var body: some View {
        NavigationView{
            List(dateList, id: \.self){ date in
                Text("\(date)")
            }
            .refreshable {
                DispatchQueue.main.asyncAfter(deadline:.now()+1.0){
                    dateList.append(Date())
                }
            }
            .navigationTitle("Pull To refresh")
            .listStyle(.inset)
             
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
