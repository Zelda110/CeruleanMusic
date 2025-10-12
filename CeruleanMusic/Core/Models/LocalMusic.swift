//
//  LocalMusic.swift
//  CeruleanMusic
//
//  Created by ハイラル・ゼルダ on 12/10/2025.
//

import AVFoundation
import Foundation
import SwiftUI

struct LocalMusic: Music {
    var url: URL
    var tags: Tag = Tag()

    func loadTags() async -> Tag {
        do {
            let asset = AVURLAsset(url: url)
            let data = try await asset.load(.metadata)

            var tags = Tag()

            //標題
            if let title = try await AVMetadataItem.metadataItems(
                from: data,
                filteredByIdentifier: .commonIdentifierTitle
            ).first?.load(.stringValue) {
                tags.title = title
            }

            //藝術家
            if let artist = try await AVMetadataItem.metadataItems(
                from: data,
                filteredByIdentifier: .commonIdentifierArtist
            ).first?.load(.stringValue) {
                //分割多位藝術家
                let artists: [Artist] = artist.split(separator: " & ").map({
                    Artist.get(String($0))
                })
                tags.artists = artists
            }

            //專輯
            if let album = try await AVMetadataItem.metadataItems(
                from: data,
                filteredByIdentifier: .commonIdentifierAlbumName
            ).first?.load(.stringValue) {
                tags.album = Album.get(album)
            }

            return tags
        } catch _ { return Tag() }
    }

    func loadCover() async -> Image? {
        //從源文件讀取封面
        do {
            let asset = AVURLAsset(url: self.url)
            let data = try await asset.load(.metadata)
            if let cover = try await AVMetadataItem.metadataItems(
                from: data,
                filteredByIdentifier: .commonIdentifierArtwork
            ).first?.load(.value) {
                guard
                    let cgImageSource = CGImageSourceCreateWithData(
                        cover as! CFData,
                        nil
                    )
                else { return nil }
                return Image(
                    decorative: CGImageSourceCreateImageAtIndex(
                        cgImageSource,
                        0,
                        nil
                    )!,
                    scale: 1.0
                )
            }
            return nil
        } catch _ { return nil }
    }
}
