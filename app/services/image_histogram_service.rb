# frozen_string_literal: true

class ImageHistogramService

  def initialize(attachment)
    @attachment = attachment
  end

  def get_hist_array
    image = Vips::Image.new_from_buffer(@attachment.download, "")

    gray = image.colourspace("b-w")

    histogram = gray.hist_find.to_a.flatten

    normalize(histogram)
  end

  private

  def normalize(hist)
    max = hist.max.to_f
    hist.map { |v| (v / max).round(4) } # values between 0–1
  end

end
