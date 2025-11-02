//
//  MusicController.swift
//  CeruleanMusic
//
//  Created by ハイラル・ゼルダ on 2/11/2025.
//

import Foundation

class MusicController{
    var player: MusicPlayer = MusicPlayer()
    var playList: [Music] = []
    var index: Int = -1
    
    func setPlayList(_ list: [Music]){
        playList = list
    }
    
    func next(){
        
    }
    func previous(){
        
    }
    func pause(){
        player.pause()
    }
    func play(){
        
    }
    func stop(){
        
    }
}
