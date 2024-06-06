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
    
    func getAverageValue() -> Double {
        let totalDays = Set(stackedBarData.map({$0.day})).count
        return Double(stackedBarData.reduce(0, {$0 + Int($1.count)}) / totalDays)
    }
    
    func getHighestDay() -> Int {
        var dayCounts = [Int: Int]()
        
        for data in stackedBarData {
            if let currentCount = dayCounts[data.day] {
                dayCounts[data.day] = currentCount + Int(data.count)
            } else {
                dayCounts[data.day] = Int(data.count)
            }
        }
        
        if let maxCountDay = dayCounts.max(by: { $0.value < $1.value }) {
            return maxCountDay.value
        }
        return 0
    }
    
    func getLowestDay() -> Int {
        var dayCounts = [Int: Int]()
        
        for data in stackedBarData {
            if let currentCount = dayCounts[data.day] {
                dayCounts[data.day] = currentCount + Int(data.count)
            } else {
                dayCounts[data.day] = Int(data.count)
            }
        }
        
        if let maxCountDay = dayCounts.max(by: { $0.value > $1.value }) {
            return maxCountDay.value
        }
        
        return 0
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("6 - 13 Jun Average")
                        .font(.callout)
                        .foregroundStyle(Color(hex: 0x8E8E93))
                    Text("185 ⌘")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                Spacer()
                HStack {
                    Image(systemName: "arrowshape.down.circle.fill")
                        .foregroundStyle(Color(hex: 0x8E8E93))
                    Text("38% from last week")
                        .font(.footnote)
                        .foregroundStyle(Color(hex: 0x8E8E93))
                }.frame(width: .infinity)
            }
            GeometryReader { geometry in
                Chart {
                    ForEach(stackedBarData) { shape in
                        BarMark(
                            x: .value("Day", shape.day),
                            y: .value("Total Count", shape.count)
                        )
                        .foregroundStyle(by: .value("Shape Color", shape.type))
                    }
                    
                    RuleMark(
                        xStart: 0,
                        xEnd: geometry.size.width * 0.9,
                        y: .value("Average", getHighestDay())
                    )
                    .lineStyle(StrokeStyle(lineWidth: 0, dash: []))
                    .annotation(position: .trailing, alignment: .leading) {
                        VStack {
                            Text("\(getHighestDay()) ⌘")
                                .font(.footnote)
                            .foregroundStyle(Color(hex: 0x8E8E93))
                        }

                    }
                    RuleMark(
                        xStart: 0,
                        xEnd: geometry.size.width * 0.9,
                        y: .value("Average", getAverageValue())
                    )
                    .foregroundStyle(.green)
                    .lineStyle(StrokeStyle(lineWidth: 1.5, dash: [3, 5]))
                    .annotation(position: .trailing, alignment: .leading) {
                        VStack {
                            Text("\(String(format: "%.1f", getAverageValue()))")
                            .font(.caption2)
                            .foregroundStyle(.green)
                            Text("avg")
                                .font(.caption2)
                            .foregroundStyle(.green)
                        }

                    }
                }.chartYAxis(.hidden)
                .frame(width: geometry.size.width * 0.85)}.frame(height: 125)
                .padding(.top, -6)
        }
    }
}

#Preview {
    Form {
        CostChart()
    }
}
