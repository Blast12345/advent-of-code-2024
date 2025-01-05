import Foundation

public struct Part1 {
    
    private let distancesCalculator = DistancesCalculator()
    
    public init() { }
    
    public func calcuteTotalDistance(_ leftList: [Int], _ rightList: [Int]) -> Int {
        let sortedLeftList = leftList.sorted()
        let sortedRightList = rightList.sorted()
        
        let distances = distancesCalculator.calculate(sortedLeftList, sortedRightList)
        
        return distances.sum()
    }
    
}
