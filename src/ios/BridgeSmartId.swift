//
//  BridgeSmartId.swift
//  BANRURAL
//
//  Created by BDGSA on 9/4/20.
//

import Foundation
import SmartId


@objcMembers class BridgeSmartId: NSObject {
   private var strJsonDispositivo: String="";
    
    func startSmartId(license: String, username: String, isProd: Bool)-> String{
        print("-----start smart id-----");
        print ("Licencia: ",license);
        print ("Usuario: ",username);
        print ("isprod: ",isProd);
        
        SmartId.SID.start(license: license, username: username, isProduction: isProd);
   
     
        return "true";
    }
    
    func linkSmartId(channel:String, sesion: String)-> String {
         print("-----link smart id-----");
         print("canal:",channel);
        SmartId.SID.shared.link(channel: channel, session: sesion);
         return "true";
    }
    
    func trackingSmartId(channel:String, sesion:String, activity: String) -> String {
        SmartId.SID.shared.tracking(channel: channel, session: sesion, action: activity);
        
        return "true";
    }
    
    func unLinkSmartId(channel:String, sesion:String) -> String {
        SmartId.SID.shared.unlink(channel: channel, session: sesion);
        return "true";
    }
    
    func securePayment(channel:String,
                       tranType:String,
                       amount:String,
                       strvalues:String
                       )-> String {
        var respuesta: String = "false";
        var values:[String:String]=[:];
        let data = Data(strvalues.utf8);
        do {
            // make sure this JSON is in the format we expect
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: String] {
                // try to read out a string array
                values=json;
                SmartId.SID.shared.securePayment(
                    channel: channel,
                    transactionType: tranType,
                    amount: amount,
                    values: values);
                respuesta="true";
            }
        } catch let error as NSError {
            print("Failed secure: \(error.localizedDescription)");
         
        }
        
        return respuesta;
  
    }
    
    func getDeviceInfo(channel:String) -> String{
        let respuesta:  [String : Any];
        respuesta = SmartId.SID.shared.getDeviceInfo(channel: channel, session: "");
        strJsonDispositivo="{";
        respuesta.forEach { (key: String, value: Any) in
            addJsonFormat(key: key,value: value)
        };
        strJsonDispositivo.removeLast();
        strJsonDispositivo.append("}");
        return strJsonDispositivo;
            }
    
   private func addJsonFormat(key: String, value: Any)-> Void {
        let comillas: String="\"";
        let separador: String=",";
        let strValue: String = value as! String;
        strJsonDispositivo.append(comillas);
        strJsonDispositivo.append(key);
        strJsonDispositivo.append(comillas);
        strJsonDispositivo.append(":");
        strJsonDispositivo.append(comillas);
        strJsonDispositivo.append(strValue);
        strJsonDispositivo.append(comillas);
        strJsonDispositivo.append(separador);
        
    }
}

