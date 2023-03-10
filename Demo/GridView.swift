//
//  GridView.swift
//  
//
//  Created by LiYanan2004 on 2023/1/25.
//

import SwiftUI
import AdaptiveGrid

struct GridView: View {
    var body: some View {
        AdaptiveGrid(horizontalSpacing: 10, verticalSpacing: 10) {
            GridRowContainer {
                GridCellContainer {
                    Text("Cell")
                }
                GridCellContainer(alignment: .leading) {
                    Text("Leading")
                }
            }
            GridRowContainer {
                GridCellContainer {
                    Text("Cell")
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
