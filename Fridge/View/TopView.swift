import SwiftUI
import ComposableArchitecture

struct TopView: View {
    let store: StoreOf<Top>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                Image(viewStore.imageFlag ? "FridgeOpen" : "FridgeClose")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .scaleEffect(viewStore.imageScale)
                    .onTapGesture {
                        viewStore.send(.onTapFridgeImage)
                    }
                    .animation(.easeOut(duration: 0.7), value: viewStore.imageScale)
            }
        }
    }
}
