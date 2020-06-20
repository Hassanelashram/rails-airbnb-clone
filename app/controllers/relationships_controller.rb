class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:id])
  end

  def destroy
    @rel = Relationship.find(params[:id])
    @rel.destroy
    redirect_to profile_path(@rel.followed_id)
  end
end
