//
//  HomeView.swift
//  Gita
//
//  Created by Shubhankar Trivedi on 25/04/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: ChaptersViewModel
    
    var body: some View {
        NavigationStack(){
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.chapters, id: \.id) { chapter in
                        NavigationLink(destination: ChapterDetailView(chapter: chapter)){VStack(alignment: .leading) {
                            HStack {
                                Text(chapter.name)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Spacer()
                                Text(chapter.name_translated)
                                    .foregroundColor(.secondary)
                            }
                            Text("Verses: \(chapter.verses_count)")
                                .font(.subheadline)
                                .foregroundColor(.primary)
                        }.padding()
                                .background(.box)
                                .cornerRadius(10)
                                
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .onAppear {
                viewModel.loadChapters()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                }
                
            }
        }.contentTransition(.opacity)
    }
    
    
}
class ChaptersViewModel: ObservableObject {
    @Published var chapters: [ChapterModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func loadChapters() {
        guard chapters.isEmpty else { return }
        isLoading = true
        fetchChapters { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let chapters):
                    self?.chapters = chapters
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

