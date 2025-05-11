class HomeController < ApplicationController
  before_action :authenticate_user, only: [:notes]

  def index
  end

  def notes
    @notes = current_user.notes.order(created_at: :desc)
  end
end
