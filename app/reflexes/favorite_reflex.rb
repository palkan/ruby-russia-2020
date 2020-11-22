# frozen_string_literal: true

class FavoriteReflex < ApplicationReflex
  def invert
    user_id = element.dataset["user"]
    track_id = element.dataset["track"]
    album_id = element.dataset["album"]

    Favorite.invert(user_id: user_id, album_id: album_id, track_id: track_id)
    #  todo: toggle class of button
  end

end
