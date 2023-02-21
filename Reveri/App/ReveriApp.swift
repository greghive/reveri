
import SwiftUI

@main
struct ReveriApp: App {
    @StateObject var store = Store()
    
    var body: some Scene {
        WindowGroup {
            TabsView(store: store)
        }
    }
}
