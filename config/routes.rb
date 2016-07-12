Rails.application.routes.draw do
  get '/' => "tests#self.find"
end


# get '/' => 'tests#test'