//
//  SwiftUIView.swift
//  FractalKochSnowflake
//
//  Created by Derek Rhea on 2/24/21.
//

import SwiftUI

struct DrawSnowflake: View {
    
    var body: some View {
        ZStack {
            SnowflakeBorder()
        }
    }
}

struct SnowflakeBorder: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: 50))
        path.addLine(to: CGPoint(x: 100, y:50))
        path.addLine(to: CGPoint(x: 50, y: 150))
        path.addLine(to: CGPoint(x: 0, y: 50))
        
        let scale = (rect.width / 100)*(8/10)
        let xoffset = (rect.width * (1/10))
        let yoffset = ((rect.height-150*scale) * (1/10))
        
        
        
        return path.applying(CGAffineTransform(scaleX: scale,y: scale)).applying(CGAffineTransform(translationX: xoffset, y: yoffset))
    }
    
}





struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DrawSnowflake()
    }
}
