//
//  FileDealing.swift
//  CeruleanMusic
//
//  Created by ハイラル・ゼルダ on 12/10/2025.
//

import Foundation
import SwiftUI

#if os(macOS)
func chooseFile(canChooseFiles: Bool = false,canChooseDirectories: Bool = false,title: String = "") -> URL? {
    let panel = NSOpenPanel()
    panel.title = title
    panel.allowsMultipleSelection = false
    panel.canChooseFiles = canChooseFiles
    panel.canChooseDirectories = canChooseDirectories
    panel.canCreateDirectories = true
    if panel.runModal() == .OK {
        return panel.url
    }
    return nil
}
#endif
