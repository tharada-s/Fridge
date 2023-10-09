import Foundation
import ComposableArchitecture

struct Top: Reducer {
    static let minImageScale = 1.0
    static let maxImageScale = 1.5
    
    struct State: Equatable{
        var imageScale: CGFloat = 1.0
        var imageFlag: Bool = false
    }
    
    enum Action: Equatable {
        case onTapFridgeImage
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onTapFridgeImage:
                state.imageFlag.toggle()
                state.imageScale = state.imageFlag ? Self.maxImageScale : Self.minImageScale
                return .none
            }
        }
    }
}
