//
//  Float+Format.swift
//  iosApp
//
//  Created by Tiberiu Gradinariu on 2024-06-07.
//  Copyright © 2024 orgName. All rights reserved.
//

import Foundation

extension Float {
    func decimals(_ noOfDecimals: Int) -> String {
        String(self.formatted(.number.precision(.fractionLength(noOfDecimals))))
    }
}
