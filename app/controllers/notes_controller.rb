class NotesController < ApplicationController
  def show
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(body: params[:note][:body])
      flash[:notice] = 'ノートを更新しました。'
      redirect_to note_path(@note)
    else
      flash.now[:alert] = '更新に失敗しました。'
      render :show, status: :unprocessable_entity
    end
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      flash[:notice] = 'ノートを作成しました。'
      redirect_to note_path(@note)
    else
      flash.now[:alert] = '作成に失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    flash[:notice] = 'ノートを削除しました。'
    redirect_to root_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :body)
  end
end 