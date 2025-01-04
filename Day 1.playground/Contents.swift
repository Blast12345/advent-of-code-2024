import Foundation

do {
    let inputFile = try InputFile()
    let input = try inputFile.read()
    
    let listParser = ListParser(input)
    let leftLocationIds = try listParser.getLeftList()
    let rightLocationIds = try listParser.getRightList()
    
    let sortedLeftLocationIds = leftLocationIds.sorted()
    let sortedRightLocationIds = rightLocationIds.sorted()
    
    let distancesCalculator = DistancesCalculator()
    let distances = distancesCalculator.calculate(sortedLeftLocationIds, sortedRightLocationIds)
    
    let sum = distances.sum()
    print(sum)
} catch {
    print(error)
}
