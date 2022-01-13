//
//  SavedMoviesSubView.swift
//  CineFlix
//
//  Created by Anshima Chaudhary on 09/11/21.
//

import SwiftUI

struct SavedMoviesSubView: View {
    
    @ObservedObject var imageLoader = ImageLoader()
    var movie: Movie?
    var body: some View {
        HStack {
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30.0, height: 30.0, alignment: .leading)
                    .clipShape(Circle())
                    .padding(.horizontal)
            }
            if let title = movie?.title {
                Text("\(title)")
            }
        }.onAppear() {
            if let posterURL = self.movie?.posterURL {
                self.imageLoader.loadImage(with: posterURL)
            }
            
        }
    }
}

struct SavedMoviesSubView_Previews: PreviewProvider {
    static var previews: some View {
        SavedMoviesSubView(movie: Movie.stubbedMovie)
    }
}
