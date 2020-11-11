# frozen_string_literal: true

ActiveSupport.on_load(:view_component) do
  Rails.application.config.to_prepare do
    ViewComponentsController.class_eval do
      include Authenticated
    end
  end

  ViewComponent::Preview.singleton_class.prepend(Module.new do
    attr_accessor :abstract_class
    alias_method :abstract_class?, :abstract_class

    def all
      super.reject(&:abstract_class?)
    end
  end)
end
