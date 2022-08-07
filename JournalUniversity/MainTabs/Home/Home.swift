//
//  Home.swift
//  JournalUniversity
//
//  Created by Kyle Mathew on 8/7/22.
//

import SwiftUI

struct Home: View {
    @State var HomeTabSelectedIndex = 0
    var TopBarOptions: [String] = ["My Explore", "Following"]
    var body: some View {
        NavigationView{
            VStack(spacing:15){
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
                
                HStack{
                    ForEach(Array(zip(self.TopBarOptions.indices,self.TopBarOptions)),
                            id:\.0,
                            content:{
                        index,name in
                        TopBarItem(HomeTabSelectedIndex:self.$HomeTabSelectedIndex,TopBarName:name, toptab:index)
                    }
                    )
                }
                .padding(.horizontal,15)

                
                TabView(selection: self.$HomeTabSelectedIndex){
                    Explore().tag(0)
                    Following().tag(1)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
               
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            
            .background(Color("BackgroundColor"))
            
            .navigationBarHidden(true)
        }
    }
}

struct TopBarItem: View {
    @Binding var HomeTabSelectedIndex: Int
    var TopBarName: String
    var toptab: Int
    
    var body: some View {
        Button{
            self.HomeTabSelectedIndex = toptab
        } label: {
            VStack{
                Text(TopBarName)
                    .foregroundColor(.white)
                    .fontWeight(HomeTabSelectedIndex == toptab ?
                        .bold:.regular)
                    .frame(maxWidth:.infinity)
            }
            .onTapGesture {
                withAnimation(.easeInOut){
                    self.HomeTabSelectedIndex = toptab
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
