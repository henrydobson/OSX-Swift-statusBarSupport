//
//  MessageSupport.swift
//  StatusBarSupport
//
//  Created by Henry Dobson on 2/15/16.
//  Copyright © 2016 Henry Dobson. All rights reserved.
//

import Foundation
import AppKit

class MessageSupport {

    func startMessage() {
        let statusIP = NSHost.currentHost().addresses[1]
        print("\(statusIP)")
        
        // OSS users: Edit your content here
        let email = "your@email.com"
        // let subject = ""
        let adminMessage = "\n\nThe lines below are to assist yourSupportCompany. Please do not delete.\n\n"
        
        // Get IPv4, Hostname adnd set labels for them
        let IPlabel = "\nIPv4: "
        let HostnameLabel = "\nHostname: "
        
        // This is a temp senderIP. Looking for a way to accurately target an interface to get address
        let senderIP = NSHost.currentHost().addresses[1]
        let senderHostname = NSHost.currentHost().localizedName!
        
        // Get Serial Number from Sys Profiler
        let task = NSTask()
        let outputPipe = NSPipe()
        
        task.launchPath = "/usr/sbin/system_profiler"
        task.arguments = ["SPHardwareDataType"]
        task.standardOutput = outputPipe
        task.launch()
        
        let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
        let output = NSString(data: outputData, encoding: NSUTF8StringEncoding) as! String
        
        // Extract Serial Number from Sys Profiler
        var sysArray : [String] = output.componentsSeparatedByCharactersInSet(NSCharacterSet (charactersInString: "\n"))
        let sysSerialNumber = sysArray[15].componentsSeparatedByCharactersInSet(NSCharacterSet (charactersInString: ":"))
        let senderSerialNumber = sysSerialNumber[1].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        // Manage body text
        let wholeMessage = "\(adminMessage)\(senderSerialNumber)\(HostnameLabel)\(senderHostname)\(IPlabel)\(senderIP)"
        let escapedMessage = wholeMessage.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())!

        // Contruct URL
        let urlString = "mailto:" + email + "?body=" + escapedMessage
        let url = NSURL(string: urlString)
        
        // Open URL
        NSWorkspace.sharedWorkspace().openURL(url!)

    }
    
}

