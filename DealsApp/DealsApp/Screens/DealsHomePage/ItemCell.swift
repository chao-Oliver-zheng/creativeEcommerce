//
//  ItemCell.swift
//  DealsApp
//
//  Created by Oliver Zheng on 7/5/23.
//

import SwiftUI

struct ItemCell: View {
    
    let items: Deal
    
    var body: some View {
        VStack(alignment: .center){
            let httpUrl = items.product.image
            let httpsUrl = httpUrl.replacingOccurrences(of: "http://", with: "https://")
            let price: Double = Double(items.price)/100
            let formattedOrginalPrice = String(format: "%.2f", price * 2)
            let formattedPrice = String(format: "%.2f", price)
            AsyncImage(url: URL(string: httpsUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                        .cornerRadius(15)
            } placeholder: {
                Image(systemName: "cart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
            }
            Text(items.title)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
            HStack{
                Text("$\(formattedPrice)")
                    .foregroundColor(.red)
                Text("$\(formattedOrginalPrice)")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                    .strikethrough(true, color: .gray)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

//struct ItemCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemCell()
//    }
//}
