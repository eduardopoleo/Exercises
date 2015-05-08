class FancyRouter 
  attr_accessor :routes

  def initialize
    self.routes = []
  end

  def route(&block)
    #block.call will read the block outside the current context 
    # yield self
    instance_eval(&block)
    self.routes
  end

  def get(path, to)
    self.routes << {http_method: :get, path: path, to: to}
  end

  def post(path, to)
    self.routes << {http_method: :post, path: path, to: to}
  end

  def resources(resource)
    get("/#{resource}", "#{resource}#index") 
    get("/#{resource}/new", "#{resource}#new") 
    get("/#{resource}/:id", "#{resource}#show") 
    post("/#{resource}", "#{resource}#create") 
  end
end

#yield self
#requires using the |r| and r.
#with (&block)
routes = FancyRouter.new.route do
  get "/", to: "pages#home"
  resources :users 
end

p routes
