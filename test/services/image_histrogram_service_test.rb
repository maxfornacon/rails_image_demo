# frozen_string_literal: true
require "test_helper"

class ImageHistogramServiceTest < ActiveSupport::TestCase
  test "generates normalized histogram from a fake attachment" do
    fake_attachment = Struct.new(:download).new(File.read(Rails.root.join("test/fixtures/files/test.jpg")))

    service = ImageHistogramService.new(fake_attachment)
    hist = service.get_hist_array

    assert_equal 256, hist.length
    assert hist.all? { |v| v >= 0.0 && v <= 1.0 }
  end
end
