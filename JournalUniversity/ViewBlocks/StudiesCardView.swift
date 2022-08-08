//
//  StudiesCardView.swift
//  JournalUniversity
//
//  Created by Kyle Mathew on 8/7/22.
//

import SwiftUI

struct StudiesCardView: View {
    @State var BannerText: String = "2020 Economics Journal"
    @Binding var shouldPresent: Bool
    var body: some View {
        VStack(alignment:.leading,spacing:8){
            HStack(){
                Circle()
                    .frame(width:35,height:35)
                    .foregroundColor(Color("Accent"))
                VStack(alignment:.leading){
                    HStack{
                        Text("Kyle T Mathew")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Text("@JCR")
                            .font(.caption)
                    }
                    HStack{
                        Text("StudyU CEO")
                            .font(.caption2)
                    }
                }
                .foregroundColor(.white)
                Spacer()
            }
            .frame(maxWidth:.infinity)
            if BannerText != "" {
                HStack {
                    Spacer()
                    Button {
                        
                    }label:{
                        Text(BannerText)
                            .font(.footnote)
                            .foregroundColor(.black)
                            .padding(.horizontal,8)
                            .padding(.vertical,2)
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .foregroundColor(.white)
                                    .opacity(0.75)
                        )
                        
                }
                    Spacer()
                }
            }
            Text("Classroom experiment, Finding the effects of stronger salary negotiation skills on final salaries.")
                .foregroundColor(.white)
            HStack{
                Button{
                    
                } label:{
                    VStack {
                        Image(systemName: "heart")
                        Text("Like")
                            .font(.caption)
                    }
                }
                .frame(maxWidth:.infinity)
                Button{
                    
                } label:{
                    VStack {
                        Image(systemName: "message")
                        Text("Comment")
                            .font(.caption)
                    }
                }
                .frame(maxWidth:.infinity)
                Button{
                    
                } label:{
                    VStack {
                        Image(systemName: "arrowshape.turn.up.right")
                        Text("Share")
                            .font(.caption)
                    }
                }
                .frame(maxWidth:.infinity)
            }
            .foregroundColor(.white)
            HStack{
                Button {
                    
                }label:{
                    Text("Economics")
                        .lineLimit(1)
                        .font(.footnote)
                        .foregroundColor(.black)
                        .padding(.horizontal,8)
                        .padding(.vertical,2)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(.white)
                                .opacity(0.75)
                    )
                    
            }
                Button {
                    
                }label:{
                    Text("Social Science")
                        .lineLimit(1)
                        .font(.footnote)
                        .foregroundColor(.black)
                        .padding(.horizontal,8)
                        .padding(.vertical,2)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(.white)
                                .opacity(0.75)
                    )
                    
            }

            }
            Divider()
                .frame(height:0.5)
                .overlay(.gray)
                .padding(.top,5)
            
        }
        .padding(.horizontal,15)
        .padding(.bottom,5)
    }
}

struct StudiesCardView_Previews: PreviewProvider {
    static var previews: some View {
        StudiesCardView(shouldPresent: .constant(true))
    }
}
