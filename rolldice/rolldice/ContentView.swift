//
//  ContentView.swift
//  rolldice
//
//  Created by 柳澤琉貴 on 2022/10/13.
//

import SwiftUI

struct CameraView: View {
    
    @ObservedObject var viewModel : ViewModel
    
    @Binding var imageData : Data
    @Binding var source:UIImagePickerController.SourceType
    
    @Binding var image:Image
 
    @Binding var isActionSheet:Bool
    @Binding var isImagePicker:Bool
    
    var body: some View {
       
                VStack(spacing:0){
                        ZStack{
                            NavigationLink(
                                destination: Imagepicker(show: $isImagePicker, image: $imageData, sourceType: source),
                                isActive:$isImagePicker,
                                label: {
                                    Text("")
                                })
                            VStack{
                                HStack(spacing:30){
                                    Text("photo")
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(10)
                                    Button(action: {
                                            self.source = .photoLibrary
                                            self.isImagePicker.toggle()
                                    }, label: {
                                        Text("Upload")
                                    })
                                    Button(action: {
                                            self.source = .camera
                                            self.isImagePicker.toggle()
                                    }, label: {
                                        Text("Take Photo")
                                    })
                                    Spacer()
                                }
                                .padding()
                            }
                        }
                }
                .onAppear(){
                    loadImage()
                }
                .navigationBarTitle("Add Task", displayMode: .inline)
    }
    
    func loadImage() {
        if imageData.count != 0{
            viewModel.imageData = imageData
            self.image = Image(uiImage: UIImage(data: imageData) ?? UIImage(systemName: "photo")!)
        }else{
            self.image = Image(uiImage: UIImage(data: imageData) ?? UIImage(systemName: "photo")!)
        }
    }
}
 
struct Imagepicker : UIViewControllerRepresentable {
    
    @Binding var show:Bool
    @Binding var image:Data
    
    var sourceType:UIImagePickerController.SourceType
 
    func makeCoordinator() -> Imagepicker.Coodinator {
        
        return Imagepicker.Coordinator(parent: self)
    }
      
    func makeUIViewController(context: UIViewControllerRepresentableContext<Imagepicker>) -> UIImagePickerController {
        
        let controller = UIImagePickerController()
        controller.sourceType = sourceType
        controller.delegate = context.coordinator
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<Imagepicker>) {
    }
    
    class Coodinator: NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
        
        var parent : Imagepicker
        
        init(parent : Imagepicker){
            self.parent = parent
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.parent.show.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let image = info[.originalImage] as! UIImage
            let data = image.pngData()
            
            self.parent.image = data!
            self.parent.show.toggle()
        }
    }
}
//struct ContentView: View {
//    @State var score: Int = 0
//    var body: some View {
//        TabView {
//            RollDiceView(score: $score)
//                .tabItem {
//                Label("Roll", systemImage: "dice.fill")
//            }
//
//            ScoreView(score: score)
//                .tabItem {
//                    Label("Score", systemImage: "number.square.fill")
//            }
//        }
//    }
//}
//
//struct RollDiceView: View {
//    func rollDice() -> Int {
//        return Int.random(in: 1...6)
//    }
//    @Binding var score: Int
//    @State var rolledDice: Bool = false
//    @State var value: Int = 0
//    var body: some View {
//        NavigationView {
//            VStack{
//                NavigationLink(destination: rollOutcomeView(outcome: value), isActive: $rolledDice) {EmptyView()}
//                Button {
//                    value = rollDice()
//                    score += value
//                    rolledDice = true
//                } label: {
//                    Text("Roll me!")
//                    Image(systemName: "dice")
//                }
//            }
//        }
//    }
//}
//
//struct rollOutcomeView: View {
//    var outcome: Int
//    var body: some View {
//        Text("Congrats! You rolled out a \(outcome)")
//    }
//}
//
//struct ScoreView: View {
//    var score: Int
//    var body: some View {
//        Text("Your score is \(score)")
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
