//
//  AppIcon.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/4/23.
//

import SwiftUI

struct Icon: View {
    @Binding var currentSalatTimes: Result<CurrentSalatTimes, NetworkError>
        
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                switch self.currentSalatTimes {
                case .success(let currentSalatTimes):
                    if let currentSalatTimeIndex = currentSalatTimes.currentSalatIndex {
                        Text(currentSalatTimes.salatTimes[currentSalatTimeIndex].displayText)
                    }
                default:
                    Text("Unknown")
                }
            }.frame(width: geometry.size.width)
        }
    }
}

struct AppIcon: View {
    @StateObject var vm = AthanTimings()
    
    var body: some View {
        HStack {
            Icon(currentSalatTimes: self.$vm.currentSalatTimes)
        }.onAppear(perform: {
            print("Fetching")
            self.vm.fetch()
        })
    }
}

//#Preview {
//    AppIcon(currentSalatTimes: .constant(nil))
//}
