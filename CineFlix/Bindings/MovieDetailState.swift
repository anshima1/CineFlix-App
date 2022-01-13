//
//  MovieDetailState.swift
//  CineFlix
//
//  Created by Anshima Chaudhary on 07/11/21.
//

import SwiftUI

class MovieDetailState: ObservableObject {
    
    private let movieService: MovieService
    @Published var movie: Movie?
    @Published var isLoading = false
    @Published var error: NSError?
    @Published var saved: Bool = false
    @Published var bookmarked: Bool = false
    
    init(movieService: MovieService = MovieStore.shared) {
        self.movieService = movieService
    }
    
    func loadMovie(id: Int) {
        self.movie = nil
        self.isLoading = false
        self.movieService.fetchMovie(id: id) {[weak self] (result) in
            guard let self = self else { return }
            
            self.isLoading = false
            switch result {
            case .success(let movie):
                self.movie = movie
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
}
