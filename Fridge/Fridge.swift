import ComposableArchitecture

struct FridgeModal: Reducer {
    struct State: Equatable {
        let foodList: [SampleFoodData] = [
            SampleFoodData.init(type: .meat, name: "鶏肉"),
            SampleFoodData.init(type: .vegetable, name: "きゅうり")
        ]
        var meatList: [SampleFoodData] {
            foodList.filter { $0.type == .meat }
        }
        var vegetableList: [SampleFoodData] {
            foodList.filter { $0.type == .vegetable }
        }
    }
    
    enum Action: Equatable {
        case onTapModalView
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .onTapModalView:
            // TopCoreで処理
            return .none
        }
    }
}
