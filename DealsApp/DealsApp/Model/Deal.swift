//
//  Deal.swift
//  DealsApp
//
//  Created by Oliver Zheng on 7/3/23.
//

import Foundation

struct DealsResponse: Codable, Hashable {
    let data: Datas
}

struct Datas: Codable, Hashable {
    let deals: [Deal]
}

struct Deal: Codable, Hashable {
    let id: String
    let title: String
    let url: String
    let price: Int
    let description: String
    
    let product: Product
    let createdAt: String
    let updatedAt: String
    let likes: [Like]
    let dislikes: [Dislike]
    let comments: [Comment]
}

struct Product: Codable, Hashable {
    let availability: String
    let image: String
    let description: String
    let sku: String
    let updatedAt: String
}

struct Like: Codable, Hashable {
    let id: String
    let user: User
}

struct User: Codable, Hashable {
    let id: String
    let name: String
    let likes: [UserLikeDeal]
}

struct UserLikeDeal: Codable, Hashable {
    let id: String
    let deal: UserLikeDealInfo
}

struct UserLikeDealInfo: Codable, Hashable {
    let id: String
    let title: String
    let url: String
    let price: Int
    let createdAt: String
    let updatedAt: String
}

struct Dislike: Codable, Hashable {
    let id: String
    let user: userDislikeName
}

struct userDislikeName: Codable, Hashable  {
    let name: String
}

struct Comment: Codable, Hashable {
    let id: String
    let createdAt: String
    let text: String
    let user: CommentUserInfo
}

struct CommentUserInfo: Codable, Hashable {
    let id: String
    let name: String
}

