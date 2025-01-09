import Foundation

public struct InputFile {
    
    enum Errors: Error {
        case fileNotFound
        case readError
    }
    
    private let fileUrl: URL
    
    public init() throws {
        guard let fileUrl = Bundle.main.url(forResource: "input", withExtension: "txt") else {
            throw Errors.fileNotFound
        }
        
        self.fileUrl = fileUrl
    }
    
    public func read() throws -> String {
        do {
            return try String(contentsOf: fileUrl, encoding: .utf8)
        } catch {
            throw Errors.readError
        }
    }
    
}


