import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        VStack {
            HStack {
                // Search Icon
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 12)
                
                // Text Field
                TextField("Office, Toilet, Restaurant...", text: $searchText)
                    .padding(10)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 10)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                
                // Clear button
                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                        isSearching = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, 12)
                    }
                }
            }
            .frame(maxWidth: 600)
            .background(Color.white.opacity(1))
            .cornerRadius(50)
            .shadow(radius: 5)
            .padding([.top, .horizontal], 19)
        }
        Spacer()
    }
}

#Preview {
    SearchBar(searchText: .constant(""), isSearching: .constant(false))
}
