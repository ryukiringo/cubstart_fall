//
//  NewDataSheet.swift
//  fitnessAppNew
//
//  Created by 柳澤琉貴 on 2022/10/16.
//

import SwiftUI
 
struct NewDataSheet: View {
    
    
    @ObservedObject var viewModel : ViewModel
    @Environment(\.managedObjectContext) var context
    
    @State var imageData : Data = .init(capacity:0)
    @State var isActionSheet = false
    @State var isImagePicker = false
    @State var source:UIImagePickerController.SourceType = .photoLibrary
    
    @State private var image = Image(systemName: "photo")
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack{
                        CameraView(viewModel: viewModel, imageData: $imageData, source: $source, image: $image, isActionSheet: $isActionSheet, isImagePicker: $isImagePicker)
                            .padding(.top,50)
                        NavigationLink(
                            destination: Imagepicker(show: $isImagePicker, image: $imageData, sourceType: source),
                            isActive:$isImagePicker,
                            label: {
                                Text("")
                            })
                    }
                    HStack{
                        Text("Short Note")
                        TextEditor(text: $viewModel.content)
                            .padding()
                            .background(Color.primary.opacity(0.1))
                        .frame(height: 50)
                            .cornerRadius(10)
                    }
                    .padding()
                    
                    HStack{
                        Text("Body weight")
                        TextField("", value: $viewModel.weight, formatter: NumberFormatter())
                            .padding()
                            .background(Color.primary.opacity(0.1))
                            .cornerRadius(10)
                    }
                    .padding()
                    
//                    HStack{
//                        Text("priority")
//                        TextField("", value: $viewModel.priority, formatter: NumberFormatter())
//                            .padding()
//                            .background(Color.primary.opacity(0.1))
//                            .cornerRadius(10)
//                    }
                    .padding()
                    
                    HStack{
                        Text("when")
                        
                        Spacer()
                        DatePicker("", selection:$viewModel.date, displayedComponents:.date).environment(\.locale, Locale.init(identifier: "en_EN"))//日付も使用する場合は”displayedComponents:.date”をなくす
                            .labelsHidden()
                        Spacer()
                        
                    }
                    .padding()
                    
                    Button(action: {viewModel.writeData(context: context)}, label: {
                        Label(title:{Text(viewModel.updateItem == nil ? "Make a Progress!" : "Update")
                            .font(.title)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        },
                        icon: {Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.white)
                        })
                        .padding(.vertical)
                        .frame(width:UIScreen.main.bounds.width - 30)
                        .background(Color.blue)
                        .cornerRadius(50)
                    })
                    .padding()
                    .disabled(viewModel.content == "" ? true : false)
                    .opacity(viewModel.content == "" ? 0.5 : 1)
                    
                }
            }
        }
        .background(Color.primary.opacity(0.06).ignoresSafeArea(.all, edges: .bottom))
    }
}
