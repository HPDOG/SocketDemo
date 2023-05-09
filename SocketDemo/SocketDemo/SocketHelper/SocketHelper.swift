//
//  SocketHelper.swift
//  SocketDemo
//
//  Created by HPDOG on 2019/11/13.
//  Copyright © 2019 HPDOG. All rights reserved.
//

import Foundation
import Starscream

var socketManager: WebSocket!

var mySendString = ""

var myLoginName = ""
var receiverName = ""

class SocketHelper: NSObject, WebSocketDelegate {
    
    static let shard = SocketHelper()
    func connectSocket() {
        if let WebSocketUrl = Bundle.main.object(forInfoDictionaryKey: "WebSocketUrl") as? String {
            if let url = URL(string: "wss://" + WebSocketUrl){
                socketManager = WebSocket(url: url)
            }
            
        }
        
        socketManager?.delegate = self
        socketManager?.connect()
        
    }
    
    func sendMessage(_ text: String?) {
        let cur = "\(receiverName)?%%?%%\(text ?? "")*%%*%%\(myLoginName)"
        mySendString = cur
    }
    
    func receiveMessage(_ data: [Any]?) {
        let receiveStr = data![0] as? String
    }
    
    func disconnetSocket(){
        socketManager?.disconnect()
    }
    
    func websocketDidConnect(socket: WebSocketClient) {
        print("websocketDidConnect")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("websocketDidDisconnect")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        guard let strToDic = text.convertToDictionary() else {
            return
        }
    }
    
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("websocketDidReceiveData")
    }
}
