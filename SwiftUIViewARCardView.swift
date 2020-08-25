//
//  ContentView.swift
//  SwiftUIView
//
//  Created by Jose Fernandez del Valle on 8/24/20.
//  Copyright © 2020 me.fernandez.jose. All rights reserved.
//

import SwiftUI

// create structs for gauge charts

//progressbar1
struct ProgressBar: View {
    @Binding var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.3)
                .foregroundColor(Color.red)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            Text(String(min(0.019, 1.0)*100.0))
                .font(.title)
                .bold()
        }
    }
}


//progressbar2
struct ProgressBar2: View {
    @Binding var progress2: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.3)
                .foregroundColor(Color.red)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress2, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            Text(String(min(0.162, 1.0)*100.0))
                .font(.title)
                .bold()
        }
    }
}


//progressbar3
struct ProgressBar3: View {
    @Binding var progress3: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.3)
                .foregroundColor(Color.red)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress3, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            Text(String(min(0.452, 1.0)*100.0))
                .font(.title)
                .bold()
        }
    }
}



struct SwiftUIViewARCardView: View {
    
   // declare all needed variables
       @State var progressValue: Float = 0.750
       @State var progressValue2: Float = 0.805
       @State var progressValue3: Float = 0.800
       @State private var selectedItem = 1
       
       @State private var selectedItems = ["Max Speed", "Speed > 85%", "ACC / DEC"]
       
       @State private var bar1:CGFloat = 0
       @State private var bar2:CGFloat = 0
       @State private var bar3:CGFloat = 0
       @State private var bar4:CGFloat = 0
       @State private var bar5:CGFloat = 0
       @State private var bar6:CGFloat = 0
       @State private var bar7:CGFloat = 0
       @State private var bar8:CGFloat = 0
       @State private var bar9:CGFloat = 0
       @State private var bar10:CGFloat = 0
       @State private var bar11:CGFloat = 0
       @State private var bar12:CGFloat = 0
       
       //start view
       var body: some View {
           
          //overall stack
           ZStack{
               
               Color.black
                .edgesIgnoringSafeArea(.all)
               
               VStack{
                 
              //stack for icons on top
               ZStack{
                   
               HStack{
                   
                Rectangle().cornerRadius(20).frame(width: 120, height: 30).foregroundColor(.orange).opacity(0.9).padding(.horizontal, 81)
                   
               Spacer()
                   
                   }
                   
              HStack{
                
              Image("jose")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle().stroke(Color.red, lineWidth: 1))
                .padding(.horizontal, 15)
                
               Text("Mod Training").foregroundColor(.white).bold().padding(11)
               
               Spacer()
               
               Image(systemName: "battery.25").foregroundColor(.orange).padding(1)
               
               Image(systemName: "gauge.badge.minus").foregroundColor(.orange).padding(1)
               
               Image(systemName: "exclamationmark.triangle.fill").foregroundColor(.red).padding(8)
               
               
                   }
                
                   }
               
       
                   
            //stack for gauge charts
                   
               ZStack{
                   
                   Rectangle().cornerRadius(20).frame(width: 450, height: 200).foregroundColor(.white).padding(5)
               
               VStack{
                   
               HStack{
                    
                   Text("Strength").bold()
                   Text("           Speed          ").bold()
                   Text("VO2max").bold()
                   
                   }
                   
               HStack {
                   
                   ProgressBar(progress: self.$progressValue)
                       .frame(width: 80.0, height: 80.0)
                       .padding(10.0)
                   
                   
                   
                    ProgressBar2(progress2: self.$progressValue2)
                       .frame(width: 80.0, height: 80.0)
                       .padding(10.0)
                   
                   
                   
                    ProgressBar3(progress3: self.$progressValue3)
                       .frame(width: 80.0, height: 80.0)
                       .padding(10.0)
                   
               }
                   
                HStack{
                               
                   Text("    kgs/bw        ").foregroundColor(.gray)
                   Text("    kmh       ").foregroundColor(.gray)
                   Text("  mm.kg.min").foregroundColor(.gray)
                   }
                   
                   }
                   
                   }
                   
                   
                   
                   //stack for barchar
                   ZStack{
                       
                       
                       Rectangle().cornerRadius(20).frame(width: 450, height: 190).foregroundColor(.white).padding(5)
                                         
                   
                       
                   VStack{
                       
                       //picker input
                       Picker("", selection: $selectedItem) {
                                                 ForEach(0..<selectedItems.count){
                                                     Text("\(self.selectedItems[$0])")
                                                 }
                                                 
                                             }
                         
                       //function for picker input
                       .onReceive([self.selectedItem].publisher.first()) { value in
                           self.bars()}
                           .pickerStyle(SegmentedPickerStyle())
                           .padding(.horizontal, 24).padding(15)
                   
                   //designing the bars
                   ZStack{
                   HStack{
                   HStack(alignment: .bottom){
                       
                       Capsule().frame(width: 15, height: 100.0).foregroundColor(.gray).opacity(0.5)
                       Capsule().frame(width: 15, height: 100.0).foregroundColor(.gray).opacity(0.5)
                       Capsule().frame(width: 15, height: 100.0).foregroundColor(.gray).opacity(0.5)
                       Capsule().frame(width: 15, height: 100.0).foregroundColor(.gray).opacity(0.5)
                       Capsule().frame(width: 15, height: 100.0).foregroundColor(.gray).opacity(0.5)
                       Capsule().frame(width: 15, height: 100.0).foregroundColor(.gray).opacity(0.5)
                       
                       }
                       
                   HStack(alignment: .bottom){
                      
                       Capsule().frame(width: 15, height: 100.0).foregroundColor(.gray).opacity(0.5)
                       Capsule().frame(width: 15, height: 100.0).foregroundColor(.gray).opacity(0.5)
                       Capsule().frame(width: 15, height: 100.0).foregroundColor(.gray).opacity(0.5)
                       Capsule().frame(width: 15, height: 100.0).foregroundColor(.gray).opacity(0.5)
                       Capsule().frame(width: 15, height: 100.0).foregroundColor(.gray).opacity(0.5)
                       Capsule().frame(width: 15, height: 100.0).foregroundColor(.gray).opacity(0.5)
                       }
                       
                   }
                           
                       
                   HStack{
                   HStack(alignment: .bottom){
                                          
                       Capsule().frame(width: 15, height: self.bar1).foregroundColor(.red)
                       Capsule().frame(width: 15, height: self.bar2).foregroundColor(.red)
                       Capsule().frame(width: 15, height: self.bar3).foregroundColor(.red)
                       Capsule().frame(width: 15, height: self.bar4).foregroundColor(.red)
                       Capsule().frame(width: 15, height: self.bar5).foregroundColor(.red)
                       Capsule().frame(width: 15, height: self.bar6).foregroundColor(.red)
                       }
                                          
                   HStack(alignment: .bottom){
                                         
                       Capsule().frame(width: 15, height: self.bar7).foregroundColor(.red)
                       Capsule().frame(width: 15, height: self.bar8).foregroundColor(.red)
                       Capsule().frame(width: 15, height: self.bar9).foregroundColor(.red)
                       Capsule().frame(width: 15, height: self.bar10).foregroundColor(.red)
                       Capsule().frame(width: 15, height: self.bar11).foregroundColor(.red)
                       Capsule().frame(width: 15, height: self.bar12).foregroundColor(.red)

                       }
                                          
                   }
                       }
                   }
                   }
                   }.padding(20)
               
           }
           
           }
           
       
           
       
   //function for picker inputs to switch the bars
       func bars() {
       
           if selectedItems[selectedItem] == "Max Speed" {
               
           bar1 = 100.0
           bar2 = 74.0
           bar3 = 23.0
           bar4 = 56.0
           bar5 = 87.0
           bar6 = 10.0
           bar7 = 56.0
           bar8 = 48.0
           bar9 = 67.0
           bar10 = 34.0
           bar11 = 100
           bar12 = 75.0
           
           } else if selectedItems[selectedItem] == "Speed > 85%" {
           
            bar1 = 100
            bar2 = 34
            bar3 = 56
            bar4 = 34
            bar5 = 67
            bar6 = 35
            bar7 = 34
            bar8 = 67
            bar9 = 12
            bar10 = 100
            bar11 = 56
            bar12 = 76
               
           } else {
               
           bar1 = 40
           bar2 = 100
           bar3 = 30
           bar4 = 49
           bar5 = 34
           bar6 = 56
           bar7 = 89
           bar8 = 34
           bar9 = 59
           bar10 = 29
           bar11 = 12
           bar12 = 100
               
           }
       
   }
       
}


struct SwiftUIViewARCardView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewARCardView()
    }
}
