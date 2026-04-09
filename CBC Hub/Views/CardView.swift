//
//  CardView.swift
//  CBC Hub
//
//  Created by Henry Goldrich on 2/23/26.
//

import SwiftUI

struct CardView<Content: View>: View {
    let header: LocalizedStringKey
    let headerColor: Color
    let text: String?
    let footer: String?
    let fillWidth: Bool
    let content: Content
    
    init(header: LocalizedStringKey, headerColor: Color = Color(.secondaryLabel), text: String? = nil, footer: String? = nil, fillWidth: Bool = true, @ViewBuilder content: () -> Content = { EmptyView() }) {
        self.header = header
        self.headerColor = headerColor
        self.text = text
        self.footer = footer
        self.fillWidth = fillWidth
        self.content = content()
    }
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 10) {
            
            if header != "" {
                Text(header)
                    .textCase(.uppercase)
                    .fontWeight(.bold)
                    .font(.caption)
                    .foregroundStyle(headerColor)
            }
            
            if let text = text {
                Text(text)
                    .font(.system(size: 32, weight: .black, design: .rounded))
            }
            
            content
            
            if let footer = footer {
                Text(footer)
                    .fontWeight(.bold)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
 
        }
        .frame(maxWidth: fillWidth ? .infinity : nil, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.white))
                .shadow(radius: 4)
            )
    }
}

//#Preview("CardView") {
//    CardView(header: "Performance", text: "1:48.2", footer: "NEW PR", fillWidth: true)
//}

