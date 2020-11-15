# frozen_string_literal: true

require "rails_helper"

fdescribe Flash::Component do
  let(:options) { {body: "Test"} }
  let(:component) { Flash::Component.new(**options) }

  subject { rendered_component }

  it "renders", :aggregate_failures do
    render_inline(component)

    is_expected.to have_css "sl-alert"
    is_expected.to have_text "Test"
  end

  it "renders nothing when no body" do
    options[:body] = nil

    render_inline(component)

    is_expected.to be_empty
  end
end
