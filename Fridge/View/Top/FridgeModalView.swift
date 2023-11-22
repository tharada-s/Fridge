import SwiftUI
import ComposableArchitecture

struct FridgeModalView: View {
    var store: StoreOf<FridgeModal>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            GeometryReader { geometry in
                VStack {
                    VStack {
                        HStack {
                            Text("おすすめ料理")
                                .modifier(SuggestMemoViewModifier(size: geometry.size))
                            Text("おすすめ料理")
                                .modifier(SuggestMemoViewModifier(size: geometry.size))
                        }
                        HStack {
                            Text("おすすめ料理")
                                .modifier(SuggestMemoViewModifier(size: geometry.size))
                            Text("おすすめ料理")
                                .modifier(SuggestMemoViewModifier(size: geometry.size))
                        }
                    }
                    .padding(.top, 10)
                    List {
                        Section {} header: {
                            HStack {
                                Text("冷蔵庫の食材").font(.title2).bold()
                                Image(systemName: "plus.circle").font(.title)
                                    .foregroundColor(.accentColor)
                                    .cornerRadius(5)
                                    .onTapGesture {
                                        
                                    }
                                Spacer()
                                Image(systemName: "xmark").font(.title)
                                    .foregroundColor(.accentColor)
                                    .cornerRadius(5)
                                    .onTapGesture {
                                        viewStore.send(.onTapModalView)
                                    }
                            }
                            
                        }
                        Section {
                            ForEach(viewStore.meatList) {
                                Text ($0.name)
                            }
                        } header: {
                            Text("[肉・魚]").font(.title2).bold()
                        }
                        Section {
                            ForEach(viewStore.vegetableList) {
                                Text ($0.name)
                            }
                        } header: {
                            Text("[野菜]").font(.title2).bold()
                        }
                    }
                    .listStyle(.grouped)
                }
                .frame(maxWidth: .infinity)
                .background(Color.topFridgeModalViewBacground)
            }
        }
    }
}


struct SampleFoodData: Identifiable, Equatable {
    var id = UUID().uuidString
    var type: FoodType
    var name: String

}

enum FoodType {
    case meat
    case vegetable
}
