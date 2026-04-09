import SwiftUI

struct ErgLogPRTracker: View {
    var body: some View {
        CardView(header: "Personal Bests") {
            HStack(spacing: 12) {
                // 2K PR
                VStack(alignment: .leading, spacing: 6) {
                    Text("2K PR")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "15803d"))
                    Text("1:48.2")
                        .font(.system(size: 32, weight: .black, design: .rounded))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(hex: "15803d").opacity(0.08))
                )

                // 6K PR
                VStack(alignment: .leading, spacing: 6) {
                    Text("6K PR")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    Text("1:54.0")
                        .font(.system(size: 32, weight: .black, design: .rounded))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue.opacity(0.08))
                )
            }
        }
    }
}

#Preview {
    ErgLogPRTracker()
        .padding()
}
