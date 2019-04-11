FactoryBot.define do
  factory :review do
    score { 3 }
    comment { "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ullamcorper odio lorem, id molestie magna rutrum in. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec imperdiet quam erat. Nam eu ultrices massa. Vestibulum elit felis, malesuada vel nunc ac, tincidunt interdum mauris. Pellentesque et euismod augue, id tempor arcu." }
    guide { 1 }
  end
end
