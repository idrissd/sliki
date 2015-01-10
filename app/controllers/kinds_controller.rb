class KindsController < ApplicationController
  before_action :set_kind, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @kinds = Kind.all
    respond_with(@kinds)
  end

  def show
    respond_with(@kind)
  end

  def new
    @kind = Kind.new
    respond_with(@kind)
  end

  def edit
  end

  def create
    @kind = Kind.new(kind_params)
    @kind.save
    respond_with(@kind)
  end

  def update
    @kind.update(kind_params)
    respond_with(@kind)
  end

  def destroy
    @kind.destroy
    respond_with(@kind)
  end

  private
    def set_kind
      @kind = Kind.find(params[:id])
    end

    def kind_params
      params.require(:kind).permit(:thing_id, :name, :values)
    end
end
