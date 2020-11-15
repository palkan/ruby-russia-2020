# frozen_string_literal: true

class Flash::Component < ApplicationViewComponent
  option :type, default: proc { "success" }
  option :body

  def render?
    body.present?
  end
end
