//
//  SandboxView.swift
//  Gita
//
//  Created by Shubhankar Trivedi on 25/04/24.
//

import SwiftUI


struct SandboxView: View {
    
    @State private var text: String = "{}"
    
    @State private var chapter: String = ""
    @State private var verse: String = ""
    @State private var selected: String = ""
    @State private var loading: Bool = false
    @State private var url: String = ""
    @State private var errorBox: Bool = false
    
    var body: some View {
        VStack{
            ScrollView{
                TextEditor(text: .constant(text))
                    .monospaced()
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.leading)
                    .scrollContentBackground(.hidden)
                    .padding()
//                Text(text)
//                    .monospaced()
//                    .textSelection(.enabled)
//                    .padding()
            }
            
            VStack(alignment: .leading){
                
                HStack{
                    if(selected == "spec-c" || selected == "all-v:spec-c"){
                        TextField("Chapter Number", text: $chapter)
                        #if os(iOS)
                            .keyboardType(.numberPad)
                        #endif
                            .onChange(of: chapter) { newValue in
                                if(selected == "spec-c"){
                                    url = "/api/v1/chapter/\(newValue)/"
                                }
                                if(selected == "all-v:spec-c"){
                                    url = "/api/v1/chapter/\(newValue)/verse/"
                                }
                            }
                    }
                    if(selected == "spec-v:spec-c"){
                        TextField("Chapter Number", text: $chapter)
                        #if os(iOS)
                            .keyboardType(.numberPad)
                        #endif
                            .onChange(of: chapter) { newValue in
                                url = "/api/v1/chapter/\(newValue)/verse/\(verse)"
                            }
                        
                        TextField("Verse Number", text: $verse)
                        #if os(iOS)
                            .keyboardType(.numberPad)
                        #endif
                            .onChange(of: verse) { newValue in
                                url = "/api/v1/chapter/\(chapter)/verse/\(newValue)"
                            }
                    }
                }
                HStack(){
                    Text("GET").bold()
                    Text(url)
                }
                
                
                .padding(.bottom, 5)
                HStack{
                    
                    Menu {
                        Button("All chapters") {
                            selected = "all-c"
                            url = "/api/v1/chapter/"
                        }
                        Button("Specific chapter") {
                            selected = "spec-c"
                            url = "/api/v1/chapter/1/"
                        }
                        Button("All verses of specific chapter") {
                            selected = "all-v:spec-c"
                            url = "/api/v1/chapter/1/verse/"
                        }
                        Button("Specific verse of specific chapter") {
                            selected = "spec-v:spec-c"
                            url = "/api/v1/chapter/1/verse/1/"
                        }
                    } label: {
                        if(selected == ""){
                            Text("Select fetch type")
                        }
                        if(selected == "all-c"){
                            Text("All chapters")
                        }
                        if(selected == "spec-c"){
                            Text("Specific chapter")
                        }
                        if(selected == "all-v:spec-c"){
                            Text("All verses of specific chapter")
                        }
                        if(selected == "spec-v:spec-c"){
                            Text("Specific verse of specific chapter")
                        }
                    }
                    Spacer()
                    if(loading){
                        #if os(iOS)
                        ProgressView()
                            .progressViewStyle(.circular)
                            .frame(width: 47, height: .leastNonzeroMagnitude)
                        #endif
                        #if os(macOS)
                        ProgressView()
                            .progressViewStyle(.linear)
                            .frame(width: 47, height: .leastNonzeroMagnitude)
                        #endif
                    }
                    else {
                        Button("Send", action: Send)
                            .keyboardShortcut(.return)
                            .alert(isPresented: $errorBox) {
                                Alert(title: Text("Error"), message: Text("Maybe not connected to internet"), dismissButton: .default(Text("Okay")))
                            }
                    }
                }
            }
            .padding()
            
        }
    }
    
    func Send(){
        loading = true
        let baseUrl = "https://gita.shubhankartrivedi.com"
       
        fetchRawJSON(from: baseUrl + url) { result in
            switch result {
            case .success(let jsonString):
                let result = formatJSONString(jsonString)
                switch result {
                case .success(let formattedJSON):
                    text = formattedJSON
                case .failure(let error):
                    print(error)
                    errorBox = true
                }
            case .failure(let error):
                print(error)
                errorBox = true
            }
            loading = false
        }
    }
}
    
 

#Preview {
    SandboxView()
}
