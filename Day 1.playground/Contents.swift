import Foundation

do {
    let inputFile = try InputFile()
    let input = try inputFile.read()
    
    let listParser = ListParser(input)
    let leftList = try listParser.getLeftList()
    let rightList = try listParser.getRightList()
    
    let part1 = Part1()
    let totalDistance = part1.calcuteTotalDistance(leftList, rightList)
    
    let part2 = Part2()
    let similarityScore = part2.calculateSimilarityScore(leftList, rightList)
    
} catch {
    print(error)
}
