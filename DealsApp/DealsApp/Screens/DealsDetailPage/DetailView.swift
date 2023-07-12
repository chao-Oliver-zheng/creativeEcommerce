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
    @ObservedObject var viewModel: HomeViewModel
    @Binding var path: NavigationPath
    
  
    private let options = ["Discription", "Likes", "Dislikes", "Comments"]
   
    
    var body: some View {
        
            VStack{
                VStack{
                    Button(action: {
                        path = NavigationPath()
                    }) {
                        Text("home")
                    }
                    ScrollView{
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
                                    
                                }
                            }else if selectedOption == 2 {
                                if items.dislikes.count == 0 {
                                    Text("There is no dislike")
                                        .padding(.vertical)
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
                        
                        Text("You may also like")
                       // Text("\(viewModel.deals.count)")
                        
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(items.likes, id: \.self) { item in
                                    ForEach(item.user.likes, id: \.self) { like in

                                        NavigationLink(value: viewModel.deals[Int(like.id) ?? 0]){
                                            VStack{
                                                AsyncImage(url: URL(string: viewModel.deals[Int(like.id) ?? 0].product.image.replacingOccurrences(of: "http://", with: "https://"))) { image in

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
                                            }
                                        }
                                        .navigationDestination(for: Deal.self) { item in
                                            DetailView(items: item, viewModel: viewModel, path: $path)
                                            ///ItemCell(items: viewModel.deals[Int(like.id) ?? 0])

                                        }


                                    }

                                }
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
