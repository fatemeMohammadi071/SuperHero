//
//  GenresModels.swift
//  SuperHero
//
//  Created by Fateme on 12/27/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Genres {
    // MARK: Use cases
    enum Genres {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
            var sections: [SectionViewModel]
        }
    }
    
    enum Comics {
        struct Request {
        }
        struct Response {
            var comics: [ComicDetail]
        }
        struct ViewModel {
        }
    }
    
    enum Events {
        struct Request {
        }
        struct Response {
            var events: [EventDetail]
        }
        struct ViewModel {
        }
    }
    
    enum Stories {
        struct Request {
        }
        struct Response {
            var stories: [StroyDetail]
        }
        struct ViewModel {
        }
    }
    
    enum Series {
        struct Request {
        }
        struct Response {
            var series: [SeriesDetail]
        }
        struct ViewModel {
        }
    }
    
    enum Loading {
        struct Response {
        }
        struct ViewModel {
        }
    }
    
    enum ErrorModel {
        struct Response {
            var requestError: Error
        }
        struct ViewModel {
            var requestError: Error
        }
    }
    
    enum EmptyList {
        struct Response {
            let type: String
        }
        struct ViewModel {
            let type: String
        }
    }
}
