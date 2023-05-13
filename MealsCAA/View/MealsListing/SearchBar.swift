//
//  SearchBar.swift
//  MealsCAA
//
//  Created by Muhammad Zulqurnain on 13/05/2023.
//

import SwiftUI

struct SearchBar: View {
  
  @Binding var query: String
  let searchAction: (String) -> Void
  
  var body: some View {
    HStack {
      TextField("Search Meals", text: $query) { _ in
      } onCommit: {
        searchAction(query)
      }
      .textFieldStyle(RoundedBorderTextFieldStyle())
      .autocapitalization(.none)
      .disableAutocorrection(true)
      
      Button(action: {
        query = ""
        searchAction(query)
      }) {
        Text("Cancel")
      }
    }
  }
}
