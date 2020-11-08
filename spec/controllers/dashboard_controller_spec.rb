# frozen_string_literal: true

require "rails_helper"

describe DashboardController do
  describe "GET #show" do
    render_views

    subject { get :show }

    specify { is_expected.to be_successful }
  end
end
