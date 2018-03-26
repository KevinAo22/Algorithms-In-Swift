import Foundation

/*
 1. OR
 */

func || (_ left: Bool, right: @autoclosure () -> Bool) -> Bool {
    if left {
        return true
    } else {
        return right()
    }
}
