# frozen_string_literal: true

module HasImages
  extend ActiveSupport::Concern

  included do
    store_accessor :images, :small, :medium, :large, prefix: "image"
  end
end
