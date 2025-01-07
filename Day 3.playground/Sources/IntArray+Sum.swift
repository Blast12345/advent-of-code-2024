import Foundation

extension Collection where Element == Int {
    
    func sum() -> Int {
        return self.reduce(0, +)
    }
    
}
