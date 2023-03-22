import SwiftUI

// MARK: - Grid

public struct GridContainer {
    var rows: [GridRowContainer]
    var cells: [GridCellContainer] {
        rows.lazy.flatMap { $0.cells }
    }
    
    fileprivate init(rows: [GridRowContainer]) {
        self.rows = rows
    }
}

extension GridContainer {
     public init(@GridBuilder _ grid: () -> GridContainer) {
        self = grid()
    }
}

@resultBuilder public struct GridBuilder {
    static public func buildBlock(_ grids: GridContainer...) -> GridContainer {
        var container = GridContainer(rows: [])
        for grid in grids {
            container.rows.append(contentsOf: grid.rows)
        }
        return container
    }
    static public func buildExpression(_ row: GridRowContainer) -> GridContainer {
        GridContainer(rows: [row])
    }
    static public func buildArray(_ grids: [GridContainer]) -> GridContainer {
        GridContainer(rows: grids.flatMap { $0.rows })
    }
}

// MARK: - Grid Row

public struct GridRowContainer {
    var cells: [GridCellContainer]
    var count: Int { cells.count }
    
    fileprivate init(cells: [GridCellContainer]) {
        self.cells = cells
    }
}

extension GridRowContainer {
    public init(@GridRowBuilder _ row: () -> GridRowContainer) {
        self = row()
    }
}

@resultBuilder public struct GridRowBuilder {
    static public func buildBlock(_ components: GridRowContainer...) -> GridRowContainer {
        var container = GridRowContainer(cells: [])
        for component in components {
            container.cells.append(contentsOf: component.cells)
        }
        return container
    }
    static public func buildExpression(_ cell: GridCellContainer) -> GridRowContainer {
        GridRowContainer(cells: [cell])
    }
    static public func buildExpression(_ cells: [GridCellContainer]) -> GridRowContainer {
        GridRowContainer(cells: cells)
    }
    static public func buildArray(_ components: [GridRowContainer]) -> GridRowContainer {
        GridRowContainer(cells: components.flatMap { $0.cells })
    }
    static public func buildExpression(_ expression: some View) -> GridRowContainer {
        GridRowContainer(cells: [GridCellContainer(expression)])
    }
}

// MARK: - Grid Cell

public struct GridCellContainer: Identifiable {
    public var id = UUID()
    var alignment: HorizontalAlignment
    var content: AnyView
    
    public init(alignment: HorizontalAlignment = .center, @ViewBuilder _ content: @escaping () -> some View) {
        self.alignment = alignment
        self.content = AnyView(content())
    }
    
    public init(alignment: HorizontalAlignment = .center, _ content: some View) {
        self.alignment = alignment
        self.content = AnyView(content)
    }
}
