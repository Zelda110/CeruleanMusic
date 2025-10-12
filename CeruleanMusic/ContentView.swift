//
//  ContentView.swift
//  CeruleanMusic
//
//  Created by ハイラル・ゼルダ on 12/10/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var sourceData: SourceData =  SourceData(
        sources: [LocalSource(url: URL(filePath: "/Users/zelda/Music/m"))]
    )
    
    enum Page {
        case music
        case home
        case source
    }
    enum SideBar {
        case playList
        case lyrics
        case null
    }

    @State var page: Page = .music
    @State var sideBar: SideBar = .playList
    var body: some View {
        HStack{
            NavigationSplitView {
                List(selection: $page) {
                    Section {
                        Label("主頁", systemImage: "house")
                            .tag(Page.home)
                    }
                    Section(header: Text("資料庫")) {
                        Label("音樂", systemImage: "music.note")
                            .tag(Page.music)
                    }
                    Section(header: Text("設置")) {
                        Label("音樂源", systemImage: "music.note.arrow.trianglehead.clockwise")
                            .tag(Page.source)
                    }
                }.listStyle(.sidebar)
            } detail: {
                ZStack{
                    switch page {
                    case .music:
                        LibraryView(vms: [MusicViewModel(LocalMusic(url: URL(filePath:"/Users/zelda/Music/m/中島みゆき/10 Wings/01. 二隻(そう)の舟.m4a")))])
                    case .home:
                        EmptyView()
                    case .source:
                        SourceSettingPageView(sourceData: sourceData)
                    }
                }.padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
