//
//  ContentView.swift
//  List App
//
//  Created by Rezaul Islam on 10/7/23.
//

import SwiftUI

struct Task : Identifiable{
    var id = UUID()
    var taskName:String
    var isComplite:Bool
}

struct ContentView: View {
    
    @State var taskList : [Task] = [
        Task(taskName: "Learn Swift", isComplite: false),
        Task(taskName: "Build SDK", isComplite: false),
        Task(taskName: "SwiftUI implimentation", isComplite: false)
    ]
    
    @State var task : String = ""
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                TextField("Enter A Task", text:  $task)
                    .padding()
                Button("Add Task"){
                    taskList.append(Task(taskName: task, isComplite: false))
                    task = ""
                }
            }.padding()
            List($taskList){ $item in
                HStack(){
                    Image(systemName: item.isComplite ? "checkmark.square.fill" : "square")
                    Text(item.taskName)
                    Spacer()
                }.containerShape(Rectangle())
                    .frame(maxWidth: .infinity)
                 
                .onTapGesture {
                    item.isComplite.toggle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
