//
//  ContentView.swift
//  agenda
//
//  Created by Ralf Wirdemann on 09.10.20.
//

import SwiftUI

struct ContentView: View {
    let lists = TestData.lists()
    
    var body: some View {
        NavigationView {
             List {
                ForEach(lists) { list in
                    NavigationLink(destination: DetailsView(list: list)) {
                        Text("\(list.name)")
                     }
                }
             }
             .listStyle(SidebarListStyle())
             .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct ItemList: Identifiable {
    var id: String = UUID().uuidString
    
    let name: String
    var items: [Item] = []
    
    init(name: String) {
        self.name = name
    }
}

struct Item: Identifiable {
    var id: String = UUID().uuidString
    
    let description: String
    var completed: Bool
    
    init(description: String) {
        self.description = description
        self.completed = false
    }
}

struct ItemView: View {
    @State var item: Item
    
    var body: some View {
        HStack(spacing: 6) {
            if item.completed {
                Circle()
                    .fill(Color.blue)
                    .frame(width:14, height:14, alignment: .center).onTapGesture {
                        self.item.completed = false
                    }
            } else {
                Circle()
                    .frame(width:14, height:14, alignment: .center).onTapGesture {
                        self.item.completed = true
                    }
            }
            Text(item.description)
        }
    }
}

struct DetailsView: View {
    @State var list: ItemList
    
    var body: some View {
        VStack {
            Button(action: {
                self.list.items.append(Item(description: "Neues Item"))
            }) {
                Text("Neu...")
            }
            List  {
                ForEach(list.items) { item in
                    ItemView(item: item)
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

struct TestData {
    static func lists() -> [ItemList] {
        var inbox = ItemList(name: "Inbox")
        inbox.items.append(Item(description: "Mit Tobi telefonieren"))
        inbox.items.append(Item(description: "Handschuhe kaufen"))

        var today = ItemList(name: "Heute")
        today.items.append(Item(description: "Evgeny anrufen"))
        today.items.append(Item(description: "Intersoft Herkules Meeting"))

        var planned = ItemList(name: "Geplant")
        planned.items.append(Item(description: "Coma in Fitness umbennen"))
        planned.items.append(Item(description: "Beschreibung ausliefern"))

        return [inbox, today, planned]
    }
    
    static func toggle(item: Item)  {
        print("Here I am")
    }
}
