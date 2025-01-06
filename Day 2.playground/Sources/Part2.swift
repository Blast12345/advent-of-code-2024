import Foundation

public struct Part2 {
    
    private let reportParser = ReportParser()
    
    public init() {}
    
    public func getNumberOfSafeReportsWithinDamperLimits(_ input: String) throws -> Int {
        let reports = try reportParser.parse(input)
        let safeReports = reports.filter({ $0.isSafeWithinDamperLimits })
        return safeReports.count
    }
    
}
