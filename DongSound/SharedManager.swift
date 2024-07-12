//
//  SharedManager.swift
//  DongSound
//
//  Created by 김상진 on 7/12/24.
//

import Foundation

class SharedManager {
    static let shared = SharedManager()
    var isTurnOn: Bool = false {
        didSet {
            if isTurnOn {
                MusicPlayer.shared.playSound()
            } else {
                MusicPlayer.shared.stopSound()
            }
        }
    }
}
