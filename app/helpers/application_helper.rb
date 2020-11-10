# frozen_string_literal: true

module ApplicationHelper
  def mock_link_to(*args, **options, &block)
    if block_given?
      link_to "javascript:void(0);", **options, &block
    else
      link_to(*args, "javascript:void(0);", **options, &block)
    end
  end
end
