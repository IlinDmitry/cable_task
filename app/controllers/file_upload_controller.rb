class FileUploadController < ApplicationController
  def upload
    send_csv(Services::ParseFile.new(params[:file]).parse_file)
  end

  def send_csv(csv)
    send_data csv,
              type: 'text/csv; charset=utf-8; header=present',
              disposition: 'attachment; filename=Результат.csv'
  end
end
