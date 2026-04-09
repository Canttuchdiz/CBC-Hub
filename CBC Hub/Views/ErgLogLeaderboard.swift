import SwiftUI

struct ErgLogLeaderboard: View {
    @State private var selectedWorkout = 0

    let workouts = ["2k Test", "6k Test", "500m Sprint", "30min Rated"]

    let entries: [(rank: Int, name: String, time: String)] = [
        (1, "Sarah Johnson", "1:42.3"),
        (2, "Mia Thompson",  "1:44.1"),
        (3, "Emma Watson",   "1:45.9")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Section label
            Text("SELECT WORKOUT")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.secondary)
                .textCase(.uppercase)

            // Pill filter row
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(workouts.indices, id: \.self) { index in
                        let isSelected = selectedWorkout == index
                        Button(action: { selectedWorkout = index }) {
                            Text(workouts[index])
                                .fontWeight(.semibold)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .foregroundColor(isSelected ? .white : .secondary)
                                .background(
                                    Capsule()
                                        .fill(isSelected ? Color(hex: "15803d") : Color.white)
                                )
                                .overlay(
                                    Capsule()
                                        .stroke(Color.secondary.opacity(isSelected ? 0 : 0.3), lineWidth: 1)
                                )
                        }
                    }
                }
            }

            // Leaderboard card
            CardView(header: "") {
                VStack(spacing: 0) {
                    // Column headers
                    HStack {
                        Text("ATHLETE")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("SPLIT / TIME")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundStyle(.secondary)
                    }

                    Divider().padding(.vertical, 8)

                    ForEach(entries.indices, id: \.self) { index in
                        let entry = entries[index]
                        HStack {
                            Text("\(entry.rank)")
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: "15803d"))
                                .frame(width: 20, alignment: .leading)
                            Text(entry.name)
                                .fontWeight(.bold)
                            Spacer()
                            Text(entry.time)
                                .fontWeight(.bold)
                        }
                        .padding(.vertical, 10)

                        if index < entries.count - 1 {
                            Divider()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ErgLogLeaderboard()
        .padding()
}
