require "dropbox_sdk"
require "securerandom"

class DropboxUploader
  def initialize(access_token)
    @client = DropboxClient.new(access_token)
  end

  def upload(file_data)
    result = @client.put_file(generate_filename(file_data), file_data.fetch(:tempfile))

    @client.media(result["path"])["url"]
  end

  def generate_filename(file_data)
    extension = file_data.fetch(:filename).split(".", 2).last

    [SecureRandom.uuid, extension].join(".")
  end
end
