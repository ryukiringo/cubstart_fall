//
//  ContentView.swift
//  fitnessAppNew
//
//  Created by 柳澤琉貴 on 2022/10/16.
//

import SwiftUI
import CoreData
 
struct ContentView: View {
    var body: some View {
        TabView {
                    MainView()
                        .tabItem {
                        Label("Main", systemImage: "house.fill")
                    }
                    
                    SecondView()
                        .tabItem {
                            Label("Profile", systemImage: "person.crop.circle.fill")
                    }
                }
    }
}

struct MainView: View {
    init() {
            UITextView.appearance().backgroundColor = .clear
        }
    
    @StateObject var viewModel = ViewModel()
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)],animation: .spring()) var results : FetchedResults<Task>
    @Environment(\.managedObjectContext) var context
    @State var userNameInHome: String = ""
    @State var userHeightInHome: Double = 0
    @State var userBMI: Double = 0
    @State var userWeightForBMI: Double = 0
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            NavigationView{
                VStack(spacing:0){
                    if results.isEmpty{
                        Text("Welcome \(userNameInHome)!")
                            .font(.title)
                            .fontWeight(.heavy)
                        Spacer()
                        Text("Let's make progress")
                            .font(.title)
                            .foregroundColor(.primary)
                            .fontWeight(.heavy)
                        Spacer()
                        Button("Reload") {
                            userNameInHome = UserDefaults.standard.string(forKey: "userName")!
                            userHeightInHome = UserDefaults.standard.double(forKey: "userHeight")
                        }
                    }else{
                        Text("Welcome \(userNameInHome)!")
                            .font(.title)
                            .fontWeight(.heavy)
                        ScrollView(.horizontal,showsIndicators: false, content:{
                            LazyHStack(spacing: 5){
                                ForEach(results){task in
                                    VStack(alignment: .leading, spacing: 5, content: {
                                        VStack{
                                            if task.imageData?.count ?? 0 != 0{
                                                Image(uiImage: UIImage(data: task.imageData ?? Data.init())!)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 200, height: 350)
                                                    .cornerRadius(2)
                                            }
                                            HStack{
                                                Text(task.content ?? "")
        //                                            .font(.title)
                                                    .fontWeight(.bold)
                                                    .padding(.horizontal)
//                                                Text("優先度：\(task.priority)")
//                                                    .fontWeight(.bold)
                                            }
                                            HStack {
                                                Text(task.date ?? Date(),style: .date)
                                                    .fontWeight(.bold)
                                            }
                                            HStack {
                                                Text("\(task.weight, specifier: "%.1f")Kg")
                                                    .fontWeight(.bold)
                                                    .font(.title)
                                            }
                                            HStack {
                                                Text("BMI: \((task.weight / Double((userHeightInHome * userHeightInHome))), specifier: "%.2f")%")
                                                    .fontWeight(.bold)
                                                    .font(.title)
//                                                Text("\((Double(userHeightInHome * userHeightInHome)),specifier: "%.1f")")
//                                                print(Double(userHeightInHome * userHeightInHome))
                                            }
                                        }
                                        .padding(.horizontal)
 
                                        
                                        Divider()
                                    })
                                    .foregroundColor(.primary)
                                    .contextMenu{
                                        Button(action: {
                                            viewModel.EditItem(item: task)
                                        }, label: {
                                            Text("Edit")
                                        })
                                        Button(action: {
                                            context.delete(task)
                                            try! context.save()
                                        }, label: {
                                            Text("Delete")
                                        })
                                    }
                                }
                            }
                            .padding()
                        })
                        Spacer()
                        Button("Reload") {
                            userNameInHome = UserDefaults.standard.string(forKey: "userName")!
                            userHeightInHome = UserDefaults.standard.double(forKey: "userHeight")
                            userHeightInHome = userHeightInHome / 100
//                            userWeightForBMI = results.task.weight
//                            userBMI = userWeightForBMI / (userHeightInHome*userHeightInHome)
                        }
                    }
                }
                .navigationBarTitle("Home", displayMode: .inline)
            }
            
            
            Button(action: {viewModel.isNewData.toggle()}, label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .padding()
            })
        })
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.primary.opacity(0.06).ignoresSafeArea(.all, edges: .all))
        .sheet(isPresented: $viewModel.isNewData,
               onDismiss:{
                viewModelValueReset()
               },
               content: {
            NewDataSheet(viewModel: viewModel)
        })
    }
    
    func viewModelValueReset(){
        viewModel.updateItem = nil
        viewModel.content = ""
        viewModel.date = Date()
        viewModel.priority = 0
        viewModel.imageData = Data.init()
        viewModel.weight = 0
    }

}

struct SecondView: View {
    @State  var userHeight: Double = 0
    @State var userName: String = ""
    var body: some View {
        VStack{
            TextField("Your Name Here", text: $userName)
                .padding()
                .background(Color.primary.opacity(0.1))
                .frame(height: 50)
                .cornerRadius(10)
            
            TextField("Your Height Here", value: $userHeight, formatter: NumberFormatter())
                .padding()
                .background(Color.primary.opacity(0.1))
                .cornerRadius(10)
            
            Button("Apply") {
                UserDefaults.standard.set(userName, forKey: "userName")
                UserDefaults.standard.set(userHeight, forKey: "userHeight")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
