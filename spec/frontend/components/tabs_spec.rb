# frozen_string_literal: true

require "rails_helper"

describe Tabs::Component do
  let(:options) { {} }
  let(:component) { Tabs::Component.new(**options) }

  subject { rendered_component }

  it "renders nothing when no tabs" do
    render_inline(component)

    is_expected.to be_empty
  end

  it "renders tabs" do
    render_inline(component) do |c|
      c.slot(:tab, label: "Test A", id: :a) { "Body A" }
      c.slot(:tab, label: "Test B", id: :b) { "Body B" }
    end

    is_expected.to have_css ".tab", count: 2
    is_expected.to have_css ".tab-content", count: 2

    is_expected.to have_text "Test A"
    is_expected.to have_text "Test B"

    is_expected.to have_text "Body A"
    is_expected.to have_text "Body B"
  end
end
