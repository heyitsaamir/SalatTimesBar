//
//  Date.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 10/14/23.
//

import Foundation

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
    
    func computeDate(byAdding dateComponent: Calendar.Component, value: Int) -> Date {
        return Calendar.current.date(byAdding: dateComponent, value: value, to: self)!
    }
    
    var midNight: Date {
        Calendar.current.date(
        bySettingHour: 00,
        minute: 0,
        second: 0,
        of: self)!
    }
    
    var startOfMonth: Date {
        return Calendar.current.date(
            from: Calendar.current.dateComponents(
                [.year, .month],
                from: Calendar.current.startOfDay(for: self)
            ))!
    }
    
    var lastDayOfMonth: Date {
        let startOfThisMonth = self.startOfMonth
        let startOfNextMonth = Calendar.current.date(byAdding: .month, value: 1, to: startOfThisMonth)!
        return Calendar.current.date(byAdding: .day, value: -1, to: startOfNextMonth)!
    }
}
