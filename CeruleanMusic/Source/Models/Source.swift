//
//  Source.swift
//  CeruleanMusic
//
//  Created by ハイラル・ゼルダ on 12/10/2025.
//

import Foundation

protocol Source{
    var name: String { get set }
    func load() -> Bool //導入音樂源
    func refresh() async //更新音樂源
    //TODO
//    func searchSongs(key: String) -> [Music] //搜索歌曲
//    func searchArtists(key: String) -> [Artist] //搜索藝人
//    func searchAlbums(key: String) -> [Album] //搜索專輯
}

