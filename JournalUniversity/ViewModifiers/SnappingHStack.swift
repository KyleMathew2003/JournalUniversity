//
//  SnappingHStack.swift
//  JournalUniversity
//
//  Created by Kyle Mathew on 8/9/22.
//

import SwiftUI

struct SnappingHStackModifier: ViewModifier {
    @Binding private var scrollOffset :CGFloat
    @Binding private var selectedProfilePostTypes: ProfilePostsTypes
    @Binding var selectedIndex:Int

    @State private var dragOffset: CGFloat
    var itemCount: Int
    @State var InitialOffset:CGFloat
    @Binding var ButtonOffset: CGFloat
    @State var oldIndex: Int
    @State var index: CGFloat
    var itemWidth: CGFloat
    var itemSpacing: CGFloat
    
    init(itemCount:Int, itemWidth: CGFloat, itemSpacing:CGFloat,ButtonOffset: Binding<CGFloat>,scrollOffset: Binding<CGFloat>,selectedProfilePostTypes: Binding<ProfilePostsTypes>,selectedIndex: Binding<Int>) {
        self.itemCount = itemCount
        self.itemWidth = itemWidth
        self.itemSpacing = itemSpacing
        self.oldIndex = itemCount - 1
        self.index = CGFloat(itemCount)
        
        let contentWidth: CGFloat = CGFloat(itemCount) * itemWidth + CGFloat(itemCount-1) * itemSpacing
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        

        let initialOffset = (contentWidth/2.0) - (screenWidth/2.0) + ((screenWidth-itemWidth))
                
        self._scrollOffset = scrollOffset
        self._dragOffset = State(initialValue: 0)
        self._ButtonOffset = ButtonOffset
        self._InitialOffset = State(initialValue: initialOffset)
        self._selectedProfilePostTypes = selectedProfilePostTypes
        self._selectedIndex = selectedIndex
    }
    
    func body(content: Content) -> some View {
        content
            .offset(x: scrollOffset + dragOffset, y: 0)
            .gesture(DragGesture()
                .onChanged({ event in
                    dragOffset = event.translation.width
                    
                    

                })
                    .onEnded({ event in
                       
                        InitialOffset = 0
                        scrollOffset += ButtonOffset
                        ButtonOffset = 0
                        scrollOffset += event.translation.width
                        dragOffset = 0
                        
                        let contentWidth: CGFloat = CGFloat(itemCount) * itemWidth + CGFloat(itemCount-1)*itemSpacing
                        
                        let screenWidth: CGFloat = UIScreen.main.bounds.width
                        
                        let midpoint = scrollOffset + (contentWidth / 2.0)
                        
                        index = (midpoint) / (itemWidth + itemSpacing)
                        
                        if index - 0.5 < CGFloat(oldIndex){
                            if CGFloat(oldIndex) - (index - 0.5) > 0.05 {
                                oldIndex -= 1
                                index = CGFloat(oldIndex)
                            } else{
                                index = CGFloat(oldIndex)
                            }
                        } else{
                            if (index - 0.5) - CGFloat(oldIndex) > 0.05 {
                                oldIndex += 1
                                index = CGFloat(oldIndex)
                            } else{
                                index = CGFloat(oldIndex)
                            }
                        }
                        
                        index = min(index, CGFloat(itemCount) - 1)
                        index = max(index, 0)

                        var newOffset = index * itemWidth + (index - 1) * itemSpacing - (contentWidth/2.0) + (screenWidth/2.0) - ((screenWidth - itemWidth) / 2.0) + itemSpacing
                        
                        newOffset = min(newOffset,  585)
                        newOffset = max(newOffset, -585)
                        if newOffset == 585 {
                            selectedProfilePostTypes = .studies
                            selectedIndex = 0
                        }
                        if newOffset == 195 {
                            selectedProfilePostTypes = .comments
                            selectedIndex = 1
                        }
                        if newOffset == -195 {
                            selectedProfilePostTypes = .liked
                            selectedIndex = 2
                        }
                        if newOffset == -585{
                            selectedProfilePostTypes = .saved
                            selectedIndex = 3
                        }
                        
                        withAnimation{
                            scrollOffset = newOffset
                        }
                        
                    })
            )
    }
}

struct SnappingHStack_Previews: PreviewProvider {
    static var previews: some View {
            HStack(spacing:0){
                Text("hey")
                    .frame(width:UIScreen.main.bounds.width)
                    .background(.purple)

                Text("hey")
                    .frame(width:UIScreen.main.bounds.width)
                    .background(.pink)

                Text("hey")
                    .frame(width:UIScreen.main.bounds.width)
                    .background(.yellow)

                Text("hey")
                    .frame(width:UIScreen.main.bounds.width)
                    .background(.blue)
            }.modifier(SnappingHStackModifier(itemCount: 4,itemWidth: UIScreen.main.bounds.width,itemSpacing: 0, ButtonOffset: .constant(10), scrollOffset: .constant(10), selectedProfilePostTypes: .constant(.studies), selectedIndex: .constant(2)))
        }
    }

struct SnappingHStack: View {
    @State var ButtonOffset: CGFloat = 10
    @State var scrollOffset: CGFloat = 0

    var body: some View {
        VStack {
            Button{
                    self.scrollOffset = CGFloat(90)
                
            }label:{
                Text("ahysg")
            }
            HStack(spacing:0){
                Text("hey")
                    .frame(width:UIScreen.main.bounds.width)
                    .background(.purple)

                Text("hey")
                    .frame(width:UIScreen.main.bounds.width)
                    .background(.pink)

                Text("hey")
                    .frame(width:UIScreen.main.bounds.width)
                    .background(.yellow)

                Text("hey")
                    .frame(width:UIScreen.main.bounds.width)
                    .background(.blue)
            }.modifier(SnappingHStackModifier(itemCount: 4,itemWidth: UIScreen.main.bounds.width,itemSpacing: 0, ButtonOffset: $ButtonOffset, scrollOffset: $scrollOffset, selectedProfilePostTypes: .constant(.saved), selectedIndex: .constant(1)))
        }
    }
}
