require 'rails_helper'

RSpec.describe FileUploadController, type: :controller do

  it "Загружает заявку" do
    file = fixture_file_upload('files/заявка.csv', 'text/csv')
    post :upload, params: {file: file}
    expect(response).to have_http_status :success
  end
end
