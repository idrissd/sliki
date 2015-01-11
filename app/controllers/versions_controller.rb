# @author William Van Etten
class VersionsController < ApplicationController

  before_action :set_version, only: [:show, :update]

  respond_to :html, :json, :xml

  # GET /versions/id
  def show
    @item = AbstractPage.find(@version.item_id)
    @versions = @item.versions.reverse
  end

  # Controller's update action
  #
  # @param id [Version]
  # @param reversion [String] `redo`, `undo`, or `revert` default: `revert`
  # @example
  # PUT /versions/id[?reversion=redo|undo|revert]
  def update
    # previous version was not a create, so revert
    if @version.reify
      @version.reify.save!
    # previous version was create, so destroy
    else
      @version.item.destroy
    end
    # generate appropriate notice (undid, redid, reverted) with appropriate link, based on what we just did 
    case params[:reversion]
    when "undo"
      link = view_context.link_to(dt("notices.redo"), version_path(@version.next, :reversion => "redo"), :method => :put)
      redirect_to :back, :notice => "#{dt("notices.undid")} #{@version.event}. #{link}"
    when "redo"
      link = view_context.link_to(dt("notices.undo"), version_path(@version.next, :reversion => "undo"), :method => :put)
      redirect_to :back, :notice => "#{dt("notices.redid")} #{@version.previous.event}. #{link}"
    else
      link = view_context.link_to(dt("notices.undo"), version_path(@version.next, :reversion => "undo"), :method => :put)
      redirect_to :back, :notice => "#{dt("notices.reverted")} #{@version.event}. #{link}"
    end
  end

private

  def set_version
    @version = PaperTrail::Version.find(params[:id])
  end

  def version_params
    params.permit(:reversion)
  end

end
