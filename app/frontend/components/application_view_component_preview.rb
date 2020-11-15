# frozen_string_literal: true

class ApplicationViewComponentPreview < ViewComponent::Preview
  self.abstract_class = true

  include Dry::Effects.State(:current_user)

  class << self
    attr_accessor :default_locals

    def preview_example_template_path(*)
      super
    rescue ViewComponent::PreviewTemplateError
      "layouts/view_components/preview"
    end

    def render_args(*)
      super.tap do |res|
        res[:layout] ||= "layouts/view_components/application"
        res[:locals] ||= {}
        res[:locals].reverse_merge!(default_locals) if default_locals
        res[:locals][:component] ||= name.sub(/Preview$/, "").safe_constantize&.new
        res[:locals][:container_class] ||= "p-4"
      end
    end
  end

  # Shortcut for render_with_template(locals: ...)
  def render_with_locals(**locals)
    render_with_template(locals: locals)
  end

  # Even shorter :)
  def render_component(component)
    render_with_locals(component: component)
  end
end
