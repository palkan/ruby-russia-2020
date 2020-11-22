class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :album, optional: true
  belongs_to :track, optional: true

  def self.invert(user_id:, album_id: nil, track_id: nil)
    return false if user_id.blank?
    return false if album_id.blank? && track_id.blank?

    test = { user_id: user_id, album_id: album_id, track_id: track_id }
    if find_by(test)
      delete_by(test)
      false
    else
      create(test)
      true
    end
  end

  def self.album?(user_id, album_id)
    Favorite.where(user_id: user_id, album_id: album_id, track_id: nil).exists?
  end

  def self.track?(user_id, track_id)
    Favorite.where(user_id: user_id, track_id: track_id, album_id: nil).exists?
  end
end
