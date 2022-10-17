//
//  NotificationAttributes.swift
//  Runner
//
//  Created by admin on 10/13/22.
//

import ActivityKit
import Foundation

struct NotificationAttributes: ActivityAttributes {
    public typealias NotificationStatus = ContentState

    public struct ContentState: Codable, Hashable {
        var title: String
        var description: String
        var time: Date
    }
}
