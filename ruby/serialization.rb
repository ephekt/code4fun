=begin
  The class: AdvertiserTargeting is an ActiveRecord model who has some columns
  stored in the database as Base64 encoded data. Upon instantiation, ActiveRecord
  takes these columns and stores them as attributes.

  The task: Rewrite this class in multiple ways (at least 2). Currently, on class
  instantiation a bunch of methods are defined. What are some other ways you could
  have written this and what are the trade-offs?

  I'll give you one: just look below in the code! I've itereated over a static array
  at the latest point in class instantiation and defined (eagerly) methods to base64
  attributes. 

  For each variation you should note a pro and a con to the solution. For example,
  you could dynamically handle each request without defining a method, so this would
  keep the class definitions limited and the code would be shorter, but if you call
  the method twice in a row you have a performance hit...

  Have some fun with it. (Note: There are some ruby tricks missing. Get those and get bonus points)
=end


require 'base64'
# Class: Advertising Targeting
# Purpose: Contains serialized data attributes that are used for targeting of an ad
# Assumptions: All capitalized method calls are requesting serialized data in the form of Base64 encoding.

class AdvertiserTargeting < ActiveRecord::Base

  SERIALIZED_COLUMNS = [:Sizes, :Sections, :Languages, :Netspeeds, :InventoryTypes, :Publishers, :Urls, :ClickUrls, :Browsers, 
    :Isps, :Channels, :Rating, :Frequency, :Geography, :Gender, :Pixels
  ]

  # a special little method that dynamically defines methods for serialized data columns
  # and will return the unserialized data
  SERIALIZED_COLUMNS.each do |method_name|
    define_method method_name do
      begin
        Base64.decode64(read_attribute(method_name))
      rescue
        return nil
      end
    end
  end

end
