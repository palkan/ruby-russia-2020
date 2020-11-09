# frozen_string_literal: true

require "rails_helper"

describe ArtistsController do
  fixtures :artists

  describe "GET #show" do
    render_views

    let(:artist) { artists(:metallica) }

    subject { get :show, params: {id: artist.id} }

    specify { is_expected.to be_successful }
  end
end
