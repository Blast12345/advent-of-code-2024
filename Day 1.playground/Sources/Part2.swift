import Foundation

public struct Part2 {
    
    public init() {}
    
    public func calculateSimilarityScore(_ leftList: [Int], _ rightList: [Int]) -> Int {
        var totalSimilarity = 0
        
        for leftId in leftList {
            let occurrencesInRightList = rightList.filter({ leftId == $0 }).count
            totalSimilarity += leftId * occurrencesInRightList
        }
        
        return totalSimilarity
    }
    
}
