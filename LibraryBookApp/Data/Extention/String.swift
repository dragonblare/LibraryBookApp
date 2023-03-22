//
//  String.swift
//  LibraryBookApp
//
//  Created by 城龍太朗 on 2023/03/22.
//

import SwiftUI

extension String {
    func localized() -> String {
        let path = Bundle.main.path(forResource: "ja", ofType: "lproj")!
        if let bundle = Bundle(path: path) {
            let str = bundle.localizedString(forKey: self, value: nil, table: nil)
            return str
        }
        return ""
    }
    func contain(pattern: String) -> Bool {
        guard let regex = try? NSRegularExpression(
            pattern: pattern,
            options: NSRegularExpression.Options()
        ) else {
            let errorMessage = "string containエラー pattern:\(pattern)"
            debugPrint(errorMessage)
            return false
        }
        return regex.firstMatch(
            in: self,
            options: NSRegularExpression.MatchingOptions(),
            range: NSMakeRange(0, self.count)
        ) != nil
    }
}
