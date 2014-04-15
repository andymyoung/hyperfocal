require_relative './spec_helper'

TITLE = "Post Title"
BODY = "The quick brown fox jumped over the lazy dog"
DATE = Time.now

describe 'Post object' do
  before do
    @new_post = Post.new
    @new_post.title = TITLE
    @new_post.date = DATE
    @new_post.body = BODY
    @new_post.save
    @post = Post.last
  end

  after do
    Post.last.destroy
  end

  describe "Object read from DB" do
    it "ID should be a Fixnum" do
      @post.id.must_be_kind_of(Fixnum)
    end
    it "Title should be correct" do
      @post.title.must_equal TITLE
    end
    it "Body should be correct" do
      @post.body.must_equal BODY
    end
    it "Date should be a DateTime" do
      @post.date.must_be_kind_of(DateTime)
    end
  end

end
