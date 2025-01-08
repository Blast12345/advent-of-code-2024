import UIKit

do {
    let inputFile = try InputFile()
    let input = try inputFile.read()
    
    let part1 = Part1()
    let totalOfMultiplications = try part1.calculateTotalOfMultiplications(input)
    
    let part2 = Part2()
    let totalOfEnabledMultiplications = try part2.calculateTotalOfEnabledMultiplications(input)
} catch {
    print(error)
}
