class Post < ApplicationRecord
  belongs_to :user

  validates_presence_of   :title, :body, :summary,:date, :user_id
  has_rich_text :body
  has_one_attached :photo


  def map_with_pins

    if !self.body.embeds[0].metadata["longitude"].nil?

      # needs optimizing, should be updated after upload (on save?)

      all_longitudes = []
      all_latitudes = []

      # collect all lat, long values of all attachments
      self.body.embeds.each do |embedded_image|
        if !embedded_image.metadata["longitude"].nil?
          all_longitudes.append(embedded_image.metadata["longitude"])
          all_latitudes.append(embedded_image.metadata["latitude"])
        end
      end

      map_url = "https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/"
      

      - if body.embeds.size > 1
        # use bounding box
        map_url_end = 
        "/["+all_longitudes.min.to_s+","+all_latitudes.min.to_s+","+all_longitudes.max.to_s+","+all_latitudes.max.to_s+"]/1024x576@2x?padding=50&access_token=pk.eyJ1IjoibWFyY3VzLWZvcmNobmVyIiwiYSI6ImNreDA1MHI2czBkMXUycXFsd2JqcWVtZWoifQ.LUGuOxwCmOtjcghKK-dDRg&logo=false"
      else
        #use map center
        map_url_end = "/"+all_longitudes.min.to_s+","+all_latitudes.min.to_s+",9,0/1024x576@2x?&access_token=pk.eyJ1IjoibWFyY3VzLWZvcmNobmVyIiwiYSI6ImNreDA1MHI2czBkMXUycXFsd2JqcWVtZWoifQ.LUGuOxwCmOtjcghKK-dDRg&logo=false"
      end    

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
    else
      return nil
    end

  end

end



