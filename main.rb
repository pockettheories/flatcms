require 'sinatra'

def process_page(name)
  (ERB.new(File.read("layout/header.erb")).result(binding)) + \
  (ERB.new(File.read("pages/#{name}.erb")).result(binding)) + \
  (ERB.new(File.read("layout/footer.erb")).result(binding))
end

get '/' do
  process_page 'index'
end

get '/:name.html' do
  # If the ERB does not exist, we would get and error upon trying to process_page
  if not File.exist? "pages/#{params['name']}.erb" then
    halt(404)
  end

  process_page params['name']
end

get '/:name' do
  # Handle favicon.ico requests because they are ultra-frequent and would fill up our logs
  if params['name'] == 'favicon.ico' and not File.exist? "public/#{params['name']}" then
    # The 2nd part if the condition is likely not needed
    halt(404)
  end

  redirect params['name']+'.html'
end
