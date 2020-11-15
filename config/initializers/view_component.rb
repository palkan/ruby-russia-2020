# frozen_string_literal: true

ActiveSupport.on_load(:view_component) do
  Rails.application.config.to_prepare do
    ViewComponentsController.class_eval do
      include Authenticated
      include PlayerTracked

      around_action :nullify_current_user

      private

      def nullify_current_user
        with_current_user(nil) { yield }
      end
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
