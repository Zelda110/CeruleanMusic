//
//  SourceView.swift
//  CeruleanMusic
//
//  Created by ハイラル・ゼルダ on 12/10/2025.
//

import Foundation
import SwiftUI

struct SourceView: View {
    @ObservedObject var viewModel: SourceViewModel
    
    func IconView() -> some View {
        ZStack{
            switch viewModel.sourceType {
            case .local:
                Image(systemName: "desktopcomputer")
            }
        }
    }
    
    var body: some View {
        HStack{
            IconView()
            Text(viewModel.name)
        }
    }
}
