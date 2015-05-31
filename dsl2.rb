class FancyRouter 
  attr_accessor :routes

  def initialize
    self.routes = []
  end

  def route(&block)
    #block.call will read the block outside the current context 
    # yield self
    # We need to use the instance_eval because we are modifing an attribute of the inner context
    instance_eval(&block)
    self.routes
  end
  
  #this methods modify the routes array then this array is output in the route method
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
  # resources :users 
  get '/', 'users#new'
end
p routes

# class Array
#   def each
#     for i in 0...self.size
#       yield(self[i])
#     end
#   end
# end
#
# array = [1,2,3]  
#
# pro = lambda {|item| puts item}
#
# array.each(&pro) 
#
class MyRouter
  attr_accessor :routes

  def initialize
    routes = []
  end

  def route
    #he does this because he wants an api with this form
    #MyRouter.new.route do
    # get ...
    #end
    #
    #Initializing the routes using the ZZ
    instance_eval(&block)
    self.routes
  end

  def get(path, to)
    routes << {http_method: 'get', path: path, to: to}
  end 
end

routes = MyRouter.new







