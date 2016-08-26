class OrganizationsController < ApplicationController
  def index
  	@user = User.find(session[:user_id])
  	@organizations = Organization.all
  end

  def create
  	@organization = Organization.create(organization_params)
    if @organization.errors.any?
      flash[:errors] = @organization.errors.full_messages
      redirect_to :back
    else
    	@membership = Membership.create(user: @organization.user, organization: @organization)
      redirect_to :back
    end
  end

  def show
  	@organization = Organization.find(params[:id])
  end

  def destroy
  	organization = Organization.find(params[:id])
    organization.destroy if organization.user == current_user
    redirect_to :back
  end
  private
    def organization_params
    	params.require(:organization).permit(:name, :description, :user_id)
   	end
end
