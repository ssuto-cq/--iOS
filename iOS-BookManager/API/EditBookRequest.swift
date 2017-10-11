import APIKit
import Himotoki

struct EditBookRequest: APIRequest {
    typealias Response = EditBookResponse
    var id: Int
    var name: String
    var image: String
    var price: Int
    var purchaseDate: String
    
    var method: HTTPMethod {
        return .put
    }
    
    var path: String {
        return "/books/\(id)"
    }
    
    var headerFields: [String : String] {
        return [
            "Content-Type": "application/json",
            "Authorization": UserDefaults.standard.string(forKey: "token")!
        ]
    }
    
    var bodyParameters: BodyParameters? {
        return JSONBodyParameters(JSONObject: [
            "name": name,
            "image": image,
            "price": price,
            "purchase_date": purchaseDate
            ])
    }
}
