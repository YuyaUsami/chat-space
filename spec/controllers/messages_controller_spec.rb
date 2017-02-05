require 'rails_helper'

describe MessagesController do
  let(:user) do
    create(:user)
  end
  let(:message) do
    create_list(:message, 1, group_id: group.id, body: "aaa")
  end
  let(:group) do
    create(:group)
  end

  before do
    login_user user
  end

  describe 'GET #index' do
    it "renders the :index template" do
      get :index, group_id: group
      expect(response).to render_template :index
    end

    it "assigns the requested contact to @messages" do
      get :index, group_id: group
      expect(assigns(:messages)).to match(message.sort{ |a, b| b.created_at <=> a.created_at })
    end
  end
end