class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :like, polymorphic: true


  def self.invert(user_id:, like_id:, like_type:)
    return if user_id.blank? || like_id.blank? || like_type.blank?

    test = {user_id: user_id, like_id: like_id, like_type: like_type}
    return delete_by(test) if find_by(test)

    create(test)
  end
end
