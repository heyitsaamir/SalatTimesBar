import Foundation
import AppKit
import SwiftUI


class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!
    var popover: NSPopover!
    var statusBarItem: NSStatusItem!

    func buildPopover(currentSalatTimes: Binding<Result<CurrentSalatTimes, NetworkError>>) {
        let popover = NSPopover()
        popover.contentSize = NSSize(width: 400, height: 400)
        popover.behavior = .transient
        let vm = AthanTimings()
        popover.contentViewController = NSHostingController(rootView: ContentView(currentSalatTimes: currentSalatTimes).environment(<#T##object: Observable?##Observable?#>))
        self.popover = popover
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        let view = AppIcon()
        let hostingView = NSHostingView(rootView: view)
        hostingView.frame = NSRect(x: 0, y: 0, width: 120, height: 22)
        self.statusBarItem.button?.addSubview(hostingView)
        statusBarItem.button?.frame = hostingView.frame
        self.statusBarItem.button?.action = #selector(togglePopover(_:))
        
        if let window = NSApplication.shared.windows.first {
                window.close()
            }
        
        self.buildPopover(currentSalatTimes: view.$vm.currentSalatTimes)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
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
