import SwiftUI

struct LocationCard: View {
    let item: SearchableItem
    
    var body: some View {
        GeometryReader { geometry in
            NavigationLink(value: item) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: geometry.size.height)
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
                                .frame(maxWidth: .infinity)
                                .clipped()
                        )
                        .cornerRadius(21)
                    
                    VStack {
                        Spacer()
                        
                        Category(categoryName: item.category.rawValue, categoryColor: getCategoryColor(for: item.category))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(item.name)
                            .font(Font.custom("Bebas Neue",size: min(geometry.size.width * 0.1, 32)))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, geometry.size.width * 0.07)
                            .padding(.bottom, geometry.size.height * 0.09)
                    }
                }
            }
            .buttonStyle(.plain)
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
        .frame(width: 340, height: 230)
} 
