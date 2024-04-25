//
//  ChapterModel.swift
//  Gita
//
//  Created by Shubhankar Trivedi on 25/04/24.
//

import Foundation

struct ChapterModel: Decodable {
    let id: Int32
    let name: String
    let slug: String
    let name_transliterated: String
    let name_translated: String
    let verses_count: Int32
    let chapter_number: Int32
    let name_meaning: String
    let chapter_summary: String
    let chapter_summary_hindi: String
}
