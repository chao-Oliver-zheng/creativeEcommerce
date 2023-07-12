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
    @State private var searchText = ""
    @State private var path = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $path) {
           
            VStack(alignment: .center){
                Text("Deal's Store")
                    .font(.system(size: 25))
                    .bold()
                TextField("Search your product", text: $searchText)
                    .textFieldStyle(SearchTextFieldStyle())
                List {
                        ForEach(filteredData, id: \.self){ item in
                            ZStack{
                                NavigationLink(value: item) {
                                    ItemCell(items: item)
                                }
                                .opacity(0)
                                ItemCell(items: item)
                                
                            }
                        }
                        .listRowSeparator(.hidden)
                        .background(Color.cyan)
                        .cornerRadius(15)
                    }
                    .listStyle(.plain)
                    .edgesIgnoringSafeArea(.all)
                    .navigationDestination(for: Deal.self) { item in
                        DetailView(items: item, viewModel: viewModel, path: $path)
                    }
                    
                }
 
            }
            .onAppear{ viewModel.getData() }
        }
    private var filteredData: [Deal] {
        if searchText.isEmpty {
            return viewModel.deals
        } else {
            return viewModel.deals.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
