require 'spec_helper'

describe Admin::UsersController do
  before do
    stub_warden
  end
  
  let(:user) { User.create(:email => "user@ticketee.com", :password => "password") }

  context "non-admin users" do 
    before do
      sign_in_as(user) 
    end
  
    it "are not able to access the index action" do 
      get 'index' 
      response.should redirect_to(root_path)
      flash[:alert].should eql("You must be an admin to do that.")
    end
  end

end
