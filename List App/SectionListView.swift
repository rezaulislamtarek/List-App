//
//  SectionListView.swift
//  List App
//
//  Created by Rezaul Islam on 10/7/23.
//

import SwiftUI

struct Taskk : Identifiable{
    let id = UUID()
    let name : String
    var isComplite : Bool = false
}

enum Sections : String, CaseIterable {
    case pending = "Pending"
    case completed = "Completed"
}

struct SectionListView: View {
    @State private var tasks = [Taskk(name: "Swift"), Taskk(name: "SwiftUI", isComplite: true), Taskk(name: "SDK"), Taskk(name: "Packages", isComplite: true), Taskk(name: "Library"),]
    
    private var pendingTask: [Binding<Taskk>] {
        $tasks.filter{ !$0.isComplite.wrappedValue}
    }
    private var complitedTask: [Binding<Taskk>] {
        $tasks.filter{  $0.isComplite.wrappedValue}
    }
    
    var body: some View {
        List{
            ForEach(Sections.allCases, id: \.self){ section in
                Section{
                    
                    ForEach(section == .pending ? pendingTask : complitedTask) { $task in
                        /*@START_MENU_TOKEN@*/Text(task.name)/*@END_MENU_TOKEN@*/
                    }
                    
                } header: {
                    Text(section.rawValue)
                }
            }
        }
    }
}

struct SectionListView_Previews: PreviewProvider {
    static var previews: some View {
        SectionListView()
    }
}
