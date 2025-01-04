import Foundation

extension Collection where Element == Int {
    
    public func sum() -> Int {
        return self.reduce(0, +)
    }
    
}
