require 'rails_helper'
describe ItemsController do
  describe 'Delete #destory' do
    it 'redirect_to_302' do
      item = create(:item)
      delete :destroy, params: {id: item}
      expect(response.status).to eq 302
    end
    it 'delete_the_item' do
      item = create(:item)
      expect{delete :destroy, params: {id: item}}.to change(Item, :count).by(-1)
    end
  end
end