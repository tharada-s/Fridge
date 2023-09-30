import ComposableArchitecture

struct Top: Reducer {
    struct State: Equatable{}
    
    struct Action: Equatable {}
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        return .none
    }
}
