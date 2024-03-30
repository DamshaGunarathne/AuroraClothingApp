//
//  RatingView.swift
//  ClothingApp
//
//  Created by NIBMPC04PC02 on 2024-03-30.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int

    var body: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        rating = index
                    }
            }
        }
    }
}

