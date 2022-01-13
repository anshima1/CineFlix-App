//
//  SavedMovies.swift
//  CineFlix
//
//  Created by Anshima Chaudhary on 09/11/21.
//

import SwiftUI

struct SavedMoviesView: View {
    
    let saved = Movie.savedMovies
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text("Saved Movies").font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            if saved.count == 0 {
                Text("No saved movies here! Bookmark to save them.").font(.subheadline)
                    .padding(.horizontal)
            }
            ForEach(self.saved) { movie in
                SavedMoviesSubView(movie: movie)
            }
        }.padding(.top)
        
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        Spacer()
    }
}


struct SavedMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        SavedMoviesView()
    }
}
