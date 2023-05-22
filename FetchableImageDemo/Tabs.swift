//
//  Tabs.swift
//  FetchableImageDemo
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import SwiftUI

struct Tabs: View {
    var body: some View {
        TabView {
            RandomContactView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Random")
            }
            
            ContactListView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Contact List")
            }
            
            ContactListView(fetchAsyncImages: true)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Contact List Async")
            }
        }
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
