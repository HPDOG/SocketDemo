//
//  String+Extension.swift
//  SocketDemo
//
//  Created by HPDOG on 2019/10/11.
//  Copyright © 2019 HPDOG All rights reserved.
//

import Foundation
extension String {
    func convertToDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print("convertToDictionary() \(error.localizedDescription)")
            }
        }
        return nil
    }
    
}
