class DocumentsController < ApplicationController

  def new
    @document = Document.new
  end

  def edit
    @document = Document.find(params[:id])
  end

  def index
    @documents = Document.all
  end

  def show
    @document = Document.find(params[:id])
  end

  def create
    @document = Document.new(permitted_params)
    @document.save!

    redirect_to @document
  end

  def update
    @document = Document.find(params[:id])
    @document.update!(permitted_params)

    redirect_to @document
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy!

    redirect_to documents_path
  end

  private

  def permitted_params
    params.require(:document).permit(:title, :content).merge(user: current_user)
  end
end
