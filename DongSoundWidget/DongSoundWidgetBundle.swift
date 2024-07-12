//
//  DongSoundWidgetBundle.swift
//  DongSoundWidget
//
//  Created by 김상진 on 7/12/24.
//

import WidgetKit
import SwiftUI

@main
struct DongSoundWidgetBundle: WidgetBundle {
    var body: some Widget {
        DongSoundWidget()
        DongSoundWidgetControl()
        DongSoundWidgetLiveActivity()
    }
}
