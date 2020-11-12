# frozen_string_literal: true

class ApplicationViewComponent < ViewComponent::Base
  include ApplicationHelper

  extend Dry::Initializer
  include Dry::Effects.Reader(:current_user, default: nil)

  class << self
    def validate_collection_parameter!(*)
      # Doesn't play well with inheritance
      # https://github.com/github/view_component/blob/6cbe5c10d1af723de928c9afbf7bfe55ff689889/lib/view_component/base.rb#L264
    end
  end

  attr_reader :virtual_path

  def initialize(*)
    # define @virtual_path for I18n.t shortcuts to work
    @virtual_path = [
      "components",
      self.class.name.sub("::Component", "").underscore.split("/")
    ].join(".")
  end

  private

  def inline_svg(name)
    path = File.join(__dir__, "../images", "#{name}.svg")
    raise ArgumentError, "SVG not found: #{name}. Expected at #{path}" unless File.file?(path)

    File.read(path).html_safe # rubocop:disable Rails/OutputSafety
  end
end
