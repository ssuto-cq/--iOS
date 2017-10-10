import APIKit
import Himotoki

struct BookRequest: APIRequest {
    typealias Response = AddBookResponse
    let limit: Int
    let page: Int
    
    var method: HTTPMethod{
        return .get
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
    
    var parameters: Any?{
        return[
            "limit": limit,
            "page": page
        ]
    }
}
