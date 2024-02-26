//
//  PersonDetailsView.swift
//  CombineAPICallSwiftUI
//
//  Created by rohitmakwana on 25/02/24.
//

import SwiftUI

struct PersonDetailsView: View {
    
    let person: Person
    
    var body: some View {
        VStack(spacing: 15) {
            AsyncImage(url: URL(string: person.image))
                .frame(width: 150, height: 150, alignment: .center)
                .cornerRadius(75)
            
            Text(person.firstname).font(.title)
            
            VStack(alignment: .leading, spacing: 10) {
                imageTitleLabel(person.email, systemImageName: "envelope")
                imageTitleLabel(person.phone, systemImageName: "phone")
                imageTitleLabel(person.website, systemImageName: "network")
                imageTitleLabel(person.birthday, systemImageName: "birthday.cake")
                imageTitleLabel(person.address.fullAddress, systemImageName: "house")
            }
            .font(.callout)
            
            Spacer()
        }
        .padding(.horizontal)
    }
    
    private func imageTitleLabel(_ title: String,
                         systemImageName name: String) -> some View {
        Label {
            Text(title)
        } icon: {
            Image(systemName: name)
        }
    }
}
