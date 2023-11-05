//
//  AppIcon.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/4/23.
//

import SwiftUI

func getPercentage(curr: CurrentSalatTimes) -> Double? {
    guard let currentSalatTimeIndex = curr.currentSalatIndex, currentSalatTimeIndex > 0 else {
        return nil
    }
    
    let crrenttim = curr.salatTimes[currentSalatTimeIndex]
    let prevTim = curr.salatTimes[currentSalatTimeIndex - 1]
    
    let tot = crrenttim.time.timeIntervalSince1970 - prevTim.time.timeIntervalSince1970;
    let elapsed = Date.now.timeIntervalSince1970 - prevTim.time.timeIntervalSince1970;
    return elapsed/tot
}

struct TimeTilNext: View {
    @Binding var currentSalatTimes:  Result<CurrentSalatTimes, NetworkError>
    var body: some View {
        GeometryReader { metrics in
//            HStack(spacing: 0) {
                switch self.currentSalatTimes {
                case .success(let currentSalatTimes):
                    let p = getPercentage(curr: currentSalatTimes)
                    if let p = p {
//                        Text("s")
                        Rectangle().fill(.blue).frame(width: 20, height: 10)
                    }
                default:
                    Text("y")
                }
//            }
        }
    }
}

struct MenuLabel: View {
    @Binding var currentSalatTimes: Result<CurrentSalatTimes, NetworkError>
    
    var body: some View {
        HStack {
            switch self.currentSalatTimes {
            case .success(let currentSalatTimes):
                if let currentSalatTimeIndex = currentSalatTimes.currentSalatIndex {
                    Text(currentSalatTimes.salatTimes[currentSalatTimeIndex].displayText).frame(minWidth: 10, maxWidth: .infinity)
                    Text("x").frame(minWidth: 10, maxWidth: .infinity)
                    let p = getPercentage(curr: currentSalatTimes)
                    if let p = p {
                        Text("s")
//                        Rectangle().fill(.blue).frame(width: 20, height: 10)
                    }
//                    TimeTilNext(currentSalatTimes: self.$currentSalatTimes)
                }
            default:
                Text("Unknown")
            }
        }.fixedSize()
    }
}

//#Preview {
//    AppIcon(currentSalatTimes: .constant(nil))
//}
