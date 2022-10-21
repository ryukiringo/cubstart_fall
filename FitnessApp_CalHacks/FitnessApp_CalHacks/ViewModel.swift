//
//  ViewModel.swift
//  FitnessApp_CalHacks
//
//  Created by 柳澤琉貴 on 2022/10/16.
//

import SwiftUI
import CoreData
 
class ViewModel : ObservableObject{
    @Published var content = ""
    @Published var date = Date()
    @Published var isNewData = false
    @Published var updateItem : Task!
    
    func writeData(context : NSManagedObjectContext ){
        
        if updateItem != nil{
            updateItem.date = date
            updateItem.content = content
            try! context.save()
            
            updateItem = nil
            isNewData.toggle()
            content = ""
            date = Date()
            return
        }
        
        let newTask = Task(context: context)
        newTask.date = date
        newTask.content = content
        
        do{
            try context.save()
            isNewData.toggle()
            content = ""
            date = Date()
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func EditItem(item:Task){
        updateItem = item
        
        date = item.date!
        content = item.content!
        isNewData.toggle()
    }
}
