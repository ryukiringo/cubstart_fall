//
//  ContentView.swift
//  SwiftUI_BullseyeApp
//
//  Created by 柳澤琉貴 on 2022/10/07.
//

import SwiftUI

struct ContentView: View {
    @State private var slideValue: Double = 50
    @State private var exactMode: Bool = false
    @State private var randomNumber: Int = 0
    @State private var highScore:Int = 0
    @State private var currentLevel: Int = 1
    @State private var resultLabel: String = "Move the slider to:"
    @State private var slideValueMaximum: Double = 100
    var body: some View {
        VStack() {
            HStack() {
                VStack() {
                    Text("High Score")
                    Text("\(highScore)")
                }
                .padding(.leading,20)
                Spacer()
                
                VStack() {
                    Text("Current Level")
                    Text("\(currentLevel)")
                }
                .padding(.trailing, 20)
            }
            Spacer()
            VStack() {
                Text("\(resultLabel)").font(.system(size:30))
                Text("\(randomNumber)").font(.system(size:30))
                Slider(value: $slideValue, in: 1...slideValueMaximum).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                Button("Check") {
                    if exactMode == false {
                        if randomNumber - 3 <= Int(slideValue)&&randomNumber + 3 >= Int(slideValue) {
                            currentLevel += 1
                            slideValueMaximum += 50
                            randomNumber = Int(Double.random(in: 1...slideValueMaximum))
                            resultLabel = "You got it!"
                        } else {
                            resultLabel = "Try again!"
                        }
                    } else {
                        if randomNumber == Int(slideValue) {
                            resultLabel = "You got it!"
                            currentLevel += 2
                            slideValueMaximum += 100
                            randomNumber = Int(Double.random(in: 1...slideValueMaximum))
                        } else {
                            resultLabel = "Try again!"
                        }
                    }
                }
                Text("Current maximum number is \(Int(slideValueMaximum))")
            }
            Spacer()
            VStack() {
                Text("Exact Mode?")
                Toggle("", isOn: $exactMode).labelsHidden()
            }
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
