array = ['abcdeffffff', 'ffasf', 'adertffff']

#Blocks general explanation

class Array
  #Syntax 1, When using yield
  def my_each
    for i in self
      yield i 
    end
  end

 #Syntax 2. When using call 
  def my_each2(&whatever)
    for i in self
      whatever.call i
    end
  end
end

# array.my_each do |item|
#   puts item.length
# end
#
# array.my_each2 do |item|
#   puts item.length
# end

#These two syntax are exact the same.
#
#Blocks can also be stored in procs
my_proc = Proc.new do |item|
  puts item.length
end

#array.my_each &my_proc
#array.my_each2 &my_proc

#We always have to use the & to let the program know that we are passing a block

#A very simple use case of blocks
#p array.sort_by(&:length)

number_of_f = Proc.new do |item|
  counter = 0
  item.each_char do |char|
    if char == "f"
      counter += 1
    end
  end
  counter 
end

#p array.sort_by(&number_of_f)
#Block context

class String
  def each
    self.each_char do |char|
      yield char
    end
  end
end

# "ert".each do |item|
#   puts item
# end  

#Different context for block
class Dummy
  def initialize
    @name = 'inner name'
  end

  # We need to pass in the block argument becuase the instance has no
 
  def print_name(&block)
    yield
    instance_eval(&block)
  end
end

@name = 'outer name'

#There is a suttle difference the yield literally yields execution to the block that was passed
#to the method it does not really care what that block was or how was constructed
#Instance_eval evaluate the block passed in with a value defined inside the instance context.
#In order for this method to do this it need to know which block we are talking about, that is why we passed it 
#to as an argument 
#This method is usefull when we want to evaluate blocks with internal information contain within an specific instance. 
#This is pretty helpful when creating DSLs as we are going to see next

# Dummy.new.print_name do
#   puts @name
# end

# => outer name
# => inner name

# app_routes = MyRouter.new.route do
#   root 'home#main'
#   get 'home', to: 'home#main', as: 'home_path'
#   resources :posts
# end
# Need an intance of my Router e,g "@routes" attribute to store the current available routes
# Need a method (route) that takes in a block and modifies the attribute @routes depending on the present within the block  
# Need three methods root, get, resources that will add info to @routes in the form of specific routes
# Finally need a method to display the current routes created 


class MyRouter
  attr_accessor :routes
  
  def initialize
    @routes = []
  end

  def route(&block)
    instance_eval(&block)
  end

  def root controller_action
    @routes << {:named_route => 'root', :url => "/", :controller_action => "#{controller_action}", :http_verb => 'GET' }
  end

  def get(url, hash)
    #hash should contain the  
    @routes << {:named_route => "#{hash[:as]}", :url => "#{url}", :controller_action => "#{hash[:to]}", :http_verb => 'GET' }
  end

  def resources(resource)
    @routes << {:named_route => "#{resource}", :url => "/#{resource}", :controller_action => "#{resource}#index", :http_verb => 'GET' }
    @routes << {:named_route => "", :url => "/#{resource}", :controller_action => "#{resource}#create", :http_verb => 'POST' }
    @routes << {:named_route => "new_#{singularize(resource)}", :url => "/#{resource}/new", :controller_action => "#{resource}#new", :http_verb => 'GET' }
    @routes << {:named_route => "edit_#{singularize(resource)}", :url => "/#{resource}/:id/edit", :controller_action => "#{resource}#edit", :http_verb => 'GET' }
    @routes << {:named_route => "#{singularize(resource)}", :url => "/#{resource}/:id", :controller_action => "#{resource}#show", :http_verb => 'GET' }
    @routes << {:named_route => "", :url => "/#{resource}/:id", :controller_action => "#{resource}#update", :http_verb => 'PATCH' }
    @routes << {:named_route => "", :url => "/#{resource}/:id", :controller_action => "#{resource}#update", :http_verb => 'PUT' }
    @routes << {:named_route => "", :url => "/#{resource}/:id", :controller_action => "#{resource}#destroy", :http_verb => 'DELETE' }
  end

  def display_routes
    #The formatting wont't be as nice but it will do
    @routes.each do |route|
      puts "#{route[:named_route]} #{route[:http_verb]}  #{route[:url]} #{route[:controller_action]}"
    end
  end

  private
  def singularize(resource)
    if resource[-1] == 's'
      return resource[0...-1]
    end
  end
end

# my_router = MyRouter.new
#
# my_router.route do
#   root "home#index"
# end
#
# p my_router.routes

#alternatevely to make it look more like the rails api we could just

# my_router = MyRouter.new
#
# my_router.route do
#   root "home#index"
#   get "/latest", to: 'posts#latest', as: 'lastest_posts' 
#   resources :posts
# end
#
# my_router.display_routes


#Fancy markup
#I want to be able to obtain this:
# <html>
#   <body>
#     <div id="container">
#       <ul class="pretty">
#         <li class="active">Item 1</li>
#         <li>Item 2</li>
#       </ul>
#     </div>
#   </body>
# </html>
#
# #by writting this:
# output = FancyMarkup.new.document do
#   body do
#     div id: "container" do
#       ul class: "pretty" do
#         li "Item 1", class: :active
#         li "Item 2"
#       end
#     end
#   end
# end

#I need a instance attribute (@markup) that will contain the string containing the tags that we want
#I need a document intance method (.document) that will take a block as a parameter and will modify the @markup intance variable 
#I need some methods (body, div, ul, etc) that will modify the @markup in specific ways 
#I need to keep track of the indenation (somehow?) maybe using a indentation instance variable

class FancyMarkup
  attr_accessor :markup, :indent

  def initialize
    @markup = ""
    @indent = "  "
  end
  
  def document(&block)
    @markup << "<html>\n"
    instance_eval(&block)
    @markup << "</html>"
  end
  
  def method_missing(tag_name, *args, &block)
    tag(tag_name, args, &block) 
  end 

  private
  def tag(tag_name, args, &block)
    current_indentation = @indent
    content, selectors = tag_info(args)  
    
    markup << "#{current_indentation}<#{tag_name}#{attributes(selectors)}>#{content}"

    if block_given?
      @indent += "  "
      @markup << "\n"
      instance_eval(&block)
      markup << "#{current_indentation}</#{tag_name}>\n"
    else
      markup << "</#{tag_name}>\n"
    end
  end

  def attributes(arg)
    attrib = ""
    arg.each do |key, value|
      attrib << %( #{key}="#{value}")  
    end
    attrib
  end

  def tag_info(args)
    content = ""
    selectors = {}

    args.each do |arg|
      content = arg if arg.is_a?(String)
      selectors = arg if arg.is_a?(Hash)
    end 

    [content, selectors]
  end
end


my_markup = FancyMarkup.new.document do
  body do
    div id: "container" do
      ul class: "pretty" do
        li "Item 1", class: :active
        li "Item 2"
      end
    end 
  end
end

puts my_markup
