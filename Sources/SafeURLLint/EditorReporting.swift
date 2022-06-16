//
//  File.swift
//  
//
//  Created by Jhonatan A. on 16/06/22.
//

import Foundation

enum EditorMessageType: String {
    case error, warning
}

func reportMessageToEditor(location: Location, type: EditorMessageType = .error, description: String) {
    // Xcode likes warnings and errors in the following format:
    // {full_path_to_file}:{line}:{column_start}-{column_end}: {error,warning}: {content}
    print("\(location.description): \(type.rawValue): \(description)")
}

private extension Location {
    var description: String {
        let fileString: String = file ?? "<nopath>"
        let lineString: String = ":\(line ?? 1)"
        var colRangeString: String = ":\(columnStart ?? 1)"
        if let columnEnd {
            colRangeString += "-\(columnEnd)"
        }
        return [fileString, lineString, colRangeString].joined()
    }
}
