require File.expand_path '../spec_helper.rb', __FILE__


describe "My Sinatra Application" do
  it "should allow access to the home page" do
    get '/'
    expect(last_response).to be_ok
  end

  it "should allow access to the links page" do
    get '/links'
    expect(last_response).to be_ok
  end

  it "should allow access to the about page" do
    get '/about'
    expect(last_response).to be_ok
  end

  it "should allow access to the contact page" do
    get '/contact'
    expect(last_response).to be_ok
  end

  it "should allow access to the Create Post page" do
    get '/posts/new'
    expect(last_response).to be_ok
  end

  it "should successfully grab a tag and display it" do
    get '/links/ruby'
    expect(last_response).to be_ok
  end

end


describe 'Pinboard' do
  before do
    @pinboard = Pinboard.new
  end

  it "service should be up" do
    expect(@pinboard).to be_up
  end

  it "getTags should return an Array" do
    expect(@pinboard.getTags).to be_kind_of(Array)
  end

    it "getPosts should return an Array" do
    expect(@pinboard.getLinks).to be_kind_of(Array)
  end

end
