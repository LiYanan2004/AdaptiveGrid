//
//  AdaptiveGridRow.swift
//  TableDemo
//
//  Created by LiYanan2004 on 2023/1/25.
//

import SwiftUI

struct AdaptiveGridRow: View {
    var row: GridRowContainer
    var columnWidth: [CGFloat]
    var spacing: CGFloat?
    // Update cell width when detected
    var sizeOnChange: (_ col: Int, _ width: CGFloat) -> Void
    
    var body: some View {
        HStack(spacing: spacing) {
            ForEach(row.cells.indices, id: \.self) { index in
                let cell = row.cells[index]
                let alignment = Alignment(horizontal: cell.alignment, vertical: .center)
                
                if columnWidth[index] != .zero {
                    cell.content
                        .frame(maxWidth: columnWidth[index], alignment: alignment)
                }
            }
            if row.count < columnsCount {
                ForEach(row.count..<columnsCount, id: \.self) { index in
                    Color.clear
                        .frame(maxWidth: columnWidth[index])
                        .frame(height: 1)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .overlay { sizeDetector }
    }
    
    private var columnsCount: Int { columnWidth.count }
    
    private var sizeDetector: some View {
        HStack {
            ForEach(row.cells.indices, id: \.self) { index in
                let cell = row.cells[index]
                cell.content
                    .onWidthChange { sizeOnChange(index, $0) }
            }
        }
        .hidden()
    }
}
