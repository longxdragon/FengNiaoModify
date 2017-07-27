//
//  Extensions.swift
//  FengNiaoModify
//
//  Created by longxdragon on 2017/7/27.
//
//

import Foundation
import PathKit

extension String {
    var fullRange: NSRange {
        return NSMakeRange(0, utf16.count)
    }
    
    var plainName: String {
        let p = Path(self)
        var result = p.lastComponentWithoutExtension;
        if result.hasSuffix("@2x") || result.hasSuffix("@3x") {
            result = String(describing: result.utf16.dropLast(3))
        }
        return result
    }
}
