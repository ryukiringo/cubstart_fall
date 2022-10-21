//
//  ViewModel.swift
//  fitnessAppNew
//
//  Created by 柳澤琉貴 on 2022/10/16.
//

import SwiftUI
import CoreData
 
class ViewModel : ObservableObject{
    @Published var content = ""
    @Published var date = Date()
    @Published var priority = 0
    @Published var imageData:Data = Data.init()
    @Published var weight: Double = 0
 
    @Published var isNewData = false
    @Published var updateItem : Task!
    
    func writeData(context : NSManagedObjectContext ){
        
        if updateItem != nil{
            updateItem.date = date
            updateItem.content = content
            updateItem.priority = Int16(priority)
            updateItem.imageData = imageData
            updateItem.weight = weight
 
            try! context.save()
            
            updateItem = nil
            isNewData.toggle()
            content = ""
            date = Date()
            priority = 0
            imageData = Data.init()
            weight = 0
            return
        }
        
        let newTask = Task(context: context)
        newTask.date = date
        newTask.content = content
        newTask.priority = Int16(priority)
        newTask.imageData = imageData
        newTask.weight = weight
 
        
        do{
            try context.save()
            isNewData.toggle()
            
            content = ""
            date = Date()
            priority = 0
            imageData = Data.init()
            weight = 0
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func EditItem(item:Task){
        updateItem = item
        
        date = item.date!
        content = item.content!
        priority = Int(item.priority)
        imageData = item.imageData ?? Data.init()
        weight = item.weight
        
        isNewData.toggle()
    }
}
