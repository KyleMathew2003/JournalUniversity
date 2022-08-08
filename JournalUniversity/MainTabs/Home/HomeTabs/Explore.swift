//
//  Explore.swift
//  JournalUniversity
//
//  Created by Kyle Mathew on 8/7/22.
//

import SwiftUI

struct Explore: View {
    var body: some View {
            ScrollView{
                VStack{
                    ForEach(0...5,id:\.self){_ in
                        StudiesCardView(BannerText: "2022 Journal of Economics", shouldPresent: .constant(true))
                    }
                }
            }
            .background(Color("BackgroundColor"))
        
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}
