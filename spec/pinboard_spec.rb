require_relative './spec_helper'


describe 'Pinboard object' do
  before do
    @pinboard = Pinboard.new
  end

  after do
  end

  it "should provide a list of tags" do
    @pinboard.getTags.length.must_be :>, 0
    puts @pinboard.getTags
  end

  it "should return all entries" do
    @pinboard.getPosts.length.must_be :>, 0
    puts @pinboard.getPosts
  end


end
