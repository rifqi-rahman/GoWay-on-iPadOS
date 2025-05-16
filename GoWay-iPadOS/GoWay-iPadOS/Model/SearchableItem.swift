import Foundation

enum ItemCategory: String, Codable {
    case facility = "Facility"
    case office = "Office"
    case fnb = "F&B"
}

struct SearchableItem: Identifiable, Hashable, Codable {
    private(set) var id: UUID
    let name: String
    let category: ItemCategory
    let imageName: String
    let description: String
    let operatingHours: String
    
    // Additional properties specific to each category
    let hasWheelchairAccess: Bool?  // For facilities
    let hasParking: Bool?           // For facilities
    
    init(id: UUID = UUID(), name: String, category: ItemCategory, imageName: String, description: String, operatingHours: String, hasWheelchairAccess: Bool? = nil, hasParking: Bool? = nil) {
        self.id = id
        self.name = name
        self.category = category
        self.imageName = imageName
        self.description = description
        self.operatingHours = operatingHours
        self.hasWheelchairAccess = hasWheelchairAccess
        self.hasParking = hasParking
    }
    
    // Implement Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: SearchableItem, rhs: SearchableItem) -> Bool {
        lhs.id == rhs.id
    }
    
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
            SearchableItem(name: "Front Office", category: .facility, imageName: "Hero Banner",
                         description: "Front Office for customer service and general inquiries.",
                         operatingHours: "08:00 - 17:00", hasWheelchairAccess: true, hasParking: nil),
//            SearchableItem(name: "Receptionist", category: .facility, imageName: "resepsionis",
//                         description: "Receptionist for customer inquiries, scheduling, and administrative tasks.",
//                         operatingHours: "24/7", hasWheelchairAccess: true, hasParking: nil),
            
            // Offices
            SearchableItem(name: "NTT DATA", category: .office, imageName: "ntt_data",
                         description: "Global IT services provider.",
                         operatingHours: "09:00 - 18:00", hasWheelchairAccess: nil, hasParking: nil),
            SearchableItem(name: "Purwadhika", category: .office, imageName: "purwadhika",
                         description: "Digital technology school.",
                         operatingHours: "09:00 - 18:00", hasWheelchairAccess: nil, hasParking: nil),
            SearchableItem(name: "Apple Developer Academy", category: .office, imageName: "appdev",
                         description: "Apple's developer training program.",
                         operatingHours: "09:00 - 18:00", hasWheelchairAccess: nil, hasParking: nil),
            SearchableItem(name: "BitHealth", category: .office, imageName: "bithealth",
                         description: "Health Technology company.",
                         operatingHours: "09:00 - 18:00", hasWheelchairAccess: nil, hasParking: nil),
            SearchableItem(name: "Reinhausen", category: .office, imageName: "reinhausen",
                         description: "Construction services provider.",
                         operatingHours: "09:00 - 18:00", hasWheelchairAccess: nil, hasParking: nil),
            SearchableItem(name: "Commsult", category: .office, imageName: "commsult",
                         description: "IT Solution and Communication Services.",
                         operatingHours: "09:00 - 18:00", hasWheelchairAccess: nil, hasParking: nil),
            SearchableItem(name: "Eka Hospital", category: .office, imageName: "eka_hospital",
                         description: "Eka Hospital Headquarters.",
                         operatingHours: "09:00 - 18:00", hasWheelchairAccess: nil, hasParking: nil),
            SearchableItem(name: "Farmsco", category: .office, imageName: "farmsco",
                         description: "Farmers' cooperative.",
                         operatingHours: "09:00 - 18:00", hasWheelchairAccess: nil, hasParking: nil),
            SearchableItem(name: "GBI", category: .office, imageName: "gbi",
                         description: "Church Organization.",
                         operatingHours: "09:00 - 18:00", hasWheelchairAccess: nil, hasParking: nil),
            SearchableItem(name: "Living Lab", category: .office, imageName: "living_lab",
                         description: "Living Lab is a research center.",
                         operatingHours: "09:00 - 18:00", hasWheelchairAccess: nil, hasParking: nil),
            SearchableItem(name: "Monash University", category: .office, imageName: "monash",
                         description: "Monash University in BSD Campus.",
                         operatingHours: "09:00 - 18:00", hasWheelchairAccess: nil, hasParking: nil),
            SearchableItem(name: "Nex", category: .office, imageName: "nex",
                         description: "Nex Technology Headquarters",
                         operatingHours: "09:00 - 18:00", hasWheelchairAccess: nil, hasParking: nil),
            SearchableItem(name: "Sinar Mitbana", category: .office, imageName: "sinar_mitbana",
                         description: "SinarMas's construction and building company",
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
 