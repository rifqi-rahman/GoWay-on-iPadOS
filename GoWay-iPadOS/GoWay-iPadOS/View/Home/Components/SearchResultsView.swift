import SwiftUI

struct SearchResultCard: View {
    let item: SearchableItem
    
    var body: some View {
        NavigationLink(value: item) {
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 300)
                    .background(
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: getGradientColor(for: item.category).opacity(0.9), location: 0.00),
                                Gradient.Stop(color: getGradientColor(for: item.category).opacity(0.23), location: 0.74),
                                Gradient.Stop(color: getGradientColor(for: item.category).opacity(0), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0.14, y: 0.5),
                            endPoint: UnitPoint(x: 0.88, y: 0.5)
                        )
                    )
                    .background(
                        Image(item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                    )
                    .cornerRadius(16)
                
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        // Category pill
                        Text(item.category.rawValue)
                            .font(.system(size: 14))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(getCategoryColor(for: item.category))
                            .cornerRadius(33)
                        
                        // Title
                        Text(item.name)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        
                        // Description
                        Text(item.description)
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.8))
                            .lineLimit(2)
                    }
                    .padding(.leading, 20)
                    
                    Spacer()
                    
                    // Operating hours
                    VStack(alignment: .trailing) {
                        Image(systemName: "clock")
                            .foregroundColor(.white)
                        Text(item.operatingHours)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 20)
                }
            }
        }
        .buttonStyle(.plain)
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

struct SearchResultsView: View {
    let searchResults: [SearchableItem]
    
    var body: some View {
        VStack(spacing: 16) {
            if searchResults.isEmpty {
                VStack(spacing: 16) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 48))
                        .foregroundColor(.gray)
                    Text("No results found")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.top, 40)
            } else {
                LazyVStack(spacing: 16) {
                    ForEach(searchResults) { item in
                        SearchResultCard(item: item)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(UIColor.systemBackground))
    }
}

#Preview {
    SearchResultsView(searchResults: SearchableItem.sampleData())
} 
 