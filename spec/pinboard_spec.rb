require_relative './spec_helper'


describe 'Pinboard object' do
  before do
    @pinboard = Pinboard.new
  end

  after do
  end

  it "should provide a list of tags" do
    @pinboard.tags.length.must_be :>, 0
  end



end
