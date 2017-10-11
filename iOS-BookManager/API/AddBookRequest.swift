import APIKit
import Himotoki

struct AddBookRequest: APIRequest {
    typealias Response = AddBookResponse
    var name: String
    var image: String
    var price: Int
    var purchaseDate: String
    
    var method: HTTPMethod{
        return .post
    }
    
    var path: String{
        return "/books"
    }
    
    var headerFields: [String : String]{
        return[
            "Content-Type": "application/json",
            "Authorization": UserDefaults.standard.string(forKey: "token")!
        ]
    }
    
    var bodyParameters: BodyParameters?{
        return JSONBodyParameters(JSONObject: [
            "name": name,
            "image": image,
            "price": price,
            "purchase_date": purchaseDate
            ])
    }
}
