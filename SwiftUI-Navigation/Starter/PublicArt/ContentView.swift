

import SwiftUI

struct ContentView: View {
  
  
  @State private var hideVisited = false


  var showArt: [Artwork] {
    hideVisited ? artworks.filter { $0.reaction.isEmpty } : artworks
  }
  
  private func setReaction(_ reaction: String, for item: Artwork) {
    self.artworks = artworks.map { artwork in
      guard artwork.id == item.id else { return artwork }
      let updateArtwork = Artwork(
        artist: item.artist,
        description: item.description,
        locationName: item.locationName,
        discipline: item.discipline,
        title: item.title,
        imageName: item.imageName,
        coordinate: item.coordinate,
        reaction: reaction
      )
      return updateArtwork
    }
  }


  @State var artworks = artData
  var body: some View {
    NavigationStack {
      List(showArt) { artwork in
        NavigationLink(value: artwork) {
          Text("\(artwork.reaction) \(artwork.title)")
            .onAppear { artwork.load() }

            .contextMenu {
              Button("Love it:💕") {
                self.setReaction("💕", for: artwork)
              }
              Button("Thoughtful:🙏") {
                self.setReaction("🙏", for: artwork)
              }
              Button("Wow!:🌟 ") {
                self.setReaction("🌟 ", for: artwork)
              }
            }
        }
      }
      .navigationDestination(for: Artwork.self, destination: { artwork in
        DetailView(artwork: artwork)
      })
      .navigationBarTitle("Artworks")
      .navigationBarItems(
        trailing: Toggle(isOn: $hideVisited) { Text("Hide Visited") })

      }
  }
}




struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
