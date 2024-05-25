//
//  CostChart.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/25.
//

import Charts
import SwiftUI

struct CostChart: View {
    struct ToyShape: Identifiable {
        var color: String
        var type: String
        var count: Double
        var id = UUID()
        var day: Int
    }

    var stackedBarData: [ToyShape] = [
        .init(color: "Green", type: "Instagram", count: 2, day: 1),
        .init(color: "Green", type: "Instagram", count: 0, day: 1),
        .init(color: "Green", type: "Instagram", count: 1, day: 1),
        .init(color: "Purple", type: "Twitter", count: 1, day: 1),
        .init(color: "Purple", type: "Twitter", count: 1, day: 1),
        .init(color: "Purple", type: "Twitter", count: 1, day: 1),
        .init(color: "Pink", type: "Tiktok", count: 1, day: 1),
        .init(color: "Pink", type: "Tiktok", count: 2, day: 1),
        .init(color: "Pink", type: "Tiktok", count: 0, day: 1),
        .init(color: "Yellow", type: "YouTube", count: 1, day: 4),
        .init(color: "Yellow", type: "YouTube", count: 1, day: 4),
        .init(color: "Yellow", type: "YouTube", count: 2, day: 4),
        .init(color: "Purple", type: "Twitter", count: 1, day: 4),
        .init(color: "Purple", type: "Twitter", count: 1, day: 2),
        .init(color: "Purple", type: "Twitter", count: 1, day: 2),
        .init(color: "Pink", type: "Tiktok", count: 1, day: 1),
        .init(color: "Pink", type: "Tiktok", count: 2, day: 2),
        .init(color: "Pink", type: "Tiktok", count: 0, day: 1),
        .init(color: "Yellow", type: "YouTube", count: 1, day: 2),
        .init(color: "Yellow", type: "YouTube", count: 1, day: 3),
        .init(color: "Yellow", type: "YouTube", count: 2, day: 3)
    ]

    var weekAverageDuration = 3

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("6 - 13 Jun Average")
                    Text("185 ⌘")
                }
                Spacer()
                HStack {
                    Image(systemName: "arrowshape.down.circle")
                    Text("38% from last week")
                }
            }
            
            Chart {
                ForEach(stackedBarData) { shape in
                    BarMark(
                        x: .value("Day", shape.day),
                        y: .value("Total Count", shape.count)
                    )
                    .foregroundStyle(by: .value("Shape Color", shape.type))
                }
                
                
                RuleMark(
                    y: .value("Average", weekAverageDuration)
                )
                .foregroundStyle(.green)
                .lineStyle(StrokeStyle(lineWidth: 1.5, dash: [3, 5]))
                .annotation(position: .trailing, alignment: .leading) {
                    Text("avg")
                        .font(.caption2)
                        .foregroundStyle(.green)
                }
            }.frame(height: 150)
        }
    }
}

#Preview {
    CostChart()
}
