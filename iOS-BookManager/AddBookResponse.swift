import APIKit
import Himotoki

struct AddBookResponse: Himotoki.Decodable {
    var bookId: Int//
    
    static func decode(_ e: Extractor) throws -> AddBookResponse {
        return try AddBookResponse(bookId: e <| "result")
    }
}
