//
//  Profile.swift
//  JournalUniversity
//
//  Created by Kyle Mathew on 8/7/22.
//

import SwiftUI

struct Profile: View {
    private let imageHeight: CGFloat = UIScreen.main.bounds.width/2.4
    private let collapsedHeight: CGFloat = UIScreen.main.bounds.height/10
    
    
    
    private func ScrollOffset(_ geometry:GeometryProxy) -> CGFloat {
        geometry.frame(in: .global).minY
    }
    private func getOpacity(_ geometry: GeometryProxy) -> CGFloat{
        let offset = ScrollOffset(geometry)
        
        if offset < 0 {
            let NewOpacity = 1 + offset/40
            return NewOpacity
        }
        return 1
    }
    
    private func HeaderImageOffset(_ geometry: GeometryProxy) -> CGFloat {
        let offset = ScrollOffset(geometry)
        let sizeOffScreen = imageHeight - collapsedHeight
        
        if offset < -sizeOffScreen {
            let imageOffset = abs(min(-sizeOffScreen,offset))
        
        return imageOffset - sizeOffScreen
        }
        if offset > 0 {
            return -offset
        }
        return 0
    }
    
    private func HeaderItemsOffset(_ geometry: GeometryProxy) -> CGFloat {
        let offset = ScrollOffset(geometry)
    
        if offset > 0 {
            return -offset
        }
        return 0
    }
    
    private func HeaderImageHeight(_ geometry: GeometryProxy) -> CGFloat {
        let offset = ScrollOffset(geometry)
        let imageHeight = geometry.size.height
        
        if offset > 0 {
            return imageHeight + offset
        }
        return imageHeight
    }
    
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack{
                    HStack {
                        Button{
                            
                        } label:{
                            Text("Search")
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.horizontal)
                        .background(
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.black)
                            .opacity(0.3)
                            .frame(height:25)
                        )
                        Button{
                            
                        } label:{
                            Image(systemName: "gear")
                                .resizable()
                                .frame(width:17,height:17)
                                .foregroundColor(.white)
                        }
                        .frame(width:25,height:25)
                        .background(
                            Circle()
                                .foregroundColor(.black)
                                .opacity(0.3)
                        )
                    }
                    .padding(.horizontal)

                    Spacer()
                }
                .zIndex(1)
                .frame(maxWidth:.infinity)
                
                ScrollView{
                    GeometryReader{ geometry in
                        ZStack(alignment:.bottom) {
                            Rectangle()
                                .foregroundColor(Color("Accent"))
                                .frame(width: geometry.size.width, height: self.HeaderImageHeight(geometry))
                                .offset(x:0, y:self.HeaderImageOffset(geometry))
                                .overlay(
                                    ZStack{
                                        VStack {
                                            Spacer()
                                            HStack{
                                                Spacer()
                                                Text("Edit")
                                                    .font(.footnote)
                                                    .foregroundColor(.white)
                                                    .padding(.vertical,5)
                                                    .padding(.horizontal,8)
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 25)
                                                            .opacity(0.3)
                                                    )
                                                    .offset(x:0, y:self.HeaderItemsOffset(geometry))
                                                .opacity(self.getOpacity(geometry))
                                            }
                                        }
                                        .padding(10)
                                        VStack {
                                            Spacer()
                                            HStack {
                                                Circle()
                                                    .frame(width:imageHeight/2,height: imageHeight/2)
                                                .offset(x:0, y:20+self.HeaderItemsOffset(geometry))
                                            .opacity(self.getOpacity(geometry))
                                            }
                                        }
                                    }
                                )
                        }
                    }
                    .frame(height:imageHeight)
                        .zIndex(1)
                    
                    VStack(spacing:2){
                        HStack {
                            Text("Followers: 2020")
                            Spacer(minLength: 10)
                            Text("Following: 2020")
                        }
                        .font(.custom("Following", size: UIScreen.main.bounds.width/27))
                        .foregroundColor(.white)
                        .padding(.horizontal,10)
                        Text("Kyle T Mathew")
                            .font(.custom("Name", size: UIScreen.main.bounds.width/17)
                            )
                            .foregroundColor(.white)
                        Text("JournalU CEO")
                            .foregroundColor(.white)
                            .font(.custom("Title", size: UIScreen.main.bounds.width/21))
                        HStack{
                            Text("Full Stack developer and future economist, looking to use his skills to get into grad school, and eventually earn a PhD from one of the best universities ever, UChicago.")
                            Spacer(minLength: 0)
                        }
                        .padding(.leading,10)
                        .padding(.horizontal,15)
                        .foregroundColor(.white)
                        HStack{
                            Text("Joined on: 08-07-2022")
                            Spacer()
                            Text("Studies Published: 20")
                        }
                        .padding(.top,8)
                        .font(.custom("ProfileData", size: UIScreen.main.bounds.width/30))
                        .padding(.horizontal,10)
                        .foregroundColor(.white)
                        
                        
                        
                    }
                    .zIndex(0)
                   
                    

                }

                .background(Color("BackgroundColor"))
                .ignoresSafeArea()

                
            }
            .navigationBarHidden(true)
            
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           
            Profile()
                .previewInterfaceOrientation(.portrait)
                .previewLayout(.device)
                .previewDevice("iPhone 11")
            Profile()
                .previewDevice("iPod touch (7th generation)")
        }
    }
}
