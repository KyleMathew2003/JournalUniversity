//
//  Messages.swift
//  JournalUniversity
//
//  Created by Kyle Mathew on 8/7/22.
//

import SwiftUI

struct Messages: View {
    var body: some View {
        NavigationView{
            VStack{
                Button{
                    
                } label:{
                    Text("Search")
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.horizontal)
                .background(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(lineWidth: 0.8)
                    .foregroundColor(.gray)
                    .frame(height:25)
                    
                )
                .padding(.horizontal)
                Spacer()
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            
            .background(Color("BackgroundColor"))
            
            .navigationBarHidden(true)
        }
    }
}

struct Messages_Previews: PreviewProvider {
    static var previews: some View {
        Messages()
    }
}
