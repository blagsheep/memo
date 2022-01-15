class Post < ApplicationRecord
  belongs_to :user

  validates_presence_of   :title, :body, :user_id
  has_rich_text :body
  has_one_attached :photo


  def map_with_pins

    map_url = "https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/"
    map_url_end = "/auto/1024x576@2x?access_token=pk.eyJ1IjoibWFyY3VzLWZvcmNobmVyIiwiYSI6ImNreDA1MHI2czBkMXUycXFsd2JqcWVtZWoifQ.LUGuOxwCmOtjcghKK-dDRg&logo=false"
    counter = 0
    self.body.embeds.each do |embedded_image|
      counter = counter + 1
      if !embedded_image.metadata["longitude"].nil?   
        map_url = map_url + "url-" + CGI.escape(embedded_image.variant(resize_to_limit: [150, 100]).processed.service_url) + "(" + embedded_image.metadata["longitude"].to_s + "," + embedded_image.metadata["latitude"].to_s + ")"
        if counter < body.embeds.size 
          map_url = map_url + ","
        end
      end
    end

    return map_url + map_url_end
  end

end



