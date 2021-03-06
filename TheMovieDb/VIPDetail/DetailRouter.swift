//
//  DetailRouter.swift
//  TheMovieDb
//
//  Created by Misael Chávez on 30/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import SwiftUI

@objc protocol DetailRoutingLogic {
    func routeToReviews()
}

protocol DetailDataPassing {
    var dataStore: DetailDataStore? { get }
}

class DetailRouter: NSObject, DetailRoutingLogic, DetailDataPassing {
    weak var viewController: DetailViewController?
    var dataStore: DetailDataStore?
    
    // MARK: Routing
    func routeToReviews() {
        guard let movieViewModel = dataStore?.movieViewModel else {
            return
        }
        let view = ReviewsView(movieId: movieViewModel.id, imageBaseURL: movieViewModel.baseURL)
        let hostingController = UIHostingController(rootView: view)
        viewController?.present(hostingController, animated: true, completion: nil)
    }
}
