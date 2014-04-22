require 'yaml'
require 'net/http'
require 'nokogiri'
require 'pry'
require 'xmlsimple'

PINBOARD_V1_API = "https://api.pinboard.in/v1"
GET_TAGS_ENDPOINT = "/tags/get"
GET_POSTS_ENDPOINT = "/posts/all"

'''
https://api.pinboard.in/v1/method?auth_token=user:NNNNNN

https://api.pinboard.in/v1/tags/get

https://api.pinboard.in/v1/posts/all

    Returns all bookmarks in the user\'s account.

    argument  type  comment
    tag tag filter by up to three tags
    start int offset value (default is 0)
    results int number of results to return. Default is all
    fromdt  datetime  return only bookmarks created after this time
    todt  datetime  return only bookmarks created before this time
    meta  int include a change detection signature for each bookmark


'''

class Pinboard
  def initialize
    config_file = YAML.load_file("config.yml")
    @user_token = "?auth_token=" + config_file["pinboard"]
  end

  def up?
    url = "#{PINBOARD_V1_API}#{GET_TAGS_ENDPOINT}#{@user_token}"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    response.code == '200'
  end

  def getTags
    tags = []
    url = "#{PINBOARD_V1_API}#{GET_TAGS_ENDPOINT}#{@user_token}"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    xml_response = Nokogiri::XML(response.body)
    tag_elements = xml_response.xpath("//tag")
    tag_elements.each do |tag|
      tags << tag.get_attribute('tag')
    end
    return tags
  end

  def getLinks(tag = '')
    posts = []
    url = "#{PINBOARD_V1_API}#{GET_POSTS_ENDPOINT}#{@user_token}"
    if tag.length > 0
      url = url + "&tag=#{tag}"
    end
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    foo = XmlSimple.xml_in(response.body)
    a = foo["post"]
    a.each do |entry|
      h = {}
      h[:desc] = entry["description"]
      h[:url] =  entry["href"]
      posts << h
    end
    return posts
  end

end
