//
//  data.swift
//  CeruleanMusic
//
//  Created by ハイラル・ゼルダ on 12/10/2025.
//

import Foundation
import Combine

class SourceData: ObservableObject {
    init(sources: [Source]) {
        self.sources = sources
    }
    @Published var sources: [Source]
    
    func append(_ source: Source){
        sources.append(source)
    }
}
