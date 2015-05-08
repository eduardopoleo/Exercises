class FancyMarkup
  attr_accessor :tags, :indent

  def initialize
    self.tags = "" 
    self.indent = ""
  end

  
  def html(&block)
    self.tags << "<html>" + "\n"
    instance_eval(&block)
    self.tags << "</html>"
  end

  def body(&block)
    body_indent = self.indent*2 
    self.tags << %{#{indent}<body>} + "\n"
    instance_eval(&block)
    self.tags << %{#{indent}</body>} + "\n"
  end

  def div(options, &block) #id: "container", class: "someclass"
    div_indent = self.indent*2 
    self.tags << %{#{indent}<div id="#{options[:id]}">} + "\n"
    instance_eval(&block)
    self.tags << %{#{indent}</div>} + "\n"
  end

  def ul(options, &block)
    ul_indent = self.indent*2 
    self.tags << %{#{indent}<ul class="#{options[:class]}">} + "\n"
    instance_eval(&block)
    self.tags << %{#{indent}</ul>} + "\n"
  end

  def li(content = "", options = {})
    li_indent = self.indent 
    self.tags << %{#{indent}<li class="#{options[:class]}">#{content}</li>} + "\n"
  end
end

output = FancyMarkup.new.html do 
  body do
     div id: "container" do
       ul class: "pretty" do
         li "Item 1", class: :active
         li "Item 2"
       end
     end
  end
end

puts output

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
