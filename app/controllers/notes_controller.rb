class NotesController < ApplicationController
  before_action :authenticate_user
  before_action :set_note, only: [:show, :update, :destroy]
  before_action :ensure_correct_user, only: [:show, :update, :destroy]

  def show
  end

  def update
    if @note.update(note_params)
      redirect_to note_path(@note), notice: 'ノートが更新されました'
    else
      render :show, status: :unprocessable_entity
    end
  end

  def new
    @note = current_user.notes.build
  end

  def create
    @note = current_user.notes.build(note_params)

    if @note.save
      redirect_to note_path(@note), notice: 'ノートが作成されました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_home_path, notice: 'ノートが削除されました'
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :body)
  end

  def ensure_correct_user
    unless @note.user_id == current_user.id
      redirect_to notes_home_path, alert: '他のユーザーのノートにはアクセスできません'
    end
  end
end
