import SwiftUI
import ComposableArchitecture

@main
struct FridgeApp: App {
    var body: some Scene {
        WindowGroup {
            TopView(store: StoreOf<Top>(initialState: Top.State()) { Top() })
        }
    }
}
