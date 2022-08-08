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
                    
                    VStack{
                        HStack {
                            Text("Followers: 2020")
                                .foregroundColor(.white)
                            Spacer(minLength: 10)
                            
                            Text("Following: 2020")
                        }
                        .font(.caption2)
                        .foregroundColor(.white)
                        .padding(.horizontal,8)
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
                .previewDevice("iPhone 11")
            Profile()
            Profile()
                .previewDevice("iPod touch (7th generation)")
        }
    }
}
