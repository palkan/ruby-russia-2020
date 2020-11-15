# frozen_string_literal: true

class AlbumReflex < ApplicationReflex
  def show
    album_id = element.dataset["album"]

    album = Album.find_by(id: album_id)

    session[:album_id] = album.id

    morph "#aside", component("albums/aside", album: album)
  end

  def hide
    session.delete(:album_id)
    morph "#aside", ""
  end
end
