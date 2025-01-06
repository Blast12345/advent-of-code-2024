import UIKit

do {
    let inputFile = try InputFile()
    let input = try inputFile.read()
    
    let part1 = Part1()
    let totallySafeReports = try part1.getNumberOfTotallySafeReports(input)
    
    let part2 = Part2()
    let reportsWithinSafeDamperLimits = try part2.getNumberOfSafeReportsWithinDamperLimits(input)
} catch {
    print(error)
}
