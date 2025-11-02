//
//  MusicPlayerView.swift
//  CeruleanMusic
//
//  Created by ハイラル・ゼルダ on 2/11/2025.
//

import Foundation
import SwiftUI

struct MusicPlayerView: View {
    @ObservedObject var viewModel: MusicControllerViewModel
    var body: some View {
        HStack {
            GlassEffectContainer {
                HStack(spacing: 6) {

                    //播放控制键

                    //上一首
                    Button {
                        viewModel.previous()
                    } label: {
                        Image(systemName: "backward")
                    }
                    .frame(width: 20)
                    .padding(8)
                    .keyboardShortcut(.leftArrow)
                    .glassEffect()
                    //暫停 繼續
                    Button {
                        viewModel.togglePlay()
                    } label: {
                        switch viewModel.playStatus {
                        case .playing:
                            Image(systemName: "pause")
                                .imageScale(.large)
                        case .stopped, .paused:
                            Image(systemName: "play")
                                .imageScale(.large)
                        }
                    }
                    .frame(width: 30)
                    .padding(8)
                    .keyboardShortcut(.space, modifiers: [])
                    .glassEffect()
                    //下一首
                    Button {
                        viewModel.next()
                    } label: {
                        Image(systemName: "forward")
                    }
                    .frame(width: 20)
                    .padding(8)
                    .keyboardShortcut(.rightArrow)
                    .glassEffect()
                }
            }
            .buttonStyle(.plain)
            .padding()
            
            Spacer()
            
            if let m = viewModel.music {
                ZStack {
                    SingleMusicView(
                        viewModel: MusicViewModel(m),
                        viewType: .tight
                    )
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                }
                .animation(.snappy())
                .glassEffect()
            }
        }
    }
}

#Preview {
    MusicPlayerView(viewModel: MusicControllerViewModel())
        .padding()
}
