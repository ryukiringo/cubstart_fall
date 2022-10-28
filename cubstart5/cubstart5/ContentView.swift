//
//  ContentView.swift
//  cubstart5
//
//  Created by 柳澤琉貴 on 2022/10/20.
//

import SwiftUI

class Pet: ObservableObject {
    @Published var animal: String
    @Published var name: String
    @Published var age: Int
    var imageView: String
    
    init(animalType: String, animalName: String, animalAge: Int, imageName: String) {
        self.animal = animalType
        self.name = animalName
        self.age = animalAge
        self.imageView = imageName
    }
}

struct ContentView: View {
//    @State var age: Int = 1
//    @State var name: String = "Andy"
    @StateObject var myPet: Pet = Pet(animalType: "capybara", animalName: "bella", animalAge: 1, imageName: "capybara")
    var body: some View {
        
        VStack {
            displayPetView()
        }
        .environment(myPet)
//        NavigationView {
//            VStack {
//                Text(name)
//                Text(String(age))
//
//                NavigationLink(destination:
//                                editProfileView(age: $age, name: $name)) {Text("Edit Profile")}
//            }
//        }
    }

}


struct displayPetView: View {
    @EnvironmentObject var myPet: Pet
    var body: some View {
        VStack {
            HStack {
                Text(myPet.animal)
                Text(myPet.name)
                Text(String(myPet.age))
            }
            Image(myPet.imageView)
                .resizable()
                .aspectRatio(ContentMode, contentMode: <#T##ContentMode#>)
        }
    }
}
//struct editProfileView: View {
//    @Binding var age: Int
//    @Binding var name: String
//    var body: some View {
//        VStack {
//            TextField("Enter Your Name", text: $name)
//            TextField("Enter Your Name", value: $age, formatter: <#Formatter#>)
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
