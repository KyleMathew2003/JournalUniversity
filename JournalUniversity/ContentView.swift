//
//  ContentView.swift
//  JournalUniversity
//
//  Created by Kyle Mathew on 8/7/22.
//

import SwiftUI

struct ContentView: View {
    @State var MainTabSelectedIndex = 0
    @State var ShowactionSheet = false
    @State var oldSelectedIndex = 0

    var body: some View {
            TabView(selection: $MainTabSelectedIndex){
                Home()
                    .onAppear{
                        self.oldSelectedIndex = self.MainTabSelectedIndex
                    }
                    .tabItem{
                        Image(systemName: "house")
                    }
                Communities()
                    .onAppear{
                        self.oldSelectedIndex = self.MainTabSelectedIndex
                    }
                    .tabItem{
                        Image(systemName: "book")
                    }
                Text("")
                    .onAppear{
                        self.MainTabSelectedIndex = self.oldSelectedIndex
                        self.ShowactionSheet.toggle()
                    }
                    .tabItem{
                        Image(systemName: "plus")
                    }
                Messages()
                    .onAppear{
                        self.oldSelectedIndex = self.MainTabSelectedIndex
                    }
                    .tabItem{
                        Image(systemName: "message")
                    }
                Profile()
                    .onAppear{
                        self.oldSelectedIndex = self.MainTabSelectedIndex
                    }
                    .tabItem{
                        Image(systemName: "person")
                    }
            }
            .fullScreenCover(isPresented: $ShowactionSheet, content: Add.init)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
