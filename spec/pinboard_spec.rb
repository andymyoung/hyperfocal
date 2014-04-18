# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe "My Sinatra Application" do
  it "should allow accessing the home page" do
    get '/'
    last_response.should be_ok
  end
end



# describe 'Pinboard object' do
#   before do
#     @pinboard = Pinboard.new
#   end

#   after do
#   end

#   it "should provide a list of tags" do
#     @pinboard.getTags.length.must_be :>, 0
#     puts @pinboard.getTags
#   end

#   it "should return all entries" do
#     @pinboard.getPosts.length.must_be :>, 0
#     puts @pinboard.getPosts
#   end


# end
