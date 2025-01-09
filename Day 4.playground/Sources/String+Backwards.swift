import Foundation

extension String {
    
    // The provided `reversed()` function does NOT return a plain string,
    // so this extension provides a more convenient way to access said output
    var backwards: String {
        return String(reversed())
    }
    
}
