//
//  SwiftUIView.swift
//  DealsApp
//
//  Created by Oliver Zheng on 7/4/23.
//

import SwiftUI

 struct SearchTextFieldStyle: TextFieldStyle {
     func _body(configuration: TextField<Self._Label>) -> some View {
         HStack {
             Image(systemName: "magnifyingglass")
                 .foregroundColor(.gray)
                 .padding(.leading, 10)
             
             configuration
                 .padding(.vertical, 8)
         }
         .background(Color(.white))
         .cornerRadius(10)
     }
 }

