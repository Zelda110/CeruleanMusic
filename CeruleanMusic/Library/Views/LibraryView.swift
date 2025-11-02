//
//  LibraryView.swift
//  CeruleanMusic
//
//  Created by ハイラル・ゼルダ on 12/10/2025.
//

import Foundation
import SwiftUI

struct LibraryView: View {
    @State var vms: [MusicViewModel]
    var body: some View {
        List {
            ForEach(vms) { vm in
                SingleMusicView(viewModel: vm)
            }
        }.backgroundStyle(.clear)
    }
}

#Preview {
    LibraryView(
        vms: [
            MusicViewModel(
                LocalMusic(
                    url: URL(
                        filePath:
                            "/Users/zelda/Music/m/中島みゆき/10 Wings/01. 二隻(そう)の舟.m4a"
                    )
                )
            )
        ]
    )
}
