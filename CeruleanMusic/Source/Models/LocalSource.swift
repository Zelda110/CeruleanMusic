//
//  LocalSource.swift
//  CeruleanMusic
//
//  Created by ハイラル・ゼルダ on 12/10/2025.
//

import Foundation

class LocalSource: Source{
    init(url: URL) {
        self.url = url
        self.name = url.path()
    }
    
    func load() -> Bool {
        return true
    }
    func refresh() {
        return
    }
    
    var name: String
    var url: URL
    var songs: [Music] = []
}
