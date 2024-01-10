//
//  Visualizer.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 1/4/24.
//

import SwiftUI

let PADDING = 20.0

struct VisualizerPoint: Identifiable {
    var id: String {
        return self.time.timeIntervalSince1970.description
    }
    
    var time: Date
    var icon: String?
    var hasPassed: Bool?
    var isActive: Bool?
    var isNext: Bool?
}

struct Position: Identifiable {
    var id: String {
        return "\(start)|\(end)"
    }
    
    var start: Double
    var end: Double
    var icon: String?
    var hasPassed: Bool
    var isActive: Bool
    var isNext: Bool
}

struct Visualizer: View {
    let points: [VisualizerPoint]
    
    init(points: [VisualizerPoint]) {
        self.points = points.sorted(by: { point1, point2 in
            point1.time < point2.time
        })
    }
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            ForEach(getPoints(width: width)) { position in
                Path { path in
                    path.move(to: CGPoint(x: position.start, y: height / 2.0))
                    path.addLine(to: CGPoint(x: position.end, y: height / 2.0))
                    path.closeSubpath()
                }
                .stroke(position.hasPassed ? Color.accentColor : Color.secondary, lineWidth: 1.0)
                if let icon = position.icon {
                    ZStack {
                        if position.isActive || position.isNext {
                            Circle()
                                .fill( position.isActive ? Color.accentColor : position.isNext ? Color.primary: Color.secondary)
                                .frame(width: PADDING / 4)
                                .position(x: position.end + PADDING / 2.0, y: height / 2.0 + PADDING / 2)
                        }
                        Image(systemName: icon)
                            .position(x: position.end + PADDING / 2.0, y: height / 2.0)
                            .bold(position.isActive || position.isNext)
                            .foregroundColor(position.isActive ? Color.accentColor : position.isNext ? Color.primary : Color.secondary)
                            .opacity(position.isActive || position.isNext ? 1.0 : 0.9)
                            .font(.system(size: 8))
                        //                        .glow(radius: position.isActive ? 20 : 0)
                    }
                }
            }
        }
    }
    
    private func getPoints(width: Double) -> [Position] {
        var x = 0.0
        let totalTime = points.last!.time.timeIntervalSince1970 - points.first!.time.timeIntervalSince1970
        let firstTime = points.first!.time.timeIntervalSince1970
        let totalWidth = width - PADDING
        return points.map { point in
            let firstX = x
            let n = (point.time.timeIntervalSince1970 - firstTime) / totalTime
            let nextX = n * totalWidth
            x = nextX + PADDING
            return Position(start: firstX, end: nextX, icon: point.icon, hasPassed: point.hasPassed ?? false, isActive: point.isActive ?? false, isNext: point.isNext ?? false)
        }
    }
}

#Preview {
    Visualizer(points: [
        VisualizerPoint(time: Date.now.computeDate(byAdding: .hour, value: 7), icon: "sun.haze", hasPassed: true, isActive: true),
        VisualizerPoint(time: Date.now.computeDate(byAdding: .hour, value: 4), icon: "sun.max", hasPassed: true),
        VisualizerPoint(time: Date.now.computeDate(byAdding: .hour, value: 1), icon: "sun.horizon.fill", hasPassed: true),
        VisualizerPoint(time: Date.now.computeDate(byAdding: .hour, value: 12), icon: "sun.horizon", isNext: true),
        VisualizerPoint(time: Date.now.computeDate(byAdding: .hour, value: 24), icon: "moon.fill")
    ])
}
