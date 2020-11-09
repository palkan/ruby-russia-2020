# frozen_string_literal: true

# Import library from etc/library.json first
library = File.join(__dir__, "../etc/library.json").then(&File.method(:read)).then(&JSON.method(:parse))

library.each do |artist_json|
  next if artist_json["albums"].empty?

  Artist.create!(
    name: artist_json["name"],
    bio: artist_json["bio"],
    tags: artist_json["tags"] || [],
    images: artist_json["image"]
  ).then do |artist|
    artist_json["albums"].each do |album_json|
      next if album_json["tracks"].empty?

      artist.albums.create(
        title: album_json["title"],
        year: album_json["year"],
        images: album_json["image"]
      ).then do |album|
        album_json["tracks"].each do |track_json|
          album.tracks.create(
            title: track_json["title"],
            duration: track_json["duration"],
            position: track_json["position"]
          )
        end
      end
    end

    $stdout.puts "Imported #{artist.reload.name} with #{artist.albums_count} albums and #{artist.tracks_count} tracks"
  end
end

# Add users
password = "qwerty"

alice = User.create!(username: "alice", password: password)
ivan = User.create!(username: "ivan", password: password)
jack = User.create!(username: "jack", password: password)

$stdout.puts "Created users: alice, ivan, jack (password: 'qwerty')"

# Generate some listening stats
alice_tracks = Track.random.limit(100)
alice_tracks.each { |track| track.listenings.create(user: alice) }

ivan_tracks = Track.random.limit(100).to_a + alice_tracks.sample(30)
ivan_tracks.each { |track| track.listenings.create(user: ivan) }

jack_tracks = Track.random.limit(200).to_a + ivan_tracks.sample(40)
jack_tracks.each { |track| track.listenings.create(user: jack) }

$stdout.puts "Seeds completed. Good luck!"
