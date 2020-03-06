//
//  ContentView.swift
//  TestSwiftUI2
//
//  Created by Richard Adem on 3/6/20.
//  Copyright © 2020 Richard Adem. All rights reserved.
//

import SwiftUI

//struct Restaurant: Identifiable {
//    var id = UUID()
//    var name: String
//}
//
//struct RestaurantRow: View {
//    var restaurant: Restaurant
//
//    var body: some View {
//        Text(restaurant.name)
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        let first = Restaurant(name: "Joe's Original")
//        let restaurants = [first]
//
//        return NavigationView {
//            List(restaurants) { restaurant in
//                RestaurantRow(restaurant: restaurant)
//            }.navigationBarTitle("Select a restaurant")
//        }
//    }
//}

struct ContentView: View {
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 90) {
        ForEach(1..<10) { num in
          VStack {
            GeometryReader { geo in
              Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .red]),
                                     startPoint: .topLeading,
                                     endPoint: .bottomTrailing))
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX-120) / 8),
                                  axis: (x: 0, y: 1, z: 0))
            }
          }
          .frame(width: 180)
        }
      }
      .padding(120)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
