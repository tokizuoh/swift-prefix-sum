import XCTest
@testable import SwiftPrefixSum

final class PrefixSumArrayTests: XCTestCase {
    let numberCount = 10000
    let queryCount = 100
    
    struct Pair {
        let x: Int
        let y: Int
    }
        
    func testSpeedComparison() throws {
        // クエリの対象となる配列を準備
        var numbers: [Int] = []
        for _ in 0..<numberCount {
            numbers.append(Int.random(in: 0..<100))
        }
        
        // クエリを準備
        var pairs: [Pair] = []
        for _ in 0..<queryCount {
            var x = Int.random(in: 0..<numberCount - 1)
            var y = Int.random(in: 0..<numberCount - 1)
            if x > y {
                swap(&x, &y)
            }
            pairs.append(Pair(x: x, y: y))
        }
        
        // 愚直な手法
        let start1 = Date()
        var results1: [Int] = []
        for p in pairs {
            var total = 0
            for i in p.x...p.y {
                total += numbers[i]
            }
            results1.append(total)
        }
        let elapsed1 = Date().timeIntervalSince(start1)
        print("✅愚直な手法: \(elapsed1)s")
        
        // 累積和
        let start2 = Date()
        let psArray = PrefixSumArray(numbers: numbers)
        var results2: [Int] = []
        for p in pairs {
            guard let total = psArray.query(start: p.x, end: p.y) else {
                XCTFail()
                return
            }
            results2.append(total)
        }
        let elapsed2 = Date().timeIntervalSince(start2)
        print("✅累積和: \(elapsed2)s")
        
        // すべての計算結果が合致するか
        XCTAssertEqual(results1, results2)
    }
}
