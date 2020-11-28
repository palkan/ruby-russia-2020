# frozen_string_literal: true

class FavoriteReflex < ApplicationReflex
  def invert
    user_id = element.dataset["user"]
    like_type = element.dataset["like_type"]
    like_id = element.dataset["like_id"]

    Favorite.invert(user_id: user_id, like_id: like_id, like_type: like_type)
  end

end
