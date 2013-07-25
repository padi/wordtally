require 'sinatra'

get '/' do
  haml :index, format: :html5
end

post '/' do
  # TODO:
  # - should feed text into TalliesWords
  # - give results table for word count e.g.
  #|   word    |  count   |
  #| something |    20    |
  #|  another  |    10    |
  @results = params['text']
  haml :index, format: :html5
end
