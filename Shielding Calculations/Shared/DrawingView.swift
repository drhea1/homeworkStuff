//
//  DrawingView.swift
//  Monte Carlo Integration
//
//  Created by Jeff Terry on 12/31/20.
//

import SwiftUI

struct drawingView: View {
    
    @Binding var redLayer : [(xPoint: Double, yPoint: Double)]
    
    var body: some View {
    
        
        ZStack{
        
            drawBox()
                .stroke(Color.black, style: StrokeStyle(lineWidth: 5))
                .aspectRatio(1, contentMode: .fit)
            drawIntegral(drawingPoints: redLayer)
                .stroke(Color.red)
                .aspectRatio(1, contentMode: .fit)
        }
        .background(Color.white)
        .aspectRatio(1, contentMode: .fit)
        .frame(minWidth: 500, maxWidth: 500, minHeight: 500, maxHeight: 500)
        
    }
}

struct DrawingView_Previews: PreviewProvider {
    
    @State static var redLayer : [(xPoint: Double, yPoint: Double)] = [(-0.5, 0.5), (0.5, 0.5), (0.0, 0.0), (0.0, 1.0)]
    
    static var previews: some View {
       
        
        drawingView(redLayer: $redLayer)
            .aspectRatio(1, contentMode: .fill)
            //.drawingGroup()
           
    }
}

struct drawBox: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: 0.1*rect.width, y: 0.1*rect.width))
        path.addLine(to: CGPoint(x: 0.5*rect.width, y: 0.1*rect.width))
        path.addLine(to: CGPoint(x: 0.5*rect.width, y: 0.9*rect.width))
        path.addLine(to: CGPoint(x: 0.1*rect.width, y: 0.9*rect.width))
        path.addLine(to: CGPoint(x: 0.1*rect.width, y: 0.1*rect.width))
        
        //let scale = (rect.width / 170) * (4/10)
        //let xoffset =
        //let yoffset =
        
        return path
        //return path.applying(CGAffineTransform(scaleX: scale, y:scale))
            //.applying(CGAffineTransform(translationX: xoffset, y: yoffset))
        
    }
}

struct drawIntegral: Shape {
    
   
    let smoothness : CGFloat = 1.0
    var drawingPoints: [(xPoint: Double, yPoint: Double)]  ///Array of tuples
    
    func path(in rect: CGRect) -> Path {
        
               
        // draw from the center of our rectangle
        //let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        //let scale = rect.width/2
        

        // Create the Path for the display
        
        var path = Path()
        
        for item in drawingPoints {
            
            //path.addRect(CGRect(x: item.xPoint*Double(scale)+Double(center.x), y: item.yPoint*Double(scale)+Double(center.y), width: 1.0 , height: 1.0))
            //let xPointParam = (item.xPoint / 5.0)
            //let yPointParam = (item.yPoint / 10.0)
            //let yRecParam = 0.8*Double(rect.width)
            //let xRecParam = 0.1*Double(rect.width)
            
            
            path.addRect(CGRect(x: (item.xPoint / 5.0)*(0.4*Double(rect.width)) + 0.1*Double(rect.width), y: (item.yPoint / 10.0)*(0.8*Double(rect.width)) + 0.1*Double(rect.width), width: 1.0 , height: 1.0))

        }


        return (path)
    }
}
