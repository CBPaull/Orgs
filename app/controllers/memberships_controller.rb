class MembershipsController < ApplicationController
	def create
  	@membership = Membership.create(membership_params)
    if @membership.errors.any?
      flash[:errors] = @membership.errors.full_messages
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
  	membership = Membership.find(params[:id])
    if membership.user == current_user
      membership.destroy 
      redirect_to :back
    else
      redirect_to organizations_path
    end
  end
  private
  	def membership_params
  	  params.require(:membership).permit(:user_id, :organization_id)
 	end
end
