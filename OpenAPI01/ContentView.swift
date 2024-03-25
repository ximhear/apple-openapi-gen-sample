//
//  ContentView.swift
//  OpenAPI01
//
//  Created by C.H Lee on 2024.03.25.
//

import SwiftUI
import OpenAPIRuntime
import OpenAPIURLSession

struct ContentView: View {
    let client = Client(serverURL: try! Servers.server1(),
                        transport: URLSessionTransport())
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            let a = await getPost()
            print(a.first!.userId)
            print(a.first!.id)
            print(a.first!.title)
            print(a.first!.body)
            
            do {
                let b = try await client.getGreeting(.init(query: .init(name: "gzone")))
                print(b)
                switch b {
                case .ok(let okResponse):
                    print(try okResponse.body.json.message)
                    
                case .unauthorized:
                    print("Unauthorized")
                case .undocumented(statusCode: let statusCode, _):
                    print("Undocumented Error: \(statusCode)")
                }
            }
            catch {
                print("Error: \(error)")
            }
        }
    }
    
    func getPost() async -> [Components.Schemas.Post] {
        guard let response = try? await client.getPosts(Operations.getPosts.Input()) else {
            print("Error getting response")
            return []
        }
        
        switch response {
        case .ok(let okResponse):
            switch okResponse.body {
            case .json(let postResponse):
                return postResponse
            }
        case .undocumented(statusCode: let statusCode, _):
            print("Undocumented Error: \(statusCode)")
            return []
        }
    }
}

#Preview {
    ContentView()
}
