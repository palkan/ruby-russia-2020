# frozen_string_literal: true

require "rails_helper"

describe Player::Component do
  fixtures :artists, :tracks

  let(:options) { {} }
  let(:component) { Player::Component.new(**options) }

  subject { rendered_component }

  it "renders nothing when no current_track" do
    render_inline(component)

    is_expected.to be_empty
  end

  it "renders player" do
    with_current_track(tracks(:hardwired)) do
      render_inline(component)
    end

    is_expected.to have_css ".player"
    is_expected.to have_css ".player--timeline"
    is_expected.to have_css ".player--controls"
    is_expected.to have_css ".player--track"
    is_expected.to have_text "Hardwired"
    is_expected.to have_text "Metallica"
    is_expected.to have_css ".player--timestamps"
  end

  it "renders disabled prev-btn when first track on the current album" do
    with_current_track(tracks(:hardwired)) do
      render_inline(component)
    end

    is_expected.to have_css ".player--prev-btn.player--disabled-btn"
  end

  it "renders disabled next-btn when last track on the current album" do
    with_current_track(tracks(:halo_on_fire)) do
      render_inline(component)
    end

    is_expected.to have_css ".player--next-btn.player--disabled-btn"
  end
end
