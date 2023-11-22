import SwiftUI
import ComposableArchitecture

struct TopView: View {
    let store: StoreOf<Top>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                VStack {
                    Image(viewStore.imageFlag ? "FridgeOpen" : "FridgeClose")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .scaleEffect(viewStore.imageScale)
                        .onTapGesture {
                            viewStore.send(.onTapFridgeImage)
                        }
                        .animation(.easeOut(duration: 0.9), value: viewStore.imageScale)
                }
                IfLetStore(
                    self.store.scope(state: \.topFridgeModal, action: { .topFridgeModal($0) })
                ) { store in
                    FridgeModalView(store: store)
                        .transition(.move(edge: .bottom))
                        .animation(.easeIn(duration: 0.3))
                }
            }
        }
    }
}
