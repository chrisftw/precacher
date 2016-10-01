require 'digest/md5'

class Precacher

  def self.file_cache(filename, &blk)
    # get hash of file if it does exist.
    hash_pre = Digest::MD5.file filename if File.exists?(filename)
    
    # run blk  # TODO pass in file stream type object???
    data = blk.call()

    # get hash of new data to compare
    hash_post = Digest::MD5.hexdigest data

    if hash_post.to_s != hash_pre.to_s
      File.open(filename, 'w') do |f|
        f << data
      end
      true
    else
      false
    end
  end

end
