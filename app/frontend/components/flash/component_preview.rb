# frozen_string_literal: true

class Flash::ComponentPreview < ApplicationViewComponentPreview
  # Specify default locals (e.g., container_class)
  # self.default_locals = {
  #  container_class: "w-1/2 border border-gray-300"
  # }

  def default
    component = Flash::Component.new(body: "Test me")
    render_component component
  end
end
