class DocumentsController < BaseController
  before_action :set_record, only: %i[show edit update destroy]

  # GET documents
  def index
    @documents = scope
  end

  # GET documents/1
  def show
    authorize @document

    @document
  end

  # GET documents/new
  def new
    @document = Document.new
  end

  # POST documents
  def create
    @document = current_user.documents.create!(secure_params)

    redirect_to @document
  end

  # GET documents/1/edit
  def edit
    authorize @document

    @document
  end

  # PATCH/PUT documents/1
  def update
    authorize @document

    @document.update!(secure_params)

    redirect_to @document
  end

  # DELETE documents/1
  def destroy
    authorize @document

    @document.destroy!

    redirect_to documents_path
  end

  private

  def secure_params
    params.require(:document)
          .permit(:title, :content)
  end

  def scope
    policy_scope(Document)
  end

  def set_record
    @document = Document.find(params[:id])
  end
end
