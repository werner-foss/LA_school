# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

6.times do |adult|
  Adult.create!(
    title: "Course #{adult}",
    subtitle: "Some ESL",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
           Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
           Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
    main_image: "https://placeholdit.imgix.net/~text?txtsize=33&txt=350%C3%97150&w=350&h=150",
    thumb_image: "https://placeholdit.imgix.net/~text?txtsize=6&txt=50%C3%9750&w=50&h=50"
    )
  end
  
puts "6 courses for adults were created"

6.times do |kid|
  Kid.create!(
    title: "Course #{kid}",
    subtitle: "Some ESL",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
           Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
           Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
    main_image: "https://placeholdit.imgix.net/~text?txtsize=33&txt=350%C3%97150&w=350&h=150",
    thumb_image: "https://placeholdit.imgix.net/~text?txtsize=6&txt=50%C3%9750&w=50&h=50"
    )
  end
  
puts "6 courses for kids were created"

5.times do |news|
  News.create!(
    title: "Some awsome news #{news}",
    subtitle: "A little description of it",
    small_image: "https://placeholdit.imgix.net/~text?txtsize=33&txt=350%C3%97150&w=350&h=150",
    body: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis 
           praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias 
           excepturi sint occaecati cupiditate non provident, similique sunt in culpa 
           qui officia deserunt mollitia animi, id est laborum et dolorum fuga.",
    )
  end
puts "5 news were created"

3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
    )
  end
puts "3 topics were created"

5.times do |question|
  Question.create!(
    title: "FAQ #{question}",
    body: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium",
    topic_id: Topic.last.id
    )
  end
puts "5 questions were created"