require "rails_helper"

describe UsersController do
  describe "GET #show" do
    fixtures :users

    let(:user) { users(:one) }

    it "loads all entries belonging to a user" do
      entry1 = user.entries.create(title: "Title1", description: "Description1")
      entry2 = user.entries.create(title: "Title2", description: "Description2")
      get :show, id: user.id

      expect(assigns(:entries)).to match_array([entry2, entry1])
    end
  end
end
