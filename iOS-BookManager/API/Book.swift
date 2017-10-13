import APIKit
import Himotoki

struct Book: Himotoki.Decodable{
    var id: Int
    var name: String
    var imagePath: String
    var price: Int
    var purchaseDate: String
    
    static func decode(_ e: Extractor) throws -> Book {
        return try Book(
            id: e <| "id",
            name: e <| "name",
            imagePath: e <| "image",
            price: e <| "price",
            purchaseDate: e <| "purchase_date"
        )
    }
}
