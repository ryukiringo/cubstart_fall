//
//  ContentView.swift
//  fitness_calhacks9.0
//
//  Created by 柳澤琉貴 on 2022/10/15.
//

//import SwiftUI
//
//struct ContentView: View {
//    @State var score: Int = 0
//    var body: some View {
//        TabView {
//            HomeView()
//                .tabItem {
//                Label("Home", systemImage: "house.fill")
//            }
//
//            ScoreView(score: score)
//                .tabItem {
//                    Label("Result", systemImage: "chart.xyaxis.line")
//            }
//
//            ProfileView()
//                .tabItem {
//                    Label("Profile", systemImage: "person.fill")
//                }
//
//            SettingView()
//                .tabItem {
//                    Label("Setting", systemImage: "gearshape.fill")
//                }
//        }
//    }
//}
//
//struct HomeView: View {
//    var body: some View {
//        ScrollView(.horizontal) {
//            HStack {
//                ForEach(0..<10){i in
//                    ChildView()
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
//struct ProfileView: View {
//    var body: some View {
//        Text("")
//    }
//}
//
//struct SettingView: View {
//    var body: some View {
//        Text("")
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
//struct ChildView: View {
//    var body: some View {
//        VStack {
//            Image("picture_man")
//                .resizable()
//                .frame(width: 200, height: 200)
//            Text("75KG")
//        }
//    }
//}
//
import SwiftUI
import CoreData
 
struct ContentView: View {
    
    init() {
            UITextView.appearance().backgroundColor = .clear
        }
    
    @StateObject var viewModel = ViewModel()
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)],animation: .spring()) var results : FetchedResults<Task>
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            NavigationView{
                VStack(spacing:0){
                    if results.isEmpty{
                        Spacer()
                        Text("No Tasks")
                            .font(.title)
                            .foregroundColor(.primary)
                            .fontWeight(.heavy)
                        Spacer()
                    }else{
                   
                        ScrollView(.vertical,showsIndicators: false, content:{
                            LazyVStack(alignment: .leading, spacing: 20){
                                ForEach(results){task in
                                    VStack(alignment: .leading, spacing: 5, content: {
                                        HStack{
                                            if task.imageData?.count ?? 0 != 0{
                                                Image(uiImage: UIImage(data: task.imageData ?? Data.init())!)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 80, height: 80)
                                                    .cornerRadius(10)
                                            }
                                            VStack{
                                                Text(task.date ?? Date(),style: .date)
                                                    .fontWeight(.bold)
                                                Text("優先度：\(task.priority)")
                                                    .fontWeight(.bold)
                                            }
                                        }
                                        .padding(.horizontal)
 
                                        Text(task.content ?? "")
                                            .font(.title)
                                            .fontWeight(.bold)
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
                    }
                }
                .navigationBarTitle("Home", displayMode: .inline)
            }
            Button(action: {viewModel.isNewData.toggle()}, label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(Color.green)
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
