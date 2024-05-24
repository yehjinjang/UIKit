//
//  ToDoWidgetLiveActivity.swift
//  ToDoWidget
//
//  Created by 장예진 on 5/24/24.
//

/*
import ActivityKit
import WidgetKit
import SwiftUI

struct ToDoWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct ToDoWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ToDoWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
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
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension ToDoWidgetAttributes {
    fileprivate static var preview: ToDoWidgetAttributes {
        ToDoWidgetAttributes(name: "World")
    }
}

extension ToDoWidgetAttributes.ContentState {
    fileprivate static var smiley: ToDoWidgetAttributes.ContentState {
        ToDoWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: ToDoWidgetAttributes.ContentState {
         ToDoWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: ToDoWidgetAttributes.preview) {
   ToDoWidgetLiveActivity()
} contentStates: {
    ToDoWidgetAttributes.ContentState.smiley
    ToDoWidgetAttributes.ContentState.starEyes
}
*/
