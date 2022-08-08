//
//  Add.swift
//  JournalUniversity
//
//  Created by Kyle Mathew on 8/7/22.
//

import SwiftUI

struct Add: View {
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            .background(Color("BackgroundColor"))
            .navigationBarHidden(true)
        }
    }
}

struct Add_Previews: PreviewProvider {
    static var previews: some View {
        Add()
    }
}
