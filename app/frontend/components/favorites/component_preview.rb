# frozen_string_literal: true

class Favorites::ComponentPreview < ApplicationViewComponentPreview
  self.default_locals = {
    container_class: "w-2/3"
  }

  def without_user
  end

  def with_user
    self.current_user = User.random.first
    nil
  end
end
