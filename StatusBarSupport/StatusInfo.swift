//
//  StatusInfo.swift
//  StatusBarSupport
//
//  Created by Henry Dobson on 2/15/16.
//  Copyright © 2016 Henry Dobson. All rights reserved.
//

import Foundation

class StatusInfo {
    
    func ComputerHostName() {
        let statusID = NSHost.currentHost().localizedName!
        print(statusID)
    }
    
    func ComputerIPAddress() {
        let statusIP = NSHost.currentHost().addresses[1]
        print(statusIP)
    }
    
}