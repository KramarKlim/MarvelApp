//
//  Heroes.swift
//  MarvelApp
//
//  Created by Клим on 28.09.2021.
//

import Foundation

struct Heroes: Codable, Hashable {
    let name: String?
    let description: String?
    let thumbnail: Thumbnail?
}

struct Thumbnail: Codable, Hashable {
    let path: String?
    let `extension`: String?
}
