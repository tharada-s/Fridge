import SwiftUI

struct SuggestMemoViewModifier: ViewModifier {
    let size: CGSize
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: size.width / 2.2, maxHeight: .infinity)
            .background(Color.suggestMemoBackground)
            .cornerRadius(5)
            .compositingGroup()
            .shadow(color: Color.suggestMemoShadow, radius: 3, x: 5, y: 5)
    }
}
