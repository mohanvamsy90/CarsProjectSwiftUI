//
//  DateExtensions.swift
//  CarsProject

import Foundation

extension String {
    func formattedDate() -> String? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        
        let formatter = DateFormatter()
        if date.isInSameYear(as: Date()) {
            formatter.dateFormat = "dd MMMM, h:mm a"
        } else {
            formatter.dateFormat = "dd MMMM yyyy, h:mm a"
        }
        formatter.timeZone = .current
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        return formatter.string(from: date)
    }
}

extension Date {

    func isEqual(to date: Date, toGranularity component: Calendar.Component, in calendar: Calendar = .current) -> Bool {
        calendar.isDate(self, equalTo: date, toGranularity: component)
    }

    func isInSameYear(as date: Date) -> Bool {
        isEqual(to: date, toGranularity: .year)
    }
}

