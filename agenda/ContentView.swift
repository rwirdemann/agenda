//
//  ContentView.swift
//  agenda
//
//  Created by Ralf Wirdemann on 09.10.20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
             List {
                NavigationLink(destination: DetailsView(list: "Inbox")) {
                    Text("Inbox")
                 }
                NavigationLink(destination: DetailsView(list: "Today")) {
                    Text("Today")
                }
             }
             .listStyle(SidebarListStyle())
             .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct DetailsView: View {
    let list: String
    var body: some View {
        VStack {
            Text(list)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
