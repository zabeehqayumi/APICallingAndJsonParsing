//
//  Arrary+Extension.swift
//  APICallingAndJsonParsing
//
//  Created by Zab on 11/28/20.
//

import Foundation

extension Array {
    public func object(at index: Int) -> Element? {
        guard index < self.count, index >= 0 else  { return nil }
        return self[index]
    }
}
