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

struct ChaptersResponse: Decodable {
    let chapters: [ChapterModel]
}

func exampleChapter() -> ChapterModel{
    return ChapterModel(
            id: 1,
            name: "Genesis",
            slug: "genesis",
            name_transliterated: "Bereishit",
            name_translated: "In the beginning",
            verses_count: 1533,
            chapter_number: 1,
            name_meaning: "The first book of Moses",
            chapter_summary: "The creation of the world, the early history of humanity.",
            chapter_summary_hindi: "विश्व की रचना, मानवता का प्रारंभिक इतिहास।"
        )
}
