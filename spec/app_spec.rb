require_relative './spec_helper'

describe 'Home Page'  do

  it 'should contain Hyperfocal' do
    get '/'
    last_response.must_be :ok?
    last_response.body.must_include "Hyperfocal"
  end

  it 'should contain Andy M. Young\'s Website' do
    get '/'
    last_response.must_be :ok?
    last_response.body.must_include "Andy M. Young's Website"
  end

  # it 'should contain Whoa!' do
  #   get '/'
  #   last_response.must_be :ok?
  #   last_response.body.must_include "Whoa!"
  # end

end
