//
//  MusicPlayer.swift
//  DongSound
//
//  Created by 김상진 on 7/12/24.
//

import AVFoundation

class MusicPlayer {
    static let shared = MusicPlayer()
    
    var player: AVAudioPlayer?

    func playSound() {
        guard let path = Bundle.main.path(forResource: "Hopscotch", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func stopSound() {
        player?.stop()
        player = nil
    }
}

/// 1. 리스트 만들기
/// - 알림 화면 참고
///.  2. 재생 기능 만들기
///.  -  유튜브 음악 참고
///.  3. control center 아이콘

