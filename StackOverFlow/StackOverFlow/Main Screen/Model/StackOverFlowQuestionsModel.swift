//
//  StackOverFlowQuestionsModel.swift
//  StackOverFlow
//
//  Created by Preshen Naidoo on 2021/10/20.
//

import Foundation

struct StackOverFlowQuestionsModel: Codable {
    let items: [Item]
    let hasMore: Bool
    let quotaMax, quotaRemaining: Int
    
    enum CodingKeys: String, CodingKey {
        case items
        case hasMore = "has_more"
        case quotaMax = "quota_max"
        case quotaRemaining = "quota_remaining"
    }
}

// MARK: - Item

struct Item: Codable {
    let tags: [String]
    let owner: Owner
    let isAnswered: Bool
    let viewCount: Int
    let closedDate: Int?
    let answerCount, score, lastActivityDate, creationDate: Int
    let lastEditDate: Int?
    let questionID: Int
    let link: String
    let closedReason: String?
    let title, body: String
    let contentLicense: ContentLicense?
    let acceptedAnswerID: Int?
    
    enum CodingKeys: String, CodingKey {
        case tags, owner
        case isAnswered = "is_answered"
        case viewCount = "view_count"
        case closedDate = "closed_date"
        case answerCount = "answer_count"
        case score
        case lastActivityDate = "last_activity_date"
        case creationDate = "creation_date"
        case lastEditDate = "last_edit_date"
        case questionID = "question_id"
        case link
        case closedReason = "closed_reason"
        case title, body
        case contentLicense = "content_license"
        case acceptedAnswerID = "accepted_answer_id"
    }
}

enum ContentLicense: String, Codable {
    case ccBySa30 = "CC BY-SA 3.0"
    case ccBySa40 = "CC BY-SA 4.0"
}

// MARK: - Owner

struct Owner: Codable {
    let reputation, userID: Int
    let profileImage: String
    let displayName: String
    let link: String
    let acceptRate: Int?
    
    enum CodingKeys: String, CodingKey {
        case reputation
        case userID = "user_id"
        case profileImage = "profile_image"
        case displayName = "display_name"
        case link
        case acceptRate = "accept_rate"
    }
}
