Factory.sequence :login do |n|
  "user_#{n}"
end

Factory.define :user do |user|
  user.login                 { Factory.next :login }
  user.password              { "password" }
  user.name                  { "Name Test" }
end

Factory.define :post do |post|
  post.title {"Title"}
  post.body  {"Post"}
end