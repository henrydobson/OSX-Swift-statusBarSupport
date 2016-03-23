//
//  StatusMenuController.swift
//  StatusBarSupport
//
//  Created by Henry Dobson on 2/15/16.
//  Copyright © 2016 Henry Dobson. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {
    
    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    let messageSupport = MessageSupport()
    
    override func awakeFromNib() {
        // Insert code here to initialize your application
        
        let icon = NSImage(named: "statusIcon")
        icon?.template = true // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
    }
    
    @IBAction func statusHelpClicked(sender: NSMenuItem) {
        messageSupport.startMessage()
    }
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.sharedApplication().terminate(self)
    }

}
