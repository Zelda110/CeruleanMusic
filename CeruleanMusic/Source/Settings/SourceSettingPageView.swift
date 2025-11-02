//
//  SourceSettingPageView.swift
//  CeruleanMusic
//
//  Created by ハイラル・ゼルダ on 12/10/2025.
//

import Foundation
import SwiftUI

struct SourceSettingPageView: View {
    @ObservedObject var sourceData: SourceData
    @State var adding: Bool = false
    var body: some View {
        VStack {
            List {
                ForEach(sourceData.sources.map { SourceViewModel(source: $0) })
                { vm in
                    SourceView(viewModel: vm)
                }
            }
            HStack {
                Spacer()
                Button("+") {
                    adding = true
                }
            }
        }.sheet(isPresented: $adding) {
            SourceAddView(displaying: $adding, sourceData: sourceData)
                .padding()
        }
    }
}

//TODO
struct SourceAddView: View {
    @Binding var displaying: Bool
    @ObservedObject var sourceData: SourceData
    @State var sourceType: SourceViewModel.SourceType?
    var body: some View {
        VStack {
            VStack {
                Button {
                    sourceType = .local
                } label: {
                    HStack {
                        Image(systemName: "desktopcomputer")
                        VStack(alignment: .leading) {
                            Text("本地")
                            Text("掃描本地或局域網路徑的音樂文件夾")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(
                                sourceType == .local
                                    ? Color.accentColor.opacity(0.15) : .clear
                            )
                    )
                }
                .buttonStyle(.plain)
            }.listStyle(.plain)
            Spacer()
            HStack {
                Spacer()
                Button("取消") { displaying = false }
                NavigationLink {
                    switch sourceType {
                    case .local:
                        LocalSourceAddView(
                            displaying: $displaying,
                            sourceData: sourceData
                        )
                    case nil:
                        EmptyView()
                    }
                } label: {
                    Text("下一步")
                }.disabled(sourceType == nil)
            }
        }
    }
}

struct LocalSourceAddView: View {
    @Binding var displaying: Bool
    @ObservedObject var sourceData: SourceData
    @State var selectedPath: URL?
    var body: some View {
        VStack {
            Button("選擇文件夾") {
                selectedPath = chooseFile(
                    canChooseDirectories: true,
                    title: "選擇要監控的文件夾"
                )
            }
        }
    }
}

#Preview {
    SourceSettingPageView(
        sourceData: SourceData(
            sources: [LocalSource(url: URL(filePath: "/Users/zelda/Music/m"))])
    )
}
