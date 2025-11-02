//
//  MusicPlayer.swift
//  CeruleanMusic
//
//  Created by ハイラル・ゼルダ on 2/11/2025.
//

import Foundation

class MusicPlayer{
    enum PlayStatus {
        case playing
        case stopped
        case paused
    }
    var music: Music? = LocalMusic(
        url: URL(
            filePath: "/Users/zelda/Music/m/中島みゆき/10 Wings/01. 二隻(そう)の舟.m4a"
        )
    )
    var playStatus: PlayStatus = .stopped
    func setMusic(_ music: Music){
        self.music = music
    }
    func play(){
        playStatus = .playing
    }
    func pause(){
        playStatus = .paused
    }
    func resume(){
        playStatus = .playing
    }
    func stop(){
        playStatus = .stopped
    }
}
