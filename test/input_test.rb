require './test/test_helper'
require './lib/input'

class InputTest < MiniTest::Test

  def test_it_exists_with_attributes
    file = mock
    input = Input.new(file, "new_file")
    assert_equal 0, input.char_count
    assert_equal [], input.data
  end
  
  def test_chunk_data
    file = mock
    input = Input.new(file, 'new_file')
    input.stubs(:data).returns(['a', 'b', 'c', 'd'])
    assert_equal ['ab', 'cd'], input.chunk_data(2)
  end
  
  def test_wrap_text
    file = './sample_txt/over_40.txt'
    file2 = './sample_txt/one_word.txt'
    input = Input.new(file, "new_file.txt")
    input2 = Input.new(file2, "new_file.txt")
    input.read(file)
    input2.read(file2)
    assert_equal 50, input.char_count
    assert_equal 5, input2.char_count
    assert_equal true, input.wrap_text?
    assert_equal false, input2.wrap_text?
  end
  
  def test_read_file
    file = './sample_txt/over_40.txt'
    input = Input.new(file, "new_file.txt")
    input.read(file)
    assert_equal 50, input.char_count
    assert_equal 50, input.data.size
  end
end