class HomeController < ApplicationController
  def index
    @notes = Note.all.order(created_at: :desc)
  end
end
