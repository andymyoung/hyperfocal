require 'yaml'

config_file = YAML.load_file("pinboard.yml")
token = config_file["token"]

class Pinboard
  def initialize
    @return = "foo"
  end

  def tags
    @return
  end

  def all
    @return
  end

end
