import Foundation

public struct DistancesCalculator {
    
    public init() {}
    
    public func calculate(_ list1: [Int], _ list2: [Int]) -> [Int] {
        var distances: [Int] = []
        
        let pairs = zip(list1, list2)
        
        for (leftItem, rightItem) in pairs {
            let distance = abs(leftItem - rightItem)
            distances.append(distance)
        }
        
        return distances
    }
}
