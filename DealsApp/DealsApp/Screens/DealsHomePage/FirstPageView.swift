//
//  SwiftUIView.swift
//  DealsApp
//
//  Created by Oliver Zheng on 7/5/23.
//

import SwiftUI

struct FirstPageView: View {
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(red: 0.85, green: 0.85, blue: 0.8))
                .ignoresSafeArea()
            VStack{
                AsyncImage(url: URL(string: "https://media.officedepot.com/images/t_extralarge%2Cf_auto/products/9551893/9551893_o01.jpg")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                        .cornerRadius(15)
                        .padding(.top, -10)
                        .padding(.leading, -100)
                    
                } placeholder: {
                    Image(systemName: "cart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                        .cornerRadius(15)
                        .padding(.top, -10)
                        .padding(.leading, -100)
                }
                AsyncImage(url: URL(string: "https://www.staples-3p.com/s7/is/image/Staples/sp209825387_sc7?wid=512&hei=512")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                        .cornerRadius(15)
                        .padding(.top, -80)
                        .padding(.leading, 70)
                    
                } placeholder: {
                    Image(systemName: "cart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                        .cornerRadius(15)
                        .padding(.top, -80)
                        .padding(.leading, 70)
                }
                
                Text("Start the deal with ")
                    .font(.system(size: 25))
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding(.trailing, 150)
                Text("")
                Text("as low as ")
                    .font(.system(size: 25))
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding(.trailing,-10)
                Text("")
                Text("25% off")
                    .font(.system(size: 25))
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding(.trailing, -80)
                
                
                NavigationLink( destination: HomeView()) {
                    ZStack {
                        Circle()
                            .frame(width: 120, height: 120)
                            .foregroundColor(.black)
                            .opacity(0.8)
                        Text("Start")
                            .font(.system(size: 30))
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding(.bottom)
                    
                }
            }
            
        }
    }
    
}

struct FirstPageViewView_Previews: PreviewProvider {
    static var previews: some View {
        FirstPageView()
    }
}
