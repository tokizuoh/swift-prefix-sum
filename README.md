# SwiftPrefixSum

## Install

Can be installed via SwiftPM.

## Usage

```swift
import SwiftPrefixSum

let numbers = [1, 2, 3, 4, 5]
let prefixSumArray = PrefixSumArray(numbers: numbers)
print(prefixSumArray.query(start: 1, end: 3))  // Optional(9)
```