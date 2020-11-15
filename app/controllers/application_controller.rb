# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authenticated
  include PlayerTracked

  include Turbolinks::Redirection
end
