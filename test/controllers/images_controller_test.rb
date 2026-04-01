require "test_helper"

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get images_url
    assert_response :success
  end

  test "should get new" do
    get new_image_url
    assert_response :success
  end

  test "should create image" do
    assert_difference('Image.count', 1) do
      post images_url, params: {
        image: {
          attachment: fixture_file_upload("test.jpg", "image/jpeg")
        }
      }
    end

    assert_redirected_to image_path(Image.last)
  end

  test "should show image" do
    image = Image.new

    image.attachment.attach(
      io: File.open(Rails.root.join("test/fixtures/files/test.jpg")),
      filename: "test.jpg",
      content_type: "image/jpeg"
    )

    image.save!

    get image_url(image)
    assert_response :success
  end

  test "should get histogram" do
    image = images(:PictureOne)
    mock_histogram = Array.new(256) { rand(0..100) }

    ImageHistogramService.define_singleton_method(:new) do |_attachment|
      Struct.new(:get_hist_array).new(mock_histogram)
    end

    get histogram_image_url(image)

    assert_response :success

    json = JSON.parse(response.body)
    assert_equal (0..255).to_a, json["labels"]
    assert_equal mock_histogram, json["data"]
  end
end
