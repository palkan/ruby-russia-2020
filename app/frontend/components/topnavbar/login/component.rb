# frozen_string_literal: true

class Topnavbar::Login::Component < ApplicationViewComponent
  def render?
    !current_user
  end
end
