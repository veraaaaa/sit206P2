import Foundation
//
//  File.swift
//  SIT206_Assignment2
//
//  Created by 王子璇 on 2018/5/10.
//  Copyright © 2018年 wangyuwei. All rights reserved.
//
import UIKit
import CoreLocation
import MapKit
import CoreData


class Registers {
    static var registers = [UserInfo]()
    static var viewContext : NSManagedObjectContext?
    
    static func getViewContext() -> NSManagedObjectContext {
        if viewContext == nil {
            viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        }
        return viewContext!
    }
    static func getRegisters() -> [UserInfo] {
        if registers.count == 0 { loadRegisters() }
        return registers
    }
    
    static func addRegister(username : String, password : String, usersdob : Date, email : String, tel: Int32) {
        let context = getViewContext()
        var register = UserInfo(context: context)
        register.username =     username
        register.password = password
        register.usersdob = usersdob
        register.email = email
        register.tel = tel
        try! context.save()
    }
    
    static func getRegister(at : Int) -> UserInfo? {
        if UserInfo.count < 1 { loadRegisters() }
        
        if at >= 0 && at < registers.count {
            return registers[at]
        }
        return nil
    }
    static func loadRegisters() {
        let context = getViewContext()
        registers = try! context.fetch(UserInfo.fetchRequest())
        
       
        
    }
    
    
    
}
