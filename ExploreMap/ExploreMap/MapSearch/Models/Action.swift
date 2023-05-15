//
//  Action.swift
//  ExploreMap
//
//  Created by Sajid Shanta on 15/5/23.
//

import Foundation

struct Action: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let handler: () -> Void
}
