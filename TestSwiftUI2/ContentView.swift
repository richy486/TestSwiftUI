//
//  ContentView.swift
//  TestSwiftUI2
//
//  Created by Richard Adem on 3/6/20.
//  Copyright © 2020 Richard Adem. All rights reserved.
//

import SwiftUI

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
}

struct RestaurantRow: View {
  var restaurant: Restaurant

  var body: some View {
    VStack {
      GeometryReader { geo in
        ZStack {
          Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .red]),
                                 startPoint: .topLeading,
                                 endPoint: .bottomTrailing))
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX-120) / 8),
                              axis: (x: 0, y: 1, z: 0))
          Text(self.restaurant.name)
            .font(.largeTitle)
            .foregroundColor(.white)
        }
      }
    }
    .frame(width: 180)
  }
}

struct RestaurantView: View {
    var restaurant: Restaurant

    var body: some View {
        Text("Come and eat at \(restaurant.name)")
            .font(.largeTitle)
    }
}

let restaurants = [
  Restaurant(name: "Joe's Original"),
  Restaurant(name: "Pizza Man"),
  Restaurant(name: "Sine's Veggie Stu"),
  Restaurant(name: "Richy's pot"),
  Restaurant(name: "Pizza Pizza Cake"),
  Restaurant(name: "Cat Food"),
  Restaurant(name: "Other Joe's Original"),
  Restaurant(name: "Real Joe's Original"),
  Restaurant(name: "Joe's Cousin's Original"),
  Restaurant(name: "Joe's"),
]

struct ContentView: View {
  @State private var isPresented: [Bool] = Array(repeating: false, count: restaurants.count)
  private var restaurantsCount: Int = restaurants.count
  
  var body: some View {
    return NavigationView {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 90) {
          ForEach(0..<restaurantsCount) { i in
            NavigationLink(destination: RestaurantView(restaurant: restaurants[i])) {
              VStack {
                RestaurantRow(restaurant: restaurants[i])
                Button(action: {
                    self.isPresented[i].toggle()
                }) {
                    Text("Show Detail")
                }.sheet(isPresented: self.$isPresented[i]) {
                    RestaurantView(restaurant: restaurants[i])
                }
              }
            }
          }
        }
        .padding(120)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
