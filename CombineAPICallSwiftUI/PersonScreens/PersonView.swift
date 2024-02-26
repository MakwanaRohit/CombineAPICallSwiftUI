//
//  PersonView.swift
//  CombineAPICallSwiftUI
//
//  Created by rohitmakwana on 25/02/24.
//

import SwiftUI

struct PersonView: View {
    
    @ObservedObject private var viewModel: PersonViewModel
    
    init(viewModel: PersonViewModel = PersonViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                List(viewModel.persons, id: \.id) { person in
                    NavigationLink(value: person) {
                        VStack(alignment: .leading) {
                            Text(person.fullName).font(.headline)
                            Text(person.email).font(.subheadline).foregroundStyle(AnyShapeStyle(.secondary))
                        }
                    }
                }
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .navigationBarTitle("Persons")
            .navigationDestination(for: Person.self) { person in
                PersonDetailsView(person: person)
            }
        }
    }
}

#Preview {
    PersonView()
}
