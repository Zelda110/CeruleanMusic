//
//  MusicControllerViewModel.swift
//  CeruleanMusic
//
//  Created by ハイラル・ゼルダ on 2/11/2025.
//

import Foundation
import Combine

class MusicControllerViewModel: ObservableObject {
    var controller: MusicController = MusicController()
    var playList: [Music] { controller.playList }
    var index: Int { controller.index }
    var playStatus: MusicPlayer.PlayStatus { controller.player.playStatus }
    var music: Music? { controller.player.music }
    
    func setPlayList(_ playList: [Music]) {
        self.controller.setPlayList(playList)
    }
    
    func next() {
        controller.next()
    }
    func previous() {
        controller.previous()
    }
    func togglePlay() {
        
    }
}
