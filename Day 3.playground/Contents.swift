import UIKit

do {
    let inputFile = try InputFile()
    let input = try inputFile.read()
    
    let part1 = Part1()
    let totalOfMultiplications = try part1.calculateTotalOfMultiplications(input)
} catch {
    print(error)
}
