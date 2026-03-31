require "test_helper"

class ImageTest < ActiveSupport::TestCase
  include ActionDispatch::TestProcess::FixtureFile

  test "can attach an image" do
    file = fixture_file_upload(
      Rails.root.join("test/fixtures/files/test.jpg"),
      "image/png"
    )
    image = Image.new
    image.attachment.attach(io: file, filename: "test.jpg")

    assert image.attachment.attached?
  end
end