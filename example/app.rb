require "cuba"

require_relative "lib/dropbox"

Settings = {
  access_token: "YOUR ACCESS TOKEN"
}

Cuba.define do
  on post do
    db = DropboxUploader.new(Settings.fetch(:access_token))
    url = db.upload(req.POST["file"])

    res.write("<p>URL: #{url}</p><img src='#{url}'>")
  end

  on root do
    res.write "<form enctype='multipart/form-data' method=post><input type=file name=file><button type=submit>Upload</button></form>"
  end
end
