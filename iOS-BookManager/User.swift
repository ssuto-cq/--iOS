import APIKit
import Himotoki

struct User: Himotoki.Decodable {
    var id: Int
    var token: String
    
    static func decode(_ e: Extractor) throws -> User {
        return try User(
            id: e <| "user",
            token: e <| "token"
        )
    }
}
