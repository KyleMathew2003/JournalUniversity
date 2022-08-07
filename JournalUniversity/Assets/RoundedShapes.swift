//
//  ConcaveConvexShape.swift
//  JournalUniversity
//
//  Created by Kyle Mathew on 8/7/22.
//

import Foundation
import SwiftUI

struct topConcaveConvexShape: Shape {
    var radius: Int
    func path(in rect: CGRect) -> Path {
        Path {path in
            path.move(to:CGPoint(x:0,
                                 y:0))
            path.addLine(to: CGPoint(x:rect.maxX,
                                     y:0))
            path.addArc(center: CGPoint(x:CGFloat(CGFloat(rect.maxX) - CGFloat(radius)),
                                        y:CGFloat(CGFloat(rect.maxY) - CGFloat(radius))),
                        radius: CGFloat(radius),
                        startAngle: Angle(degrees:0),
                        endAngle: Angle(degrees:90),
                        clockwise: false)
            path.addArc(center: CGPoint(x:CGFloat(radius),
                                        y:CGFloat(CGFloat(rect.maxY) + CGFloat(radius))),
                        radius: CGFloat(radius),
                        startAngle: Angle(degrees:270),
                        endAngle: Angle(degrees:180),
                        clockwise: true)
        
        }
    }
}

struct bottomConcaveConvexShape: Shape {
    var radius: Int
    func path(in rect: CGRect) -> Path {
        Path {path in
            path.move(to:CGPoint(x:rect.minX,y:rect.maxY))
            path.addLine(to:CGPoint(x:rect.maxX,y:rect.maxY))
            path.addArc(
                center: CGPoint(
                    x:CGFloat(rect.maxX) - CGFloat(radius),
                    y:CGFloat(rect.minY) - CGFloat(radius)
                ),
                radius: CGFloat(radius),
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 90),
                clockwise: false)
            path.addArc(
                center: CGPoint(
                    x: CGFloat(radius),
                    y: CGFloat(radius)),
                        radius: CGFloat(radius),
                        startAngle: Angle(degrees: 270),
                        endAngle: Angle(degrees: 180),
                        clockwise: true)
        
        }
    }
}

struct RoundedShapes_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing:50){
            Text("hey")
                .frame(width: 100, height: 100)
                .background(bottomConcaveConvexShape(radius: 50))
        Text("hey")
                .foregroundColor(.white)
                .padding(.horizontal,100)
                .padding(.vertical)

            .background(topConcaveConvexShape(radius: 50))
        Text("hey")
                .foregroundColor(.white)
                .padding(.horizontal,100)
                .padding(.vertical)
                .background(bottomConcaveConvexShape(radius: 50))
        }
    }
}
