# at least 2 levels for html

# desroy first: Class with references:
Course.destroy_all
User.destroy_all
Category.destroy_all


# create user data array

# add more user information

user_list = [
  ['Benoit', 'Destresse', 'benoit@destresse.fr', 'password'],
  ['Samba', 'OhGee', 'samba@dance.com', 'password'],
  ['Jana', 'X', 'jana@x.com', 'password']
]

# create new users from array
# devise will automatically transform value of variable 'password' into encrypted password

user_list.each do |first_name, last_name, email, password|
  User.create!(first_name: first_name, last_name: last_name, email: email, password: password)
end

puts "users have been created"

category_list = ['coding', 'german', 'maths', 'physics']

# if bang after create rails will throw error, raises exception


category_list.each do |name|
  Category.create!(name: name)
end

puts "categories have been created"


# create courses data array


course_list = [

  ['Learn HTML', 'HTML is the foundation of all web pages. Without HTML, you wouldn’t be able to organize text or add images or videos to your web pages.
    HTML is the beginning of everything you need to know to create engaging web pages!',
    false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/1280px-HTML5_logo_and_wordmark.svg.png', 1],


  ['Learn CSS', 'Without CSS, every web page would be drab plain text and images that flowed straight down the page.
    With CSS, you can add color and background images and change the layout of your page — your web pages can feel like works of art!',
    false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/CSS3_logo_and_wordmark.svg/1024px-CSS3_logo_and_wordmark.svg.png', 1],


  ['Introduction to JavaScript', 'JavaScript is among the most powerful and flexible programming languages of the web. It powers the dynamic behavior on most websites, including this one.',
    true, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/1280px-HTML5_logo_and_wordmark.svg.png', 1],


  ['Learn Python', 'Python is a general-purpose, versatile and popular programming language. It’s great as a first language because it is concise and easy to read,
    and it is also a good language to have in any programmer’s stack as it can be used for everything from web development to software development and data science applications.',
    false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/220px-Python-logo-notext.svg.png', 1],


  ['Learn SQL', 'We live in a data-driven world: people search through data to find insights to inform strategy, marketing, operations, and a plethora of other categories.',
    false, 'https://banner2.kisspng.com/20180330/zle/kisspng-microsoft-azure-sql-database-microsoft-sql-server-database-5abeaece642720.1956423515224460304102.jpg', 1],

  ['Learn Java', 'Java is among the most popular programming languages out there, mainly because of how versatile and compatible it is.
    Java can be used for a large number of things, including software development, mobile applications, and large systems development.',
    true, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/1280px-HTML5_logo_and_wordmark.svg.png', 1]

]

# create new courses from array

course_list.each do |name, description, complete, picture, category_id|
  course = Course.create!( name: name, description: description, complete: complete, picture: picture, category_id: category_id)
end

puts "courses have been created"

# create levels

level_list = [
  ['Elements and Structure', 1, true, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/1280px-HTML5_logo_and_wordmark.svg.png', 1],
  ['Tables', 2, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/1280px-HTML5_logo_and_wordmark.svg.png', 1],
  ['Forms', 3, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/1280px-HTML5_logo_and_wordmark.svg.png', 1]
]

level_list.each do |name, number, complete, picture, course_id|
  Level.create!(name: name, number: number, complete: complete, picture: picture, course_id: course_id)
end

puts "levels have been created"



# create lectures

lecture_list = [
  ['.....'],
  ['.....'],
]

lecture_list.each do |title, description, complete, picture, level_id|
  Lecture.create!(title: title, description: description, complete: complete, picture: picture, level_id: level_id)
end

puts "lectures have been created"




# create questions

question_list = [
  [],
  [],
]

question_list.each do |question_content, hint, complete, picture, level_id|
  Question.create!(question_content: question_content, hint: hint, complete: complete, picture: picture, level_id: level_id)
end

puts "questions have been created"



# create answers

answer_list = [
  [],
  [],
]

answer_list.each do |answer_content, correct, question_id|
  Answer.create!(answer_content: answer_content, correct: correct, question_id: level_id)
end

puts "answers have been created"






# create wallet
# goals


