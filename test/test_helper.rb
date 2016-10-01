
require 'minitest/spec'
require 'minitest/autorun'
require './lib/precacher'

require 'minitest/assertions'

module Minitest::Assertions

  def assert_file_contents(filename, data)
    File.open(filename, "rb") do |f|
      data = f.read
      assert_equal data, data
    end
  end
end

