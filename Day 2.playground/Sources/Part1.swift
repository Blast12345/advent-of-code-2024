import Foundation

public struct Part1 {
    
    private let reportParser = ReportParser()
    
    public init() {}
    
    public func getNumberOfTotallySafeReports(_ input: String) throws -> Int {
        let reports = try reportParser.parse(input)
        let safeReports = reports.filter({ $0.isTotallySafe })
        return safeReports.count
    }
    
}
