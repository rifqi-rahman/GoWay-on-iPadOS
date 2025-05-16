import SwiftUI

struct LocationCard: View {
    let item: SearchableItem
    @State private var showNavigation = false
    
    var body: some View {
        Button(action: {
            showNavigation = true
        }) {
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 340, height: 230)
                    .background(
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: getGradientColor(for: item.category).opacity(0.9), location: 0.00),
                                Gradient.Stop(color: getGradientColor(for: item.category).opacity(0.23), location: 0.74),
                                Gradient.Stop(color: getGradientColor(for: item.category).opacity(0), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0.5, y: 1),
                            endPoint: UnitPoint(x: 0.5, y: 0.26)
                        )
                    )
                    .background(
                        Image(item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 340)
                            .clipped()
                    )
                    .cornerRadius(21)
                    .padding(4)
                
                VStack {
                    Spacer()
                    
                    Category(categoryName: item.category.rawValue, categoryColor: getCategoryColor(for: item.category))
                        .frame(width: 340, alignment: .bottomLeading)
                    
                    Text(item.name)
                        .font(Font.custom("Bebas Neue", size: 32))
                        .foregroundColor(.white)
                        .padding(.leading, 24)
                        .padding(.bottom, 20)
                        .frame(width: 340, alignment: .leading)
                }
                .frame(width: 340, height: 230)
            }
        }
        .buttonStyle(.plain)
        .fullScreenCover(isPresented: $showNavigation) {
            NavigationView(item: item)
        }
    }
    
    private func getGradientColor(for category: ItemCategory) -> Color {
        switch category {
        case .facility:
            return Color(red: 0, green: 0.43, blue: 0.13)
        case .office:
            return Color(red: 0, green: 0.28, blue: 0.43)
        case .fnb:
            return Color(red: 0.41, green: 0.43, blue: 0)
        }
    }
    
    private func getCategoryColor(for category: ItemCategory) -> Color {
        switch category {
        case .facility:
            return Color(red: 0.56, green: 0.93, blue: 0.56)
        case .office:
            return Color(red: 0.56, green: 0.78, blue: 0.93)
        case .fnb:
            return Color(red: 0.93, green: 0.89, blue: 0.56)
        }
    }
}

#Preview {
    LocationCard(item: SearchableItem.sampleData().first!)
} 