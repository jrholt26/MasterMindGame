//File: ContentView
//Jackson Holt
//CS 3164, Winter 2024
//
//  ContentView.swift
//  MasterMindGame
//
//  VIEW
//
//  Created by Jackson Holt on 1/16/24.
// this is the view file for what the master mind game will look like
//

import SwiftUI

//array of colors for the circles
let colorArray = [Color.red, Color.green, Color.blue, Color.yellow, Color.purple, Color.orange]

struct ContentView: View {
    
    //viewable classs view model 
    @ObservedObject var vm = ViewModel()
    
    var body: some View {
        
        HStack {
            //foreach for all the circles
            ForEach(vm.circleOptions) {thisCircle in
                CircleOptionView(colorInt: thisCircle.id, isSelected: thisCircle.isSelected)
                   //on the tap we get to see the circles outline bold when it is selected and unbolcd when it is not
                    .onTapGesture(perform: {
                        //choose a circle
                        vm.chooseCircle(circleNumber: thisCircle.id)
                        print("VIEW: trying to choose letter number \(thisCircle.id)")
                    })
            }
        }
        .padding()
        
    }
    
    //struct that holds all of the data for and states of the cirlces
    struct CircleOptionView: View {
        var colorInt : Int
        var isSelected: Bool
        
        var body: some View{
            ZStack{
                //background circle
                Circle()
                    .stroke(lineWidth: isSelected ? 12 : 6 )
                    .foregroundColor(Color.black)
               //main circle
                Circle()
                    .foregroundColor(colorArray[colorInt])
                    
            }
        }
        
        
        
    }
       
}


                    
                    
                    
                    
                    
                    
#Preview {
    ContentView()
}
