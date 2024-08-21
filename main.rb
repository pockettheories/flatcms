require 'sinatra'

def process_page(name)
  ERB.new(File.read("pages/#{name}.erb")).result(binding)
end

get '/' do
  process_page 'index'
end

get '/page/:name' do
  process_page params['name']
end
