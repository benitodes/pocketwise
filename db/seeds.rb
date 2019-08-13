# at least 2 levels for html

# desroy first: Class with references:
Course.destroy_all
Wallet.destroy_all
User.destroy_all
Category.destroy_all

# create user data array

# add more user information

user_list = [
  ['Benoit', 'Destresse', 'benoit@destresse.fr', 'password', true],
  ['Samba', 'OhGee', 'samba@dance.com', 'password', false],
  ['Jana', 'X', 'jana@x.com', 'password', true]
]

# create new users from array
# devise will automatically transform value of variable 'password' into encrypted password

user_list.each do |first_name, last_name, email, password, parent|
  User.create!(first_name: first_name, last_name: last_name, email: email, password: password, parent: parent)
end

puts "users have been created"

# create wallet
# byebug
kid = User.where(parent: false).sample
parent = User.where(parent: true).sample

wallet = Wallet.create!(payout_amount: 50, payout_frequency: 'Weekly', total_allowance: 70, payout_day: 'Saturday', parent_id: parent.id, kid_id: kid.id)

puts "wallet has been created"

# goals
goal_list = [
  ['bike', 'https://contents.mediadecathlon.com/p1239714/k$c3dfcfe3c9d9c01ad7b0a04c50ab1b5d/riverside-120-hybrid-cycle.jpg?&f=800x800',20, 100, 60, false, 1],
  ['transformers', 'https://d9nvuahg4xykp.cloudfront.net/7780383482862443400/8509331651037790392.jpg', 10, 50, 30, false, 1],
  ['light saber', 'https://images-na.ssl-images-amazon.com/images/I/41YsZiuMvrL._SX425_.jpg', 5, 25, 25, false, 1]
]

goal_list.each do |name, picture, goal_allowance, goal_price, goal_current_saving, complete, wallet_id|
  Goal.create!(name: name, picture: picture, goal_allowance: goal_allowance, goal_price: goal_price, goal_current_saving: goal_current_saving, complete: complete, wallet_id: wallet.id)
end

puts "goals have been created"

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
    false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/1280px-HTML5_logo_and_wordmark.svg.png', Category.first.id],


  ['Learn CSS', 'Without CSS, every web page would be drab plain text and images that flowed straight down the page.
    With CSS, you can add color and background images and change the layout of your page — your web pages can feel like works of art!',
    false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/CSS3_logo_and_wordmark.svg/1024px-CSS3_logo_and_wordmark.svg.png', Category.first.id],


  ['Introduction to JavaScript', 'JavaScript is among the most powerful and flexible programming languages of the web. It powers the dynamic behavior on most websites, including this one.',
    true, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/1280px-HTML5_logo_and_wordmark.svg.png', Category.first.id],


  ['Learn Python', 'Python is a general-purpose, versatile and popular programming language. It’s great as a first language because it is concise and easy to read,
    and it is also a good language to have in any programmer’s stack as it can be used for everything from web development to software development and data science applications.',
    false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/220px-Python-logo-notext.svg.png', Category.first.id],


  ['Learn SQL', 'We live in a data-driven world: people search through data to find insights to inform strategy, marketing, operations, and a plethora of other categories.',
    false, 'https://banner2.kisspng.com/20180330/zle/kisspng-microsoft-azure-sql-database-microsoft-sql-server-database-5abeaece642720.1956423515224460304102.jpg', Category.first.id],

  ['Learn Java', 'Java is among the most popular programming languages out there, mainly because of how versatile and compatible it is.
    Java can be used for a large number of things, including software development, mobile applications, and large systems development.',
    true, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/1280px-HTML5_logo_and_wordmark.svg.png', Category.first.id]

]

# create new courses from array

course_list.each do |name, description, complete, picture, category_id|
  course = Course.create!( name: name, description: description, complete: complete, picture: picture, category_id: category_id)
end

puts "courses have been created"

# create levels

level_list = [
  ['Elements and Structure', 1, true, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/1280px-HTML5_logo_and_wordmark.svg.png', Course.first.id],
  ['Tables', 2, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/1280px-HTML5_logo_and_wordmark.svg.png', Course.first.id],
  ['Forms', 3, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/1280px-HTML5_logo_and_wordmark.svg.png', Course.first.id]
]

level_list.each do |name, number, complete, picture, course_id|
  Level.create!(name: name, number: number, complete: complete, picture: picture, course_id: course_id)
end

puts "levels have been created"


# create lectures

lecture_list = [
  ['HTML Structure', 'HTML is organized as a collection of family tree relationships. When an element is contained inside another element, it is considered the child of that element. The child element is said to be nested inside of the parent element.', true, "https://www.oreilly.com/library/view/learning-web-design/9781449337513/httpatomoreillycomsourceoreillyimages2257981.png", 1, Level.first.id],
  ['Heading Elements in HTML', 'Headings in HTML are similar to headings in other types of media. For example, in newspapers, large headings are typically used to capture a reader’s attention. Other times, headings are used to describe content, like the title of a movie or an educational article.', true, "https://i0.wp.com/ictacademy.com.ng/wp-content/uploads/2017/10/Heading-Tag-Hierarchy.jpg?zoom=2&resize=754%2C471", 2, Level.first.id],
  ['The Body', 'One of the key HTML elements we use to build a webpage is the body element. Only content inside the opening and closing body tags can be displayed to the screen.', true, 'https://i.stack.imgur.com/TPEm3.png', 3, Level.first.id],
  ['Why Tables?', 'There are many websites on the Internet that display information like stock prices, sports scores, invoice data, and more. This data is naturally tabular in nature, meaning that a table is often the best way of presenting the data.', false, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVFm44EKGjXhMSRfVrKqSq6gaEOag8SkprgrhGretvkKfCHR09yw', 4, Level.second.id],
  ['Create a Table', 'Before displaying data, you must first create the table that will contain the data by using the <table> element.', false, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCnOoevg7j9aLRTlea-8ml4w51RTkLrnOT-QZKlMesOk7yY16lag', 5, Level.second.id],
  ['Table Rows', 'In many programs that use tables, the table is already predefined for you, meaning that it contains the rows, columns, and cells that will hold data. In HTML, all of these components must be created.', false, 'https://higherlogicdownload.s3.amazonaws.com/JAMASOFTWARE/UploadedImages/419b250b-4dd2-48f6-a082-f5391ee4239e/Screen%20Shot%202016-12-06%20at%2012.07.56.png', 6, Level.second.id],
  ['Introduction to HTML Forms', 'Forms are a part of everyday life. When we use a physical form in real life, we write down information and give it to someone to process. Think of the times you’ve had to fill out information for various applications like a job, or a bank account, or dropped off a completed suggestion card — each instance is a form!', false, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTimKKSKnXbt7toXwK4kUun8k_2mXDeJQ0tGGOElvp6Tnzuem0qfg', 7, Level.third.id],
  ['How a Form Works', 'We can think of the internet as a network of computers which send and receive information. Computers need an HTTP request to know how to communicate. The HTTP request instructs the receiving computer how to handle the incoming information. More information can be found in our article about HTTP requests.', false, 'https://www.formsite.com/wp-content/themes/formsite-theme/assets/images/how-it-works/alumni-form@2x.png', 8, Level.third.id],
  ['Text Input', 'If we want to create an input field in our <form>, we’ll need the help of the <input> element. The <input> element has a type attribute which determines how it renders on the web page and what kind of data it can accept.', false, 'https://res.cloudinary.com/css-tricks/image/upload/c_scale,w_802,f_auto,q_auto/v1498411917/required-input_xkqd8x.png', 9, Level.third.id]
]

lecture_list.each do |title, description, complete, picture, number, level_id|
  Lecture.create!(title: title, description: description, complete: complete, picture: picture, number: number, level_id: level_id)
end

puts "lectures have been created"

# create questions

question_list = [
  ['What is HTML use for?', 'CSS is for the style so HTML is for [...]? :)', true, 'https://upload.wikimedia.org/wikipedia/commons/6/61/HTML5_logo_and_wordmark.svg', 1, Level.first.id],
  ['How many headings to we know?', '3*2 = ? ;)', true, 'https://upload.wikimedia.org/wikipedia/commons/6/61/HTML5_logo_and_wordmark.svg', 2, Level.first.id],
  ['Is it possible to display content outside of the body tag?', 'think', true, 'https://upload.wikimedia.org/wikipedia/commons/6/61/HTML5_logo_and_wordmark.svg', 3, Level.first.id],
  ['Why do we need tables in HTML?', 'think', false, 'https://upload.wikimedia.org/wikipedia/commons/6/61/HTML5_logo_and_wordmark.svg', 1, Level.second.id],
  ['Which element do we use to create a table?', 'To create a body on your page, you will use : <body></body> right?',false, 'https://upload.wikimedia.org/wikipedia/commons/6/61/HTML5_logo_and_wordmark.svg', 2, Level.second.id],
  ['Which element allow us to create a row element?', 'To create a table on your page, you will use : <table></table> right?', false, 'https://upload.wikimedia.org/wikipedia/commons/6/61/HTML5_logo_and_wordmark.svg', 3, Level.second.id],
  ['Why do we use form in HTML?', 'Why do we use form in real life?', false, 'https://upload.wikimedia.org/wikipedia/commons/6/61/HTML5_logo_and_wordmark.svg', 1, Level.third.id],
  ['To create a form, you need an action and a [...]?', 'How do we call POST and GET ?', false, 'https://upload.wikimedia.org/wikipedia/commons/6/61/HTML5_logo_and_wordmark.svg', 2, Level.third.id],
  ['What do we need inside our form?', 'think', false, 'https://upload.wikimedia.org/wikipedia/commons/6/61/HTML5_logo_and_wordmark.svg', 3, Level.third.id]
]

question_list.each do |question_content, hint, complete, picture, number, level_id|
  Question.create!(question_content: question_content, hint: hint, complete: complete, picture: picture, number: number, level_id: level_id)
end

puts "questions have been created"

# create answers

answer_list = [
  ['HTML provides structure to the content appearing on a website, such as images, text, or videos.', false, Question.first.id],
  ['6', true, Question.first.id],
  ['No', true, Question.first.id],
  ['To present tabular data to users.', false, Question.second.id],
  ['<table></table>', false, Question.second.id],
  ['<tr></tr>', false, Question.second.id],
  ['HTML <form> element is responsible for collecting information to send somewhere else', false, Question.third.id],
  ['Method', false, Question.third.id],
  ['An input', false, Question.third.id]
]

answer_list.each do |answer_content, correct, question_id|
  Answer.create!(answer_content: answer_content, correct: correct, question_id: question_id)
end

puts "answers have been created"
