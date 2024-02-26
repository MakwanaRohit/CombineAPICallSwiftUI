//
//  PersonViewModel.swift
//  CombineAPICallSwiftUI
//
//  Created by rohitmakwana on 25/02/24.
//

import Foundation
import Combine

final class PersonViewModel: ObservableObject {
    
    @Published var persons: Persons = []
    @Published var error: String = ""
    @Published var isLoading: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private let personService: PersonServiceProtocol
    
    init(personService: PersonServiceProtocol = PersonService()) {
        self.personService = personService
        
        getPersons()
    }
    
    private func getPersons() {
        self.isLoading = true
        
        self.personService.getPersonList()
            .receive(on: DispatchQueue.main, options: nil)
            .sink { [weak self] result in
                
                guard let `self` = self else { return }
                
                self.isLoading = false
                
                switch result {
                case .finished: break
                case .failure(let error):
                    print(error.localizedDescription)
                    self.error = error.localizedDescription
                    self.persons = []
                }
            } receiveValue: { persons in
                self.persons = persons
            }
            .store(in: &cancellables)
    }
}
