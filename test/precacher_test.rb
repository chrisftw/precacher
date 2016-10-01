require_relative 'test_helper'

describe Precacher do
  describe 'file_cache' do

    before do
      File.delete("./test/data/new.json") if File.exists?("./test/data/new.json")
    end

    it "should create the file if it does not exist" do
      filename = "./test/data/new.json"
      filedata = "{\"new\": true}\n"
      assert_equal File.exists?(filename), false
      v = Precacher.file_cache(filename) do
        filedata
      end
      assert_equal File.exists?(filename), true
      assert_file_contents filename, filedata
      assert_equal v, true
    end

    it "should update exisitng files with new data" do
      filename = "./test/data/existing-changes.json"
      filedata = "{\"exists\": #{Time.now.to_i}}\n"
      assert_equal File.exists?(filename), true
      v = Precacher.file_cache(filename) do
        filedata
      end
      assert_file_contents filename, filedata
      assert_equal v, true
    end

    it "shouldn't save the file if it has no changes" do
      filename = "./test/data/existing.json"
      filedata = "{\"exists\": true}\n"
      assert_equal File.exists?(filename), true
      v = Precacher.file_cache(filename) do
        filedata
      end
      assert_file_contents filename, filedata
      assert_equal v, false
    end

  end
end
