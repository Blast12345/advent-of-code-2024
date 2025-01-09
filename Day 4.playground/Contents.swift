import UIKit

do {
    let inputFile = try InputFile()
    let input = try inputFile.read()
    
    let part1 = Part1()
    let occurrences = try part1.calculateOccurencesOfXmas(input)
} catch {
    print(error)
}
