require_relative './spec_helper'

describe 'Home Page'  do

  it 'should have Hyperfocal' do
    get '/'
    last_response.must_be :ok?
    last_response.body.must_include "Hyperfocal"
  end
end
