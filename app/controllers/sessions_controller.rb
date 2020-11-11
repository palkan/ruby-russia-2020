# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :redirect_logged_in, only: [:new, :create], if: :logged_in?

  layout "core"

  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      reset_user_session!
      commit_user_to_session!(user)

      redirect_to(root_path)
    else
      flash.now[:alert] = t(".failed")
      render :new
    end
  end

  def destroy
    reset_user_session!

    redirect_back(fallback_location: root_path)
  end

  private

  def redirect_logged_in
    redirect_to root_path
  end
end
