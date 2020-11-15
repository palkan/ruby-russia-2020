# frozen_string_literal: true

require "rails_helper"

describe Topnavbar::Container::Component do
  let(:options) { {} }
  let(:component) { Topnavbar::Container::Component.new(**options) }

  subject { rendered_component }

  specify "without current user" do
    render_inline(component)

    # Search is only available to authenticated users
    is_expected.to have_no_css 'input[type="text"]'
    is_expected.to have_text "Войти"
  end

  specify "with current user" do
    with_current_user(User.new(username: "Кот_Муркот")) do
      render_inline(component)
    end

    is_expected.to have_css 'input[type="text"]'
    is_expected.to have_text "Кот_Муркот"
  end
end
