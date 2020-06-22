class PermissionsController < ApplicationController
  before_action :set_permission, only: %i[show edit update destroy]
  before_action :set_document

  # FIXME: before_create/update should verify
  #   if there's already a permission for the user

  # GET documents/1/permissions
  def index
    @permissions = Permission.where(document: @document)
  end

  # GET documents/1/permissions/new
  def new
    @permission = Permission.new
  end

  # POST documents/1/permissions
  def create
    # FIXME: If cannot find, should create User and sent invitation
    #   Could be a FindOrInviteUserService
    user = User.find_by(email: secure_params[:user][:email])

    @permission = Permission.new(
      document: @document,
      user: user,
      role: secure_params[:role]
    )

    if @permission.save
      inform_user

      redirect_to document_permissions_path
    else
      redirect_to document_permissions_path, notice: 'Something went wrong.'
    end
  end

  # GET documents/1/permissions/1/edit
  def edit
    @document
  end

  # PATCH/PUT documents/1/permissions/1
  def update
    # FIXME: If cannot find, should create User and sent invitation
    #   Could be a FindOrInviteUserService
    user = User.find_by(email: secure_params[:user][:email])

    should_inform_user = user.email != self.user.email ? true : false

    if @permission.update(user: user, role: secure_params[:role])
      inform_user if should_inform_user

      redirect_to document_permissions_path
    else
      redirect_to document_permissions_path, notice: 'Something went wrong.'
    end
  end

  # DELETE documents/1/permissions/1
  def destroy
    @permission.destroy!

    redirect_to document_permissions_path
  end

  private

  def secure_params
    params.require(:permission).permit(:role, user: [:email])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_permission
    @permission = Permission.includes(:user).find(params[:id])
  end

  def set_document
    @document = Document.find(params[:document_id])
  end

  # FIXME: It shouldn't be here
  def inform_user
    DocumentMailer.document_shared_email(current_user, @document, @permission).deliver_later
  end
end
