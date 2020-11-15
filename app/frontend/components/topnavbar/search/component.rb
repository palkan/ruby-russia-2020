# frozen_string_literal: true

class Topnavbar::Search::Component < ApplicationViewComponent
  def render?
    current_user
  end
end
