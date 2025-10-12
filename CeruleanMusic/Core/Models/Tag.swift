//
//  Tag.swift
//  CeruleanMusic
//
//  Created by ハイラル・ゼルダ on 12/10/2025.
//

import Foundation
import Playgrounds

struct LocalizedString: Codable {
    var key: Locale?
    var value: String
}

struct Tag: Codable {
    var title: String = ""
    var artists: [Artist] = []
    var album: Album?
}

struct Artist: Codable, Identifiable {
    static private var all: [Artist] = []
    static func get(_ name: String, temporary: Bool = false) -> Artist {
        let art = Artist.all
            .first { $0.names.map { $0.value }.contains(name) }
        if let art { return art }
        let newArt = Artist(names: [LocalizedString(value: name)])
        if !temporary { Artist.all.append(newArt) }
        return newArt
    }
    var id = UUID()
    var names: [LocalizedString]
    var display: Locale = Locale.current
    var name: String { names.first{ $0.key == display }?.value ?? names.first!.value }
}

struct Album: Codable, Identifiable {
    static private var all: [Album] = []
    static func get(_ name: String, temporary: Bool = false) -> Album {
        let alb = Album.all
            .first { $0.names.map { $0.value }.contains(name) }
        if let alb { return alb }
        let newAlb = Album(names: [LocalizedString(value: name)])
        if !temporary { Album.all.append(newAlb) }
        return newAlb
    }
    var id = UUID()
    var names: [LocalizedString]
    var display: Locale = Locale.current
    var name: String { names.first{ $0.key == display }?.value ?? names.first!.value }
    var cover: URL?
}
