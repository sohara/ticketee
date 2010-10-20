require 'spec_helper'

describe ProjectsController do
  before do
    stub_warden
    request.env['warden'] = @warden
  end
  
  let(:user) { User.create!(:email => "someone@example.com", :password => "ticketee", :password_confirmation => "ticketee")}
  let(:project) { Project.create!(:name => "Ticketee") }
  
  describe "standard users" do 
    { "new" => "get", "create" => "post", "edit" => "get", "update" => "put", "destroy" => "delete" }.each_pair do |action, method|
      it "cannot access the #{action} action" do
        sign_in_as(user)
        send(method, action.dup, :id => project.id)
        response.should redirect_to(root_path)
        flash[:alert].should eql("You must be an admin to do that.")
      end
    end
    
    it "cannot access the show action" do 
      sign_in_as(user)
      get :show, :id => project.id
      response.should redirect_to(projects_path)
      flash[:alert].should eql("The project you were looking for could not be found.")
    end
  end
  
  it "displays an error message when asked for a missing project" do
    sign_in_as(user)
    get :show, :id => "not-here"
    response.should redirect_to(projects_path) 
    flash[:alert].should eql("The project you were looking for could not be found.")
  end
  
end