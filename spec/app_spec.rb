require File.expand_path '../spec_helper.rb', __FILE__


describe "My Sinatra Application" do
  it "should allow access to the home page" do
    get '/'
    last_response.should be_ok
    #binding.pry
  end

end


describe 'Pinboard' do
  before do
    @pinboard = Pinboard.new
  end

  it "Pinboard service should be up" do
    @pinboard.should be_up
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
