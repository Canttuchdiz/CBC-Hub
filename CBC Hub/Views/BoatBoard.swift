import SwiftUI

struct BoatBoard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("BOAT BOARD")
                .font(Font.largeTitle.bold())
                .padding()

            ScrollView {
                VStack(spacing: 16) {
                    CardView(header: "\(Image(systemName: "figure.outdoor.rowing")) Varsity 8+", text: "Assigned: Seat 5", footer: "Starboard")
                    CardView(header: "\(Image(systemName: "figure.outdoor.rowing")) JV 8+", text: "Assigned: Seat 3", footer: "Port")
                    CardView(header: "\(Image(systemName: "figure.outdoor.rowing")) Varsity 4+", text: "Assigned: Seat 2", footer: "Starboard")
                    CardView(header: "\(Image(systemName: "figure.outdoor.rowing")) JV 4+", text: "Assigned: Seat 4", footer: "Port")
                    CardView(header: "\(Image(systemName: "figure.outdoor.rowing")) Novice 8+", text: "Assigned: Seat 1", footer: "Stroke")
                    CardView(header: "\(Image(systemName: "figure.outdoor.rowing")) Novice 4+", text: "Assigned: Seat 3", footer: "Starboard")
                    CardView(header: "\(Image(systemName: "figure.outdoor.rowing")) Masters 4x", text: "Assigned: Seat 2", footer: "Port")
                    CardView(header: "\(Image(systemName: "figure.outdoor.rowing")) Masters 8+", text: "Assigned: Seat 6", footer: "Starboard")
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    BoatBoard()
}
