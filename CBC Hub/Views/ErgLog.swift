import SwiftUI

struct ErgLog: View {
    @State private var selectedTab = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("ERG LOG")
                .font(Font.largeTitle.bold())

            Picker("", selection: $selectedTab) {
                Text("RESULTS").tag(0)
                Text("PR TRACKER").tag(1)
                Text("LEADERBOARD").tag(2)
            }
            .pickerStyle(.segmented)
            .tint(Color(hex: "15803d"))

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    switch selectedTab {
                    case 0:
                        ErgLogResults()
                    case 1:
                        ErgLogPRTracker()
                    case 2:
                        ErgLogLeaderboard()
                    default:
                        EmptyView()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    ErgLog()
}
