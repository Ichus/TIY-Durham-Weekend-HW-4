require "rails-helper"

describe UsersController do
  describe "GET #show" do
    it "loads all entries belonging to a user" do
      user = User.create!(username: "user")
      entry1 = user.entries.build(title: "Title1", description: "Description1")
      entry1.save
      entry2 = user.entries.build(title: "Title2", description: "Description2")
      entry2.save
      # user not passed in with params[:id]. Need a way to account for this before the test will pass
      get :show

      expect(assigns(:entries)).to match_array([entry2, entry1])
    end
  end
end
