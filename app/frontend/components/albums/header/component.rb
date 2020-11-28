# frozen_string_literal: true

class Albums::Header::Component < ApplicationViewComponent
  option :album

  delegate :artist, to: :album

  private

  def playing?
    current_track&.album == album
  end

  def total_duration
    album.tracks.sum(:duration)
  end

  def liked?
    Favorite.album?(current_user&.id, album&.id)
  end
end
