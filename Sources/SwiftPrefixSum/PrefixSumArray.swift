public struct PrefixSumArray {
    private var table: [Int] = []

    public init(numbers: [Int]) {
        table = Array<Int>(
            repeating: 0, count: numbers.count + 1
        )

        for i in 0..<numbers.count {
            table[i + 1] = numbers[i] + table[i]
        }
    }

    public func query(start: Int, end: Int) -> Int? {
        guard table.indices.contains(start),
              table.indices.contains(end + 1),
              start <= end else {
            return nil
        }

        return table[end + 1] - table[start]
    }
}
