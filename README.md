# Precacher

### About

Precacher is written to update static files based on Ruby code.
In the future it could be expanded to work in memcache, and other caching solutions.

### Install Precacher:

in your Gemfile:

    gem "precacher"

and bundle install!

### How to use Precacher:

        val = Precacher.file_cache("/path/to/file") do
          # if data generated is the same, file is not updated.
          MyCreateFileData('file')
        end
        # val is true if their was a write, and false if not.

### Why it was created:

I had a simple HTML/JS project that needs to possibly update a JSON file anytime in 1-90 days windows.

I did not want an entire RAILS stack for just this part, but I did want to use other ruby gems.

So I just updated the static files via a cron job every hour, only if they were updated.

### To do

* More documentation
