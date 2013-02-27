user = User.create!(first_name: "Barack", last_name: "Obama", email: "barrypuffpuff@example.com")

genres = %w[Alternative
  Ambient
  Avantgarde
  Blues
  Celtic
  Children
  Christian
  Classical
  Club
  Country
  Cult
  Dance
  Disco
  Electronic
  Ethnic/Folk
  Funk
  Gospel
  Hardcore
  Hip-Hop
  House
  Indie
  Industrial
  Jazz
  Latin
  Metal
  Musical
  New Age
  Pop
  Punk
  R&B
  Rap
  Reggae
  Rock
  Soul
  Techno
  Trance
  Trip-Hop]
genres << "Rock & Roll"

genres.each do |genre|
  Genre.create!(name: genre.downcase)
end

pop_genre = Genre.find_by_name("pop")
indie_genre = Genre.find_by_name("indie")
alternative_genre = Genre.find_by_name("alternative")
rock_genre = Genre.find_by_name("rock")
house_genre = Genre.find_by_name("house")
electronic_genre = Genre.find_by_name("electronic")

owner_role = ArtisticRole.create!(role: "owner")
featured_role = ArtisticRole.create!(role: "featured")

album_release_kind = ReleaseKind.create!(kind: "album")

owsla_label = Label.create!(name: "OWSLA")


###### Sets up the following scenario: ######
# Band: Cake
# Band Genres: Pop, Indie, Alternative, Rock
# Song: Nugget
# Song Duration: 3:59
# Song Genres: Rock
# Song Lyrics: "crunch like nuts in the mouths of squirrels"
# Song Owner: Cake
# Song Features: none
# Album: Fashion Nugget
# Album Genres: Rock, Indie
# Album Release Date: 1996
# Album Owner: Cake
# Album Features: none
# Album Disc: none
# Label: none
# Track Number on Album: 11
# Definitions: none
cake = Artist.create!(name: "Cake")
cake.genres = [pop_genre, indie_genre, alternative_genre, rock_genre]
nugget = Track.create!(name: "Nugget", duration: "3:59", lyrics: "crunch like nuts in the mouths of squirrels")
nugget.genres << rock_genre
nugget.owning_artists << cake
fashion_nugget_album = Release.create!(name: "Fashion Nugget", release_kind_id: album_release_kind.id, release_date: "1996")
fashion_nugget_album.genres = [rock_genre, indie_genre]
fashion_nugget_album.artist_releases.create!(artist_id: cake.id, artistic_role_id: ArtisticRole.owner)
fashion_nugget_album.release_tracks.create!(track_id: nugget.id, position: 11)


###### Sets up the following scenario: ######
# Band: Skrillex
# Band Genres: House, Electronic
# Song: Bangarang
# Song Duration: 3:42
# Song Genres: House, Electronic
# Song Lyrics: "eatin fundip"
# Song Owner: Skrillex
# Song Features: Sirah
# Album: Bangarang
# Album Genres: House, Electronic
# Album Release Date: 2012
# Album Owner: Skrillex
# Album Features: none
# Album Disc: none
# Label: OWSLA
# Track Number on Album: 2
# Definitions: none
skrillex = Artist.create!(name: "Skrillex")
skrillex.genres = [house_genre, electronic_genre]
sirah = Artist.create!(name: "Sirah")
sirah.genres = [house_genre, electronic_genre]
bangarang = Track.create!(name: "Bangarang", duration: "3:42", lyrics: "eatin fundip")
bangarang.genres = [house_genre, electronic_genre]
bangarang.owning_artists << skrillex
bangarang.featuring_artists << sirah
bangarang_album = Release.create!(name: "Bangarang", release_kind_id: album_release_kind.id, release_date: "2012")
bangarang_album.genres = [electronic_genre]
bangarang_album.artist_releases.create!(artist_id: skrillex.id, artistic_role_id: ArtisticRole.owner)
bangarang_album.release_tracks.create!(track_id: bangarang.id, position: 2)