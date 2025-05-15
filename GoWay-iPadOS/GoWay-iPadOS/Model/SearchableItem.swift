import Foundation

enum ItemCategory: String {
    case facility = "Facility"
    case office = "Office"
    case fnb = "F&B"
}

struct SearchableItem: Identifiable {
    let id = UUID()
    let name: String
    let category: ItemCategory
    let imageName: String
    let description: String
    let operatingHours: String
    
    // Additional properties specific to each category
    let hasWheelchairAccess: Bool?  // For facilities
    let hasParking: Bool?           // For facilities
    
    static func sampleData() -> [SearchableItem] {
        return [
            // Facilities
            SearchableItem(name: "Restroom", category: .facility, imageName: "restroom_step5",
                         description: "A restroom is a public room containing toilets and sinks for personal sanitation.",
                         operatingHours: "08:00 - 21:00", hasWheelchairAccess: true, hasParking: nil),
            SearchableItem(name: "Shower Room", category: .facility, imageName: "shower_room",
                         description: "Clean shower room for all employees.",
                         operatingHours: "08:00 - 21:00", hasWheelchairAccess: true, hasParking: nil),
            SearchableItem(name: "Parking Area", category: .facility, imageName: "parking",
                         description: "Secure parking area for vehicles.",
                         operatingHours: "24/7", hasWheelchairAccess: true, hasParking: true),
            SearchableItem(name: "Auditorium", category: .facility, imageName: "auditorium",
                         description: "Large meeting space for events.",
                         operatingHours: "08:00 - 21:00", hasWheelchairAccess: true, hasParking: nil),
            SearchableItem(name: "Prayer Room", category: .facility, imageName: "Hero Banner",
                         description: "Quiet space for prayer and meditation.",
                         operatingHours: "24/7", hasWheelchairAccess: true, hasParking: nil),
            
            // Offices
            SearchableItem(name: "NTT DATA", category: .office, imageName: "ntt_data",
                         description: "Global IT services provider.",
                         operatingHours: "09:00 - 18:00", hasWheelchairAccess: nil, hasParking: nil),
            SearchableItem(name: "Purwadhika", category: .office, imageName: "purwadhika",
                         description: "Digital technology school.",
                         operatingHours: "09:00 - 18:00", hasWheelchairAccess: nil, hasParking: nil),
            SearchableItem(name: "Apple Developer Academy", category: .office, imageName: "Hero Banner",
                         description: "Apple's developer training program.",
                         operatingHours: "09:00 - 18:00", hasWheelchairAccess: nil, hasParking: nil),
            SearchableItem(name: "BitHealth", category: .office, imageName: "bithealth",
                         description: "Healthcare technology company.",
                         operatingHours: "09:00 - 18:00", hasWheelchairAccess: nil, hasParking: nil),
            
            // F&B
            SearchableItem(name: "Alfamart", category: .fnb, imageName: "alfamart",
                         description: "Convenience store with various snacks and drinks.",
                         operatingHours: "07:00 - 22:00", hasWheelchairAccess: nil, hasParking: nil),
            SearchableItem(name: "Canteen", category: .fnb, imageName: "canteen_gop9",
                         description: "Food court with multiple food stalls.",
                         operatingHours: "07:00 - 20:00", hasWheelchairAccess: nil, hasParking: nil)
        ]
    }
} 
