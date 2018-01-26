import Foundation

extension Int {
    // 生成 Int 随机数
    public static func random(range: Range<Int>) -> Int {
        let r = UInt32(range.upperBound - range.lowerBound)
        return  Int(arc4random_uniform(r)) + range.lowerBound
    }
    // 生成 Int 随机数组
    public static func randomArray(range: Range<Int>, count: Int) -> [Int] {
        var array: [Int] = []
        for _ in 0..<count {
            array.append(Int.random(range: range))
        }
        return array
    }
}


