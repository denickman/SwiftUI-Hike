//
//  CustomListRowView.swift
//  Hike
//
//  Created by Denis Yaremenko on 10.03.2024.
//

import SwiftUI

struct CustomListRowView: View {
    
    // MARK: - Properties
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    
    var body: some View {
        LabeledContent {
            // content
            if let row = rowContent {
                Text(row)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            } else if let rowLink = rowLinkLabel,
                      let rowDestination = rowLinkDestination {
                Link(rowLink,
                     destination: URL(string: rowDestination)!
                )
                .foregroundColor(.pink)
                .fontWeight(.heavy)
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        } label: {
            // label
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
            
        }
    }
}

#Preview {
    List {
        CustomListRowView(
            rowLabel: "Website",
            rowIcon: "globe",
            rowContent: nil,
            rowTintColor: .pink,
            rowLinkLabel: "Credo Academy",
            rowLinkDestination: "https://credo.academy"
        )
    }
}
