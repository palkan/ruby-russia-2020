# frozen_string_literal: true

class Topnavbar::Container::ComponentPreview < ApplicationViewComponentPreview
  self.default_locals = {
    container_class: "absolute w-full"
  }

  def without_user
  end

  def with_user
    self.current_user = User.new(username: "Кот_Муркот")
    nil
  end
end
