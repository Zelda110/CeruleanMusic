//
//  MusicViewModel.swift
//  CeruleanMusic
//
//  Created by ハイラル・ゼルダ on 12/10/2025.
//

import Foundation
import Combine
import AVFoundation
import SwiftUI

class MusicViewModel: ObservableObject, Identifiable {
    enum CoverState {
        case loading
        case loaded
        case failed
    }
    
    init(_ music: any Music) {
        self.music = music
        Task.detached{
            await self.loadTags()
        }
    }
    
    @Published var music: any Music
    var tags: Tag { music.tags }
    @Published var coverState: CoverState = .loading
    @Published var cover: Image?
    
    //獲取歌曲元數據
    func loadTags() async {
        music.tags = await music.loadTags()
    }
    
    //獲取歌曲封面
    func loadCover() async {
        coverState = .loading
        //嘗試從專輯讀取
//        if let url = tags.album?.cover{
//            return Image(importing: url)
//        }
        //從音樂讀取
        if let cov = await music.loadCover() {
            cover = cov
            coverState = .loaded
            return
        }
        coverState = .failed
    }
}
