import UIKit

do {
    let inputFile = try InputFile()
    let input = try inputFile.read()
    
    let part1 = Part1()
    let occurencesOfXmas = try part1.countOccurencesOfXmas(input)
    
    let part2 = Part2()
    let occurencesOfXOfMas = try part2.countOccurencesOfXOfMas(input)
} catch {
    print(error)
}
