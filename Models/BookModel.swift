//
//  BookModel.swift
//  APICallingAndJsonParsing
//
//  Created by Zab on 11/5/20.
//

import Foundation

struct BookModel: Codable {
    let items: [Volume]?
}

struct Volume: Codable {
//    let etag: String
//    let selfLink: URL
    let volumeInfo: VolumeInfo?
//    let userInfo: UserInfo?
//    let saleInfo: SaleInfo?
//    let accessInfo: AccessInfo?
//    let searchInfo: SearchInfo?
}

struct VolumeInfo: Codable {
    let title: String?
    let subtitle: String?
    let imageLinks: imageLinks?
    let authors: [String]?
}

struct imageLinks: Codable {
    let smallThumbnail: String?
    let thumbnail: String?
}
