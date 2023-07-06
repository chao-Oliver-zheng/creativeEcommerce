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
        VStack(alignment: .leading){
            let httpUrl = items.product.image
            let httpsUrl = httpUrl.replacingOccurrences(of: "http://", with: "https://")
            let price: Double = Double(items.price)/100
            let formattedOrginalPrice = String(format: "%.2f", price * 2)
            let formattedPrice = String(format: "%.2f", price)
            let randomValue = Int.random(in: 25...50)
            AsyncImage(url: URL(string: httpsUrl)) { image in
                ZStack{
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                        .cornerRadius(15)
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.7)
                        .frame(width: 80, height: 30)
                        .cornerRadius(8)
                        .overlay(
                            Text("\(randomValue)% off")
                                .foregroundColor(.white)
                                .font(.system(size: 14))
                                .bold()
                        )
                        .padding(8)
                        .offset(x: 50, y: -70)
                }
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
                //.padding(.leading, 5)
                    .foregroundColor(.red)
                Spacer()
                Text("$\(formattedOrginalPrice)")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                    .strikethrough(true, color: .gray)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

//struct ItemCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemCell()
//    }
//}
