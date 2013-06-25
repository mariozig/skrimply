skrimplybot = User.create!(first_name: "Skrimply",
                    last_name: "Bot",
                    email: "skrimplybot@skrimp.ly",
                    password: SecureRandom.hex(20) )

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
  Rock\ &\ Roll
  Soul
  Techno
  Trance
  Trip-Hop]

genres.each do |genre|
  Genre.create!(name: genre.downcase)
end

pop_genre = Genre.find_by_name("pop")
indie_genre = Genre.find_by_name("indie")
alternative_genre = Genre.find_by_name("alternative")
rock_genre = Genre.find_by_name("rock")
house_genre = Genre.find_by_name("house")
electronic_genre = Genre.find_by_name("electronic")

album_release_kind = ReleaseKind.create!(name: "album")

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
cake = Artist.create!(name: "Cake", submitting_user: skrimplybot)
cake.genres = [pop_genre, indie_genre, alternative_genre, rock_genre]

nugget = Track.create!(name: "Nugget",
                       duration: "3:59",
                       lyrics: "crunch like nuts in the mouths of squirrels",
                       submitting_user: skrimplybot)
nugget.appearances.as_owner.create!(artist: cake)
nugget.genres << rock_genre

open_book = Track.create!(name: "Open Book",
                          duration: "3:45",
                          lyrics: "polished hardwood floors",
                          submitting_user: skrimplybot)
open_book.appearances.as_owner.create!(artist: cake)
open_book.genres << rock_genre

fashion_nugget_album = Release.create!(name: "Fashion Nugget",
                                       release_kind: album_release_kind,
                                       release_date: "1996",
                                       submitting_user: skrimplybot)
fashion_nugget_album.appearances.as_owner.create!(artist: cake)

fashion_nugget_album.genres = [rock_genre, indie_genre]
fashion_nugget_album.cuts.create!(track: nugget, position: 11)
fashion_nugget_album.cuts.create!(track: open_book, position: 4)


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
skrillex = Artist.create!(name: "Skrillex", submitting_user: skrimplybot)
skrillex.genres = [house_genre, electronic_genre]

sirah = Artist.create!(name: "Sirah", submitting_user: skrimplybot)
sirah.genres = [house_genre, electronic_genre]

bangarang = Track.create!(name: "Bangarang",
                          duration: "3:42",
                          lyrics: "eatin fundip",
                          submitting_user: skrimplybot)
bangarang.genres = [house_genre, electronic_genre]
bangarang.appearances.as_owner.create!(artist: skrillex)
bangarang.appearances.as_featured.create!(artist: sirah)

bangarang_album = Release.create!(name: "Bangarang",
                                  release_kind: album_release_kind,
                                  release_date: "2012",
                                  label: owsla_label,
                                  submitting_user: skrimplybot)
bangarang_album.genres = [electronic_genre]
bangarang_album.cuts.create!(track: bangarang, position: 2)