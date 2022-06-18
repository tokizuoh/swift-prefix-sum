public struct SwiftPrefixSum {
    private var table: [Int] = []

    public init(numbers: [Int]) {
        table = Array<Int>(
            repeating: 0, count: numbers.count + 1
        )

        for i in 0..<numbers.count {
            table[i + 1] = numbers[i] + table[i]
        }
    }
}
