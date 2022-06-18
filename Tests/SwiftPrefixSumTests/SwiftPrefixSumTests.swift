import XCTest
@testable import SwiftPrefixSum

final class SwiftPrefixSumTests: XCTestCase {
    func testExample() throws {
        let numbers = [1, 2, 3, 4, 5, 6]
        let array = PrefixSumArray(numbers: numbers)
        XCTAssertEqual(array.query(start: 1, end: 3)!, 9)
    }
}
