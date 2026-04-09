import SwiftUI

struct ErgLogResults: View {
    var body: some View {
        VStack(spacing: 16) {
            Button(action: {}) {
                Label("UPLOAD ERG SCREEN", systemImage: "camera")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(hex: "15803d"))
                    )
            }

            CardView(header: "") {
                VStack(spacing: 12) {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("OCT 24 • 6K")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundStyle(.secondary)
                            Text("1:54.2")
                                .font(.system(size: 32, weight: .black, design: .rounded))
                        }
                        Spacer()
                        Text("TOP 15%")
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "15803d"))
                    }

                    Divider()

                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("OCT 20 • 2K")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundStyle(.secondary)
                            Text("1:49.8")
                                .font(.system(size: 32, weight: .black, design: .rounded))
                        }
                        Spacer()
                        Text("TOP 10%")
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "15803d"))
                    }
                }
            }
        }
    }
}

#Preview {
    ErgLogResults()
        .padding()
}
