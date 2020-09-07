//
//  BridgeSmartId.swift
//  BANRURAL
//
//  Created by BDGSA on 9/4/20.
//

import Foundation
import SmartId

@objcMembers class BridgeSmartId: NSObject {
    
   
    func startSmartId(license: String, username: String, isProd: Bool)-> String{
        SmartId.start(license: license, username: username, isProduction: isProd);
     
        return "true";
    }
    
    func linkSmartId(channel:String, sesion: String)-> String {
        
        SmartId.shared.link(channel: channel, session: sesion);
         return "true";
    }
    
    func trackingSmartId(channel:String, sesion:String, activity: String) -> String {
        SmartId.shared.tracking(channel: channel, session: sesion, action: activity);
        
        return "true";
    }
    
    func unLinkSmartId(channel:String, sesion:String) -> String {
        SmartId.shared.unlink(channel: channel, session: sesion);
        return "true";
    }
}