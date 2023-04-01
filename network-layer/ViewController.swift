//
//  ViewController.swift
//  network-layer
//
//  Created by Abhishek Ravi on 31/03/23.
//

import UIKit

class ViewController: UIViewController {

    var client: NetworkClient = AlamofireApiClient() //URLSessionApiClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRequest()
        postRequest()
    }
    
    func getRequest() {
        let postsAPI = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
        let apiRequest = APIRequest(url: postsAPI, method: .GET, headers: nil, queryParams: nil, body: nil)
        
        client.dataTask(apiRequest) { (_ result: Result<PostModel, Error>) in
            switch result {
            case .failure(let error):
                print("🔴 GET Error: \(error)")
            case .success(let data):
                print("🟢 GET Data: \(data)")
            }
        }
    }
    
    func postRequest() {
        let newPost = PostModel(userId: 1234, id: 1234, title: "My Title", body: "This is Body")
        let newPostData = try? JSONEncoder().encode(newPost)
        
        let postsAPI = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let apiRequest = APIRequest(url: postsAPI, method: .POST, headers: ["Content-Type":"application/json"], queryParams: nil, body: newPostData)
        client.dataTask(apiRequest) { (_ result: Result<PostModel, Error>) in
            switch result {
            case .failure(let error):
                print("🔴 POST Error: \(error)")
            case .success(let data):
                print("🟢 POST Data: \(data)")
            }
        }
    }
}

