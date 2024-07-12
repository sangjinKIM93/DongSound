//
//  DongSoundWidgetControl.swift
//  DongSoundWidget
//
//  Created by 김상진 on 7/12/24.
//

import AppIntents
import SwiftUI
import WidgetKit

struct DongSoundWidgetControl: ControlWidget {
    static let kind: String = "com.ray.DongSound.DongSoundWidget"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind) {
            ControlWidgetToggle(
                isOn: SharedManager.shared.isTurnOn,
                action: SoundControlIntent(),
                valueLabel: { isTurnedOn in
                    Image(systemName: isTurnedOn ? "toilet.fill" : "toilet")
                    Text(isTurnedOn ? "Turned On" : "Turned Off")
                },
                label: {
                    Text("Bath Room")
                }
            )
        }
    }
}

struct SoundControlIntent: SetValueIntent {
    static var title: LocalizedStringResource { "Turn On Bath Room Music" }
    
    @Parameter(title: "is Turned On")
    var value: Bool
    
    func perform() async throws -> some IntentResult {
        SharedManager.shared.isTurnOn = value
        
        return .result()
    }
}
