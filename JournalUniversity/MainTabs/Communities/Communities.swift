//
//  Home.swift
//  JournalUniversity
//
//  Created by Kyle Mathew on 8/7/22.
//

import SwiftUI

struct Communities: View {
    @State var CommunitiesTabSelectedIndex = 0
    var CommunitiesTopBarOptions: [String] = ["My Journals", "Associations"]
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
                    ForEach(Array(zip(self.CommunitiesTopBarOptions.indices,self.CommunitiesTopBarOptions)),
                            id:\.0,
                            content:{
                        index,name in
                        CommunitiesTopBarItem(CommunitiesTabSelectedIndex:self.$CommunitiesTabSelectedIndex,CommunitiesTopBarName:name, Communitiestoptab:index)
                    }
                    )
                }
                .padding(.horizontal,15)

                
                TabView(selection: self.$CommunitiesTabSelectedIndex){
                    Journals().tag(0)
                    Associations().tag(1)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
               
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            
            .background(Color("BackgroundColor"))
            
            .navigationBarHidden(true)
        }
    }
}

struct CommunitiesTopBarItem: View {
    @Binding var CommunitiesTabSelectedIndex: Int
    var CommunitiesTopBarName: String
    var Communitiestoptab: Int
    
    var body: some View {
        Button{
            self.CommunitiesTabSelectedIndex = Communitiestoptab
        } label: {
            VStack{
                Text(CommunitiesTopBarName)
                    .foregroundColor(.white)
                    .fontWeight(CommunitiesTabSelectedIndex == Communitiestoptab ?
                        .bold:.regular)
                    .frame(maxWidth:.infinity)
            }
            .onTapGesture {
                withAnimation(.easeInOut){
                    self.CommunitiesTabSelectedIndex = Communitiestoptab
                }
            }
        }
    }
}

struct Communities_Previews: PreviewProvider {
    static var previews: some View {
        Communities()
    }
}
