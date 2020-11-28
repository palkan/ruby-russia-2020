# frozen_string_literal: true

class SearchReflex < ApplicationReflex
  def show
    search = params[:search]
    return morph :nothing if search.length < 3

    morph "#dashboard", component("dashboard", search: search)
  end
end
