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
    
    private let albumSize: CGFloat = 50
    private let albumRoundCorner: CGFloat = 8
    private func CoverView(tapToPlay: Bool = true) -> some View {
        ZStack{
            switch viewModel.coverState {
            case .loading:
                ProgressView()
                    .imageScale(.small)
            case .loaded:
                viewModel.cover!
                    .resizable()
                    .scaledToFit()
            case .failed:
                Image(systemName: "music.note")
                    .foregroundStyle(.secondary)
                    .imageScale(.large)
            }
        }
        .frame(maxWidth: albumSize, maxHeight: albumSize)
        .cornerRadius(albumRoundCorner)
        //點擊時播放
        .onTapGesture{
            
        }
    }
    private func updateCover() {
        Task.detached{
            await self.viewModel.loadCover()
        }
    }
    
    var body: some View {
        HStack{
            CoverView()
            VStack(alignment: .leading) {
                Text(viewModel.tags.title)
                Text(
                    viewModel.tags.album == nil ? "" : viewModel.tags.album!.name
                )
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }.frame(width: 150, alignment: .leading)
            HStack(spacing: 8) {
                ForEach(viewModel.tags.artists) { artist in
                    Text(artist.name)
                }
            }
        }
        .onAppear{
            updateCover()
        }
    }
}
