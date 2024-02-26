//
//  Router.swift
//  CombineAPICallSwiftUI
//
//  Created by rohitmakwana on 25/02/24.
//

import Foundation
import SwiftUI

final class Router: ObservableObject {
   
   enum Destination: Hashable {
       case person(_ person: Person)
   }
   
   @Published var navPath = NavigationPath()
   
   func routeTo(_ destination: Destination) {
       navPath.append(destination)
   }
   
   func popToPrevious() {
       navPath.removeLast()
   }
   
   func popScreens(_ amount: Int) {
       navPath.removeLast(amount)
   }
   
   func popToRoot() {
       navPath = NavigationPath()
   }
}
