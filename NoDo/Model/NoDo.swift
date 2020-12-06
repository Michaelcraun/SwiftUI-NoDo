//
//  NoDo.swift
//  NoDo
//
//  Created by Michael Craun on 5/9/20.
//  Copyright © 2020 Michael Craun. All rights reserved.
//

import Foundation
import SwiftUI

let formatter = DateFormatter()

struct NoDo: Identifiable {
    private let dateAdded = Date()
    var id = UUID()
    var name: String = ""
    var isDone: Bool = false
    var dateText: String {
        formatter.dateFormat = "MMM d, YYY, h:mm a"
        return formatter.string(from: dateAdded)
    }
}
