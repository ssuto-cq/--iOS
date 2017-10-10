import APIKit
import Himotoki

struct AddBookResponse: Himotoki.Decodable {
    var result: [Book]
    
    static func decode(_ e: Extractor) throws -> AddBookResponse {
        return try AddBookResponse(result: e <|| "result")
    }
}
