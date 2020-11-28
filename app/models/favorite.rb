class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :like, polymorphic: true


  def self.invert(user_id:, album_id: nil, track_id: nil)
    return if user_id.blank?
    return if album_id.blank? && track_id.blank?

    test = {user_id: user_id, album_id: album_id, track_id: track_id}
    return delete_by(test) if find_by(test)

    create(test)
  end
end
