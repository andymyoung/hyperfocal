require 'yaml'
require 'net/http'
require 'nokogiri'
require 'xmlsimple'

PINBOARD_V1_API = "https://api.pinboard.in/v1"
GET_TAGS_ENDPOINT = "/tags/get"
GET_POSTS_ENDPOINT = "/posts/all"


class Pinboard
  def initialize
    config_file = YAML.load_file("config.yml")
    @user_token = "?auth_token=" + config_file["pinboard"]
  end

  def pbConnect(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    http.request(request)
  end

  def up?
    url = "#{PINBOARD_V1_API}#{GET_TAGS_ENDPOINT}#{@user_token}"
    response = pbConnect(url)
    response.code == '200'
  end

  def getTags
    tags = []
    url = "#{PINBOARD_V1_API}#{GET_TAGS_ENDPOINT}#{@user_token}"
    response = pbConnect(url)
    xml_response = Nokogiri::XML(response.body) #TODO: REfactor this to use XmlSimple
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
    response = pbConnect(url)
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
