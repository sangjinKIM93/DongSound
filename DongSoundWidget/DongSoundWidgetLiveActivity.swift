//
//  DongSoundWidgetLiveActivity.swift
//  DongSoundWidget
//
//  Created by 김상진 on 7/12/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct DongSoundWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct DongSoundWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: DongSoundWidgetAttributes.self) { context in
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

extension DongSoundWidgetAttributes {
    fileprivate static var preview: DongSoundWidgetAttributes {
        DongSoundWidgetAttributes(name: "World")
    }
}

extension DongSoundWidgetAttributes.ContentState {
    fileprivate static var smiley: DongSoundWidgetAttributes.ContentState {
        DongSoundWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: DongSoundWidgetAttributes.ContentState {
         DongSoundWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: DongSoundWidgetAttributes.preview) {
   DongSoundWidgetLiveActivity()
} contentStates: {
    DongSoundWidgetAttributes.ContentState.smiley
    DongSoundWidgetAttributes.ContentState.starEyes
}
