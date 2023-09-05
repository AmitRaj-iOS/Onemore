//
//  ApiViewModel.swift
//  CombineAppleApi
//
//  Created by Mac-11 on 04/09/23.
//

import SwiftUI
import UIKit
import Combine


class ApiViewModel: ObservableObject {
    @Published var apps : [Apps] = []
     //var apps:[Apps]? = nil
     private var cancellables = Set<AnyCancellable>() // (1)

      func getApps() {
         let spinner = UIActivityIndicatorView(style: .medium)
         spinner.hidesWhenStopped = true
             spinner.startAnimating()
            // tableView.backgroundView = spinner

         let appURL = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json"

         WebServiceManager.shared.getData(endpoint: appURL, type: AppsResponseon.self) // (2) -> Publisher
             .sink { completion in // (3) -> Subscriber
                 spinner.stopAnimating()
             switch completion {
             case .failure(let err):
                 print("Error is \(err.localizedDescription)")
             case .finished:
                 print("Finished")
             }
         } receiveValue: { [weak self] appResponse in
             self?.apps = appResponse.feed.results
            // self?.tableView.reloadData()
         } .store(in: &cancellables) // (4)
     }
}

