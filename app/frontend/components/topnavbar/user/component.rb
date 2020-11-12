# frozen_string_literal: true

class Topnavbar::User::Component < ApplicationViewComponent
  def render?
    current_user
  end
end
