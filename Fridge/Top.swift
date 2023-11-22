import Foundation
import ComposableArchitecture

struct Top: Reducer {
    static let minImageScale = 1.0
    static let maxImageScale = 1.5
    
    struct State: Equatable{
        var topFridgeModal: FridgeModal.State?
        var imageScale: CGFloat = 1.0
        var imageFlag: Bool = false
    }
    
    enum Action: Equatable {
        case topFridgeModal(FridgeModal.Action)
        case onTapFridgeImage
        case changeFridgeImageFlag
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onTapFridgeImage:
                return .run { await $0(.changeFridgeImageFlag) }
                
            case .changeFridgeImageFlag:
                state.imageFlag.toggle()
                state.imageScale = state.imageFlag ? Self.maxImageScale : Self.minImageScale
                state.topFridgeModal = state.topFridgeModal == nil ? FridgeModal.State() : nil
                return .none
                
            case .topFridgeModal(.onTapModalView):
                return .run { await $0(.changeFridgeImageFlag) }
            }
        }
        .ifLet(\.topFridgeModal, action: /Action.topFridgeModal) {
            FridgeModal()
        }
    }
}
