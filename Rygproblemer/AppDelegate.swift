//
//  AppDelegate.swift
//  Rygproblemer
//
//  Created by Tommy Jepsen on 22/03/2021.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
    var popover = NSPopover()
    var icon:String = "⚡️"
    var counter = 300

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentView = ContentView(item: statusBarItem, popover: popover, icon: icon)

        popover.contentSize = NSSize(width: 300, height: 100)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: contentView)

        if let button = self.statusBarItem.button {
            button.title = icon + " " + getTime()
            button.action = #selector(togglePopover(_:))
        }
        
        NSApp.activate(ignoringOtherApps: true)
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
 
    @objc func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            counter = 300;
            togglePopover(nil)
        }
        if let button = self.statusBarItem.button {
            
            button.title = icon + " " + getTime()
            button.action = #selector(togglePopover(_:))
        }
    }
    
    @objc func getTime() -> String {
        let divisor_for_minutes = counter % (60 * 60);
        let minutes = (divisor_for_minutes / 60);
        let divisor_for_seconds = divisor_for_minutes % 60;
        let SECONDS = divisor_for_seconds < 10 ? ("0" + String(divisor_for_seconds)) : String(divisor_for_seconds);
        return String("\(minutes):\(SECONDS)")
    }
    
    @objc func togglePopover(_ sender: AnyObject?) {
        if let button = self.statusBarItem.button {
            if self.popover.isShown {
                self.popover.performClose(sender)
            } else {
                self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            }
        }
    }
    
}

