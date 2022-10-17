//
//  NotificationLiveActivity.swift
//  Notification
//
//  Created by admin on 10/13/22.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct NotificationLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: NotificationAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)
            
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text("Min")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

func startDeliveryPizza() {
    let pizzaDeliveryAttributes = NotificationAttributes()

    let initialContentState = NotificationAttributes.NotificationStatus(title: "TIM 👨🏻‍🍳", description: "ASDD", time: Date().addingTimeInterval(15 * 60))

    do {
        let deliveryActivity = try Activity<NotificationAttributes>.request(
            attributes: pizzaDeliveryAttributes,
            contentState: initialContentState,
            pushType: nil)
        print("Requested a pizza delivery Live Activity \(deliveryActivity.id)")
    } catch (let error) {
        print("Error requesting pizza delivery Live Activity \(error.localizedDescription)")
    }
}

func updateDeliveryPizza() {
    Task {
        let updatedDeliveryStatus = NotificationAttributes.NotificationStatus(title: "TIM 👨🏻‍🍳", description: "XMCB", time: Date().addingTimeInterval(60 * 60))

        for activity in Activity<NotificationAttributes>.activities{
            await activity.update(using: updatedDeliveryStatus)
        }
    }
}

func stopDeliveryPizza() {
    Task {
        for activity in Activity<NotificationAttributes>.activities{
            await activity.end(dismissalPolicy: .immediate)
        }
    }
}

func showAllDeliveries() {
    Task {
        for activity in Activity<NotificationAttributes>.activities {
            print("Pizza delivery details: \(activity.id) -> \(activity.attributes)")
        }
    }
}
