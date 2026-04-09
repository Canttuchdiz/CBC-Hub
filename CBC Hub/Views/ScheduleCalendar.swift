import SwiftUI

// MARK: - Day Cell

struct CalendarDayCell: View {
    let day: Int
    let hasEvent: Bool

    var body: some View {
        VStack(spacing: 3) {
            ZStack {
                if hasEvent {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(hex: "15803d").opacity(0.15))
                }
                Text("\(day)")
                    .font(.system(size: 14, weight: hasEvent ? .bold : .regular))
                    .foregroundColor(hasEvent ? Color(hex: "15803d") : Color(.secondaryLabel))
            }
            .frame(maxWidth: .infinity)
            .frame(height: 38)

            Circle()
                .fill(hasEvent ? Color(hex: "15803d") : Color.clear)
                .frame(width: 4, height: 4)
        }
    }
}

// MARK: - Calendar

struct ScheduleCalendar: View {
    @State private var displayedMonth: Date = {
        var components = Calendar.current.dateComponents([.year, .month], from: Date())
        return Calendar.current.date(from: components) ?? Date()
    }()

    // Placeholder event day numbers — replace with real data later
    private let eventDays: Set<Int> = [1, 2, 3, 5, 6, 8, 9, 12, 13, 18, 19, 20, 25, 26]

    private var mondayFirstCalendar: Calendar = {
        var cal = Calendar(identifier: .gregorian)
        cal.firstWeekday = 2
        return cal
    }()

    private let weekdayLabels = ["M", "T", "W", "T", "F", "S", "S"]
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 4), count: 7)

    private var monthYearTitle: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: displayedMonth).uppercased()
    }

    private var daysInGrid: [Int?] {
        let comps = mondayFirstCalendar.dateComponents([.year, .month], from: displayedMonth)
        guard let firstDay = mondayFirstCalendar.date(from: comps),
              let range = mondayFirstCalendar.range(of: .day, in: .month, for: firstDay)
        else { return [] }

        // Weekday of the 1st (Sunday = 1, Monday = 2 … Saturday = 7 in Gregorian)
        let weekday = mondayFirstCalendar.component(.weekday, from: firstDay)
        let offset = (weekday - 2 + 7) % 7   // Monday → 0, Tuesday → 1 … Sunday → 6

        var days: [Int?] = Array(repeating: nil, count: offset)
        days += range.map { Optional($0) }
        return days
    }

    var body: some View {
        CardView(header: "") {
            VStack(spacing: 16) {
                // Month navigation
                HStack {
                    Button { navigateMonth(by: -1) } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.primary)
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    Text(monthYearTitle)
                        .font(.headline)
                        .fontWeight(.black)
                    Spacer()
                    Button { navigateMonth(by: 1) } label: {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.primary)
                            .fontWeight(.semibold)
                    }
                }

                // Weekday header row
                LazyVGrid(columns: columns, spacing: 4) {
                    ForEach(weekdayLabels.indices, id: \.self) { i in
                        Text(weekdayLabels[i])
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity)
                    }
                }

                // Day cells
                LazyVGrid(columns: columns, spacing: 4) {
                    ForEach(daysInGrid.indices, id: \.self) { index in
                        if let day = daysInGrid[index] {
                            CalendarDayCell(day: day, hasEvent: eventDays.contains(day))
                        } else {
                            Color.clear.frame(height: 44)
                        }
                    }
                }
            }
        }
    }

    private func navigateMonth(by value: Int) {
        if let next = mondayFirstCalendar.date(byAdding: .month, value: value, to: displayedMonth) {
            displayedMonth = next
        }
    }
}

#Preview {
    ScheduleCalendar()
        .padding()
}
