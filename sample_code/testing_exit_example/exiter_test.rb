require 'minitest/autorun'
require_relative 'exiter'

class ExiterTest < Minitest::Test

  def test_exit_1
    assert_raises SystemExit do
      check(1)
    end
  end

  def test_no_exit_0
    assert_output "Zero\n" do
      check(0)
    end
  end

  def test_exit_negative_1
    assert_raises SystemExit do
      check(-1)
    end

  end
end
