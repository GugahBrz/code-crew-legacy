class DocumentsController < BaseController
  before_action :set_record, only: %i[show edit update destroy]

  def index
    @documents = scope
  end

  def show
    authorize @document

    @document
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(secure_params)
    @document.save!

    redirect_to @document
  end

  def edit
    authorize @document

    @document
  end

  def update
    authorize @document

    @document.update!(secure_params)

    redirect_to @document
  end

  def destroy
    authorize @document

    @document.destroy!

    redirect_to documents_path
  end

  private

  # FIXME: not sure if merge user is the best way to do it
  def secure_params
    params.require(:document).permit(:title, :content).merge(user: current_user)
  end

  def scope
    policy_scope(Document)
  end

  def set_record
    @document = scope.find(params[:id])
  end
end
