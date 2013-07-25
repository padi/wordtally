require 'sinatra'
require 'ostruct'

get '/' do
  @results = [OpenStruct.new(word: 'example', count: 1),
              OpenStruct.new(word: 'another', count: 1)]
  haml :index, format: :html5
end

post '/' do
  # TODO:
  # - should feed text into TalliesWords
  # - replace results into actual results :P
  @results = [OpenStruct(word: 'example', count: 1),
              OpenStruct(word: 'another', count: 1)]
  @debug = params['text']
  haml :index, format: :html5
end
