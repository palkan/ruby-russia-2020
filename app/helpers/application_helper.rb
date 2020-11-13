# frozen_string_literal: true

module ApplicationHelper
  def mock_link_to(*args, **options, &block)
    if block_given?
      link_to "javascript:void(0);", **options, &block
    else
      link_to(*args, "javascript:void(0);", **options, &block)
    end
  end

  def component(name, **kwargs, &block)
    component_class = "#{name.camelize}::Component".constantize
    render(component_class.new(**kwargs), &block)
  end

  def component_collection(name, collection, **kwargs)
    component_class = "#{name.camelize}::Component".constantize

    render component_class.with_collection(collection, **kwargs)
  end
end
