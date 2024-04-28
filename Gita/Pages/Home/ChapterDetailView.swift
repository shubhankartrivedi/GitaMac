//
//  ChapterDetailView.swift
//  Gita
//
//  Created by Shubhankar Trivedi on 28/04/24.
//

import SwiftUI

struct ChapterDetailView: View {
    @State var chapter: ChapterModel;
    @State var language: String = "hindi/sanskrit";
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                HStack{
                    VStack(alignment:.leading){
                        if(language == "english"){
                            Text(chapter.name_translated).font(.title).bold()
                        }
                        if(language == "hindi/sanskrit"){
                            Text(chapter.name).font(.title).bold()
                        }
                        
                        Text("(\(chapter.name_meaning))").font(.subheadline)
                    }.padding(.trailing)
                    Spacer()
                    Menu {
                        Button("Hindi/Sanskrit") {
                            language = "hindi/sanskrit"
                        }
                        Button("English") {
                            language = "english"
                        }
                        
                    } label: {
                        if(language == "hindi/sanskrit"){
                            Text("Hindi/Sanskrit")
                        }
                        if(language == "english"){
                            Text("English")
                        }
                    }.frame(width: 120)
                }.padding(.bottom)
                if(language == "english"){
                    Text(chapter.chapter_summary)
                }
                if(language == "hindi/sanskrit"){
                    Text(chapter.chapter_summary_hindi)
                }
                Spacer()
                
                    .navigationTitle("Chapter \(chapter.chapter_number)")
            }.padding()
        }
    }
        
}

#Preview {
    ChapterDetailView(chapter: exampleChapter())
}

