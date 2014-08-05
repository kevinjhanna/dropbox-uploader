# DropboxUploader

A simple wrapper for the Dropbox client for beginners who don't want to
go through all the pain of registering for s3 and just want to quickly build their first app.

This repo also helps as an example of how to upload a file using a rack app.

Please, use it only for tiny apps or hackathons, **don't use it in real life** :)

## Instructions
1. [Create a Dropbox API app](https://www.dropbox.com/developers/apps)
2. Choose "Files and datastores" option.
3. After creating the app, make sure implicit grant is allowed.
4. Generate an access token and copy it.

## How to use DropboxUploader
Install the ``dropbox-sdk`` gem.

Copy ``lib/dropbox_uploader.rb`` into your directory and require it in your app.

Create a multipart/form-data form

    <form enctype='multipart/form-data' method=post>
      <input type=file name=file>
      <button type=submit>Upload</button>
    </form>

And on the server, you can do something like this

    on post do
      db = DropboxUploader.new(access_token)
      url = db.upload(req.POST["file"])
      res.write "<img src='#{url}'>"
    end

## How to run the example

    $ cd example
    $ gem install cuba
    $ rackup -p 8080

Now you can visit ``localhost:8080`` to try it out.
