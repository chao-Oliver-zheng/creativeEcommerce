//
//  ContentView.swift
//  DealsApp
//
//  Created by renupunjabi on 7/3/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel =  HomeViewModel()
    let horizontalSpacing: CGFloat = 20
    var body: some View {
        VStack{
            HeaderView()
            ScrollView{
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: horizontalSpacing),
                    GridItem(.flexible())
                ], spacing: 16){
                    ForEach(viewModel.deals, id: \.self){ item in
                        NavigationLink(destination: DetailView(items: item)){
                            ItemCell(items: item)
                        }
                    }
                }
                .onAppear{viewModel.getData()}
                .padding(.horizontal)
            }
        }
        .background(Color(red: 0.85, green: 0.85, blue: 0.8))
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
