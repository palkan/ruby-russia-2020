# frozen_string_literal: true

class Tracks::List::Component < ApplicationViewComponent
  option :tracks

  def render?
    tracks.present?
  end

  private

  def playing?(track)
    current_track == track
  end

  def liked?(track)
    false
  end
end
