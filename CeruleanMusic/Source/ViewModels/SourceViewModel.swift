//
//  SourceViewModel.swift
//  CeruleanMusic
//
//  Created by ハイラル・ゼルダ on 12/10/2025.
//

import Foundation
import Combine

class SourceViewModel: ObservableObject, Identifiable {
    enum SourceType {
        case local
    }
    
    init(source: Source) {
        self.source = source
        usable = source.load()
    }
    @Published var source: Source
    @Published var usable: Bool
    var name: String { source.name }
    var sourceType: SourceType {
        if source is LocalSource {
            return .local
        }
        else {
            fatalError("Unhandled source type")
        }
    }
    
    func refresh() async {
        await source.refresh()
    }
}
