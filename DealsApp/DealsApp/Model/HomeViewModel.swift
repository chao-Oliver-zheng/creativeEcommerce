//
//  HomeViewModel.swift
//  DealsApp
//
//  Created by renupunjabi on 7/3/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    //Call the fetch call using DealsService
    @Published var deals: [Deal] = []
    private var cancellables = Set<AnyCancellable>()
    var service = DealsService()
    
    @MainActor func getData() {
        
        Task {
            do {
                
                let deals: [Deal] = try service.fetchDeals()
                self.deals = deals
            } catch {
                if let error = error as? APIError {
                    print(error)
                } else {
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    
}
