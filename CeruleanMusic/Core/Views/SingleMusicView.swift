//
//  SingleMusicView.swift
//  CeruleanMusic
//
//  Created by ハイラル・ゼルダ on 12/10/2025.
//

import Foundation
import SwiftUI

struct SingleMusicView: View {
    @ObservedObject var viewModel: MusicViewModel
    var viewType: MusicViewType = .normal

    enum MusicViewType {
        case normal
        case tight
    }

    private let albumSize: CGFloat = 30
    private let albumRoundCorner: CGFloat = 5
    private func CoverView(tapToPlay: Bool = true) -> some View {
        ZStack {
            switch viewModel.coverState {
            case .loading:
                ProgressView()
                    .imageScale(.small)
            case .loaded:
                viewModel.cover!
                    .resizable()
                    .scaledToFill()
            case .failed:
                Image(systemName: "music.note")
                    .foregroundStyle(.secondary)
                    .imageScale(.large)
            }
        }
        .frame(maxWidth: albumSize, maxHeight: albumSize)
        .cornerRadius(albumRoundCorner)
        //點擊時播放 TODO
        .onTapGesture {

        }
    }
    private func updateCover() {
        Task.detached {
            await self.viewModel.loadCover()
        }
    }

    var body: some View {
        HStack {
            //封面
            CoverView()
            switch viewType {
            case .normal:
                //歌名 专辑
                VStack(alignment: .leading) {
                    Text(viewModel.tags.title)
                    Text(
                        viewModel.tags.album == nil
                            ? "" : viewModel.tags.album!.name
                    )
                    .font(.footnote)
                    .foregroundStyle(.gray)
                }.frame(width: 150, alignment: .leading)
                //歌手
                HStack(spacing: 8) {
                    ForEach(viewModel.tags.artists) { artist in
                        Text(artist.name)
                    }
                }
            case .tight:
                //歌名 专辑-歌手
                VStack(alignment: .leading) {
                    Text(viewModel.tags.title)
                    HStack(spacing: 8) {
                        Text(
                            viewModel.tags.album == nil
                                ? "" : viewModel.tags.album!.name + "  -"
                        )
                        ForEach(viewModel.tags.artists) { artist in
                            Text(artist.name)
                        }
                    }
                    .font(.footnote)
                    .foregroundStyle(.gray)
                }
            }
        }
        .onAppear {
            updateCover()
        }
    }
}
