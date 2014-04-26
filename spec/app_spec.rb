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

#   it "should provide a list of tags" do
#     @pinboard.getTags.length.must_be :>, 0
#     puts @pinboard.getTags
#   end

#   it "should return all entries" do
#     @pinboard.getPosts.length.must_be :>, 0
#     puts @pinboard.getPosts
#   end


#   TITLE = "Post Title"
# BODY = "The quick brown fox jumped over the lazy dog"
# DATE = Time.now

# describe 'Post object' do
#   before do
#     @new_post = Post.new
#     @new_post.title = TITLE
#     @new_post.date = DATE
#     @new_post.body = BODY
#     @new_post.save
#     @post = Post.last
#   end

#   after do
#     Post.last.destroy
#   end

#   describe "Object read from DB" do
#     it "ID should be a Fixnum" do
#       @post.id.must_be_kind_of(Fixnum)
#     end
#     it "Title should be correct" do
#       @post.title.must_equal TITLE
#     end
#     it "Body should be correct" do
#       @post.body.must_equal BODY
#     end
#     it "Date should be a DateTime" do
#       @post.date.must_be_kind_of(DateTime)
#     end
#   end
