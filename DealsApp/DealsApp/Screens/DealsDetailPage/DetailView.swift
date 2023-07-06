//
//  DetailView.swift
//  DealsApp
//
//  Created by Oliver Zheng on 7/5/23.
//

import SwiftUI

struct DetailView: View {
    
    @State var items: Deal
    @State private var selectedOption: Int = 0
    private let options = ["Discription", "Likes", "Dislikes", "Comments"]
    var body: some View {
        VStack{
            VStack{
                VStack(alignment: .center){
                    ZStack{
                        let httpUrl = items.product.image
                        let httpsUrl = httpUrl.replacingOccurrences(of: "http://", with: "https://")
                        AsyncImage(url: URL(string: httpsUrl)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 350, height: 200)
                                .cornerRadius(15)
                            
                        } placeholder: {
                            Image(systemName: "cart")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 350, height: 200)
                                .cornerRadius(15)
                        }
                        Rectangle()
                            .foregroundColor(.black)
                            .opacity(0.8)
                            .frame(width: 100, height: 50)
                            .cornerRadius(10)
                            .overlay(
                                Text("\(items.product.availability)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 19))
                                    .bold()
                            )
                        
                            .offset(x: -125, y: 75)
                    }
                    VStack{
                        HStack{
                            Image(systemName: "hand.thumbsup.fill")
                            Text("\(items.likes.count)")
                                .padding(.trailing)
                            Image(systemName: "hand.thumbsdown.fill")
                            Text("\(items.dislikes.count)")
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        Text("\(items.title)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.horizontal)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                }
                .frame(maxWidth: .infinity)
                VStack{
                    HStack{
                        ForEach(0..<4){ index in
                            Button(action: {
                                selectedOption = index
                            }) {
                                Text(options[index])
                                    .font(.system(size: 14).bold())
                                    .frame(height: 40)
                                    .padding(.horizontal, 10)
                                    .background(index == selectedOption ? Color.black : Color.white)
                                    .foregroundColor(index == selectedOption ? Color.white : Color.black)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    
                    if selectedOption == 0 {
                        ScrollView(showsIndicators: true){
                            Text("\(items.product.description)")
                                .padding([.horizontal, .bottom])
                        }
                        .padding()
                    } else if selectedOption == 1 {
                        if items.likes.count == 0 {
                            
                            Text("There is no like")
                                .padding(.vertical)
                            
                        } else{
                            ScrollView(showsIndicators: false){
                                VStack(alignment: .leading){
                                    ForEach(items.likes, id: \.self) { like in
                                        NavigationLink(destination: LikeDetailView(like: like)) {
                                            Text("\(like.user.name)")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.horizontal)
                                        }
                                        .padding()
                                    }
                                }
                            }
                        }
                    }else if selectedOption == 2 {
                        if items.dislikes.count == 0 {
                            Text("There is no dislike")
                                .padding(.vertical)
                        } else{
                            ScrollView(showsIndicators: false){
                                VStack{
                                    ForEach(items.dislikes, id: \.self) { dislike in
                                        Text("\(dislike.user.name)")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    .padding()
                                }
                            }
                            
                        }
                    }else {
                        if items.comments.count == 0 {
                            
                            Text("There is no comment")
                                .padding(.vertical)
                            
                        } else{
                            ScrollView(showsIndicators: false){
                                VStack{
                                    ForEach(items.comments, id: \.self) { comment in
                                        VStack(alignment: .leading){
                                            Text("\(comment.user.name): ")
                                                .padding(.horizontal)
                                            
                                            Text("\(comment.text)")
                                                .lineLimit(nil)
                                                .fixedSize(horizontal: false, vertical: true)
                                                .padding()
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .background(Color.white)
                                                .cornerRadius(8)
                                            
                                        }
                                        .padding()
                                        
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                    
                }
            }
            
            Spacer()
        }
        .background(Color(red: 0.85, green: 0.85, blue: 0.8))
        
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(items: <#Deal#>)
//    }
//}
