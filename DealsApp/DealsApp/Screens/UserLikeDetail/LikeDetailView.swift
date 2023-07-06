//
//  SwiftUIView.swift
//  DealsApp
//
//  Created by Oliver Zheng on 7/6/23.
//

import SwiftUI

struct LikeDetailView: View {
    var like: Like
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(like.user.likes, id: \.self) { like in
                Text("\(like.deal.title)")
                    .padding()
            }
        }
    }
}

