require 'rails_helper'
describe UsersController, type: :request do

#RSpec.describe "Users", type: :request do
  describe "GET #users" do
    it "works! (now write some real specs)" do
      get users_index_path
      expect(response).to have_http_status(200)
    end
  end
#end
