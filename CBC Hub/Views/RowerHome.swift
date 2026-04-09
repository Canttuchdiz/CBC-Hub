//
//  RowerHome.swift
//  CBC Hub
//
//  Created by Henry Goldrich on 2/23/26.
//

import SwiftUI

struct RowerHome: View {
    let currentDate = Date()
    
    var body: some View {
        VStack (alignment: .leading) {
            
            Text("CONNECTICUT BOAT CLUB")
                .foregroundStyle(Color(hex: "15803d"))
                .fontWeight(.bold)
            
            Text(currentDate.formatted(.dateTime.weekday(.wide).month(.wide).day()))
                .font(Font.largeTitle.bold())
            
            Button(action: {
                print("Button pressed")
            }) {
                Text("\(Image(systemName: "clock")) I'M HERE")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .foregroundColor(Color(.white))
                    .fontWeight(.heavy)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(hex: "15803d"))

                    )
            }
            
            HStack (spacing: 20) {
                CardView(header: "\(Image(systemName: "chart.line.uptrend.xyaxis")) Next Regatta", text: "1:48.2", footer: "NEW PR")
                
                CardView(header: "\(Image(systemName: "cloud.heavyrain")) Weather", text: "58°F", footer: "Rain")
            }
            .padding(.vertical)
            
            CardView(header: "Today's Lineup", text: "Varsity 8+", footer: "Seat: 5 (Starboard)")
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
    }
}

#Preview {
    RowerHome()
}
