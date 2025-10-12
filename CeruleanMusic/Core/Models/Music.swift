//
//  Music.swift
//  CeruleanMusic
//
//  Created by ハイラル・ゼルダ on 12/10/2025.
//

import Foundation
import SwiftUI

protocol Music {
    var tags: Tag { get set }
    func loadTags() async -> Tag
    func loadCover() async -> Image?
}
