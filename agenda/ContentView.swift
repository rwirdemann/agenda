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
    
    init(description: String) {
        self.description = description
    }
}

struct ItemView: View {
    let item: Item
    
    var body: some View {
        HStack(spacing: 10) {
            Text(item.description)
        }
    }
    
    init(item: Item) {
        self.item = item
    }
}

struct DetailsView: View {
    let list: ItemList
    var body: some View {
        List  {
            ForEach(list.items) { item in
                ItemView(item: item)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
}
