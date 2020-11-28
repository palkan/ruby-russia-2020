# frozen_string_literal: true

module Search
  extend ActiveSupport::Concern

  module ClassMethods
    attr_reader :search_opts

    def search?(pattern, field = :title)
      pattern.present? && self.search(pattern, field).exists?
    end

    def search(pattern, field = :title)
      where("#{field} ilike ?", "%#{pattern}%")
        .order('listenings_count desc')
    end
  end
end
