# frozen_string_literal: true

# Provide utils for a simple authentication
module Authenticated
  extend ActiveSupport::Concern

  included do
    next unless respond_to?(:helper_method)

    helper_method :current_user
    helper_method :logged_in?
  end

  def current_user
    return @current_user if instance_variable_defined?(:@current_user)

    @current_user = login_from_session || login_from_cookie
  end

  def logged_in?
    !current_user.nil?
  end

  private

  def login_from_session
    return unless session[:user_id]

    User.find_by(id: session[:user_id])
  end

  def login_from_cookie
    return unless cookies[:uid]

    User.find_by(id: cookies[:uid]).tap do |user|
      next unless user

      commit_user_to_session! user
    end
  end

  def reset_user_session!
    cookies.delete(:uid)
    reset_session
  end

  def commit_user_to_session!(user)
    session[:user_id] = user.id
    cookies[:uid] = user.id
  end
end
