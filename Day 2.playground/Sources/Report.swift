import Foundation

struct Report {
    let levels: [Int]
    
    var isTotallySafe: Bool {
        return checkIfSafe(levels)
    }
    
    var isSafeWithinDamperLimits: Bool {
        if (isTotallySafe){
            return true
        }
        
        // Not particularly efficienct, but performance doesn't really matter
        for omittedIndex in 0...levels.count {
            let damperedLevels = levels.without(index: omittedIndex)
            let isSafe = checkIfSafe(damperedLevels)
            
            if isSafe {
                return true
            }
        }
        
        return false
    }
    
    private func checkIfSafe(_ levels: [Int]) -> Bool {
        let allLevelsAreDecreasing = checkIfLevelsAreDecreasing(levels)
        let allLevelsAreIncreasing = checkIfLevelsAreIncreasing(levels)
        let allAdjacentLevelsWithinBounds = checkIfAdjacentLevelsWithinBounds(levels)
        
        return (allLevelsAreDecreasing || allLevelsAreIncreasing) && allAdjacentLevelsWithinBounds
    }
    
    // NOTE: Duplicates would suggest neither increasing nor decreasing, which is not desired
    private func checkIfLevelsAreDecreasing(_ levels: [Int]) -> Bool {
        let idealLevels = levels.withoutDuplicates().sorted(by: >)
        return levels == idealLevels
    }
    
    private func checkIfLevelsAreIncreasing(_ levels: [Int]) -> Bool {
        let idealLevels = levels.withoutDuplicates().sorted(by: <)
        return levels == idealLevels
    }
    
    private func checkIfAdjacentLevelsWithinBounds(_ levels: [Int]) -> Bool {
        let acceptableStepSizes = [1, 2, 3]
        let adjacentLevels = zip(levels, levels.dropFirst())
        let stepSizes = adjacentLevels.map { abs($1 - $0) }
        
        for stepSize in stepSizes {
            if acceptableStepSizes.contains(stepSize) {
                continue
            } else {
                return false
            }
        }
        
        return true
    }
    
}

extension Collection where Element == Int {
    
    func withoutDuplicates() -> [Int] {
        return Array(Set(self))
    }
    
    func without(index: Int) -> [Int] {
        return self.enumerated().filter({ $0.offset != index }).map({ $0.element })
    }
    
}
