import SwiftUI

struct ScheduleView: View {
    private let regattas: [(dates: String, name: String)] = [
        ("OCTOBER 12-13, 2025",  "Northeast Regionals"),
        ("OCTOBER 18-19, 2025",  "Head of the Charles"),
        ("NOVEMBER 2, 2025",     "Fall Classic"),
        ("NOVEMBER 8-9, 2025",   "Head of the Fish"),
        ("NOVEMBER 22, 2025",    "Turkey Day Dash"),
        ("DECEMBER 6-7, 2025",   "Winter Sprints"),
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("SCHEDULE")
                    .font(Font.largeTitle.bold())

                ScheduleCalendar()

                Text("UPCOMING REGATTAS")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
                    .textCase(.uppercase)
                    .padding(.top, 4)

                ForEach(regattas.indices, id: \.self) { index in
                    let regatta = regattas[index]
                    CardView(header: "\(regatta.dates)", headerColor: Color(hex: "15803d")) {
                        Text(regatta.name)
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                }
            }
            .padding()
            .padding(.bottom, 24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    ScheduleView()
}
