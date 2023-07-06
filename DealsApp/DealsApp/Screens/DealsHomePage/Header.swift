//
//  SwiftUIView.swift
//  DealsApp
//
//  Created by Oliver Zheng on 7/4/23.
//

import SwiftUI

struct HeaderView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        VStack{
            Text("Deal's Store")
                .font(.system(size: 25))
                .bold()
            TextField("Search your product", text: $searchText)
                .textFieldStyle(SearchTextFieldStyle())
            
        }
        
    }
}
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
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
