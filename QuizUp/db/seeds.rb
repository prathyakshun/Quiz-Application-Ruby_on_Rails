# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'admin@gmail.com', password: 'admin123', admin:true)
g1 = Genre.create(genrename: 'sports')
g2 = Genre.create(genrename: 'movies')
sg1 = Subgenre.create(subgenrename: 'cricket', Genre_id: g1.id)
sg2 = Subgenre.create(subgenrename: 'football', Genre_id: g1.id)
sg3 = Subgenre.create(subgenrename: 'Hollywood', Genre_id:g2.id)
sg4 = Subgenre.create(subgenrename: 'Bollywood', Genre_id:g2.id)

q1 = Question.create(Genre_id: g1.id, Subgenre_id: sg1.id ,questiontext: 'Who was the first test captain of the Indian Cricket Team ?', qtype: 1)
Option.create!(optiontext: 'CK Nayudu', correct: 'true', Question_id: q1.id)
Option.create!(optiontext: 'Ajit Wadekar', correct: 'false', Question_id: q1.id)
Option.create!(optiontext: 'Vijay Hazare', correct: 'false', Question_id: q1.id)
Option.create!(optiontext: 'Bapu Nadkarni', correct: 'false', Question_id: q1.id)

q4 = Question.create(Genre_id: g1.id, Subgenre_id: sg1.id ,questiontext: 'Which is first Indian cricket tournament ?', qtype: 1)
Option.create!(optiontext: 'Pepsi Cup', correct: 'false', Question_id: q4.id)
Option.create!(optiontext: 'Bombay Series', correct: 'false', Question_id: q4.id)
Option.create!(optiontext: 'Bombay Triangular', correct: 'true', Question_id: q4.id)
Option.create!(optiontext: 'None of these', correct: 'false', Question_id: q4.id)

q5 = Question.create(Genre_id: g1.id, Subgenre_id: sg1.id ,questiontext: 'Which of the following is first cricket club in India ?', qtype: 1)
Option.create!(optiontext: 'East India Cricket Club', correct: 'false', Question_id: q5.id)
Option.create!(optiontext: 'Bombay Cricket Club', correct: 'false', Question_id: q5.id)
Option.create!(optiontext: 'Oriental Cricket Club', correct: 'true', Question_id: q5.id)
Option.create!(optiontext: 'Maharashtra Cricket Club', correct: 'false', Question_id: q5.id)

q6 = Question.create(Genre_id: g1.id, Subgenre_id: sg1.id ,questiontext: 'India played their First ODI Match against?', qtype: 1)
Option.create!(optiontext: 'Pakistan', correct: 'false', Question_id: q6.id)
Option.create!(optiontext: 'South Africa', correct: 'false', Question_id: q6.id)
Option.create!(optiontext: 'Australia', correct: 'false', Question_id: q6.id)
Option.create!(optiontext: 'England', correct: 'true', Question_id: q6.id)

q7 = Question.create(Genre_id: g1.id, Subgenre_id: sg1.id ,questiontext: 'India played their First T20 match against ?', qtype: 1)
Option.create!(optiontext: 'South Africa', correct: 'true', Question_id: q7.id)
Option.create!(optiontext: 'Pakistan', correct: 'false', Question_id: q7.id)
Option.create!(optiontext: 'England', correct: 'false', Question_id: q7.id)
Option.create!(optiontext: 'West Indies', correct: 'false', Question_id: q7.id)

q2 = Question.create(Genre_id: g1.id, Subgenre_id: sg1.id, questiontext: 'Who was not the first ODI captain of the Indian Cricket Team ?', qtype: 2)
Option.create!(optiontext: 'Vijay Hazare', correct: 'true', Question_id: q2.id)
Option.create!(optiontext: 'Bapu Nadkarni', correct: 'true', Question_id: q2.id)
Option.create!(optiontext: 'CK Nayudu', correct: 'false', Question_id: q2.id)
Option.create!(optiontext: 'Ajit Wadekar', correct: 'true', Question_id: q2.id)

q3 = Question.create(Genre_id: g1.id, Subgenre_id: sg2.id, questiontext: 'Which team does Lionel Messi play for?', qtype: 2)
Option.create!(optiontext: 'Argentina', correct: 'true', Question_id: q3.id)
Option.create!(optiontext: 'PSG', correct: 'false', Question_id: q3.id)
Option.create!(optiontext: 'Manchester United', correct: 'false', Question_id: q3.id)
Option.create!(optiontext: 'Barcelona', correct: 'true', Question_id: q3.id)

q8 = Question.create(Genre_id: g1.id, Subgenre_id: sg2.id, questiontext: 'Which of the following country won Football world Cup maximum times?', qtype: 1)
Option.create!(optiontext: 'Germany', correct: 'false', Question_id: q8.id)
Option.create!(optiontext: 'Italy', correct: 'false', Question_id: q8.id)
Option.create!(optiontext: 'Argentina', correct: 'false', Question_id: q8.id)
Option.create!(optiontext: 'Brazil', correct: 'true', Question_id: q8.id)

q9 = Question.create(Genre_id: g1.id, Subgenre_id: sg2.id, questiontext: 'When was the first FIFA Worldcup inaugrated?', qtype: 1)
Option.create!(optiontext: '1930', correct: 'true', Question_id: q9.id)
Option.create!(optiontext: '1931', correct: 'false', Question_id: q9.id)
Option.create!(optiontext: '1932', correct: 'false', Question_id: q9.id)
Option.create!(optiontext: '1933', correct: 'false', Question_id: q9.id)

q10 = Question.create(Genre_id: g1.id, Subgenre_id: sg2.id, questiontext: 'Which of the following team plays in stripes?', qtype: 2)
Option.create!(optiontext: 'Newcastle', correct: 'true', Question_id: q10.id)
Option.create!(optiontext: 'Southampton', correct: 'true', Question_id: q10.id)
Option.create!(optiontext: 'Tottenham Hotspur', correct: 'false', Question_id: q10.id)
Option.create!(optiontext: 'Lincoln City', correct: 'true', Question_id: q10.id)

q11 = Question.create(Genre_id: g1.id, Subgenre_id: sg2.id, questiontext: 'Which club won the La Liga league title in successive years in 1983 and 1984?', qtype: 1)
Option.create!(optiontext: 'Real Sociedad', correct: 'false', Question_id: q11.id)
Option.create!(optiontext: 'Real Madrid', correct: 'false', Question_id: q11.id)
Option.create!(optiontext: 'Barcelona', correct: 'false', Question_id: q11.id)
Option.create!(optiontext: 'Athletic Bilbao', correct: 'true', Question_id: q11.id)

q12 = Question.create(Genre_id: g1.id, Subgenre_id: sg2.id, questiontext: 'Who is the all-time top scorer in La Liga history still playing in Spain or elsewhere?', qtype: 1)
Option.create!(optiontext: 'Lionel Messi', correct: 'false', Question_id: q12.id)
Option.create!(optiontext: 'Raul', correct: 'true', Question_id: q12.id)
Option.create!(optiontext: 'Samuel Eto', correct: 'false', Question_id: q12.id)
Option.create!(optiontext: 'David Villa', correct: 'false', Question_id: q12.id)

q13 = Question.create(Genre_id: g1.id, Subgenre_id: sg2.id, questiontext: 'How many times have Barcelona and Real Madrid both failed to finish in the top-two in La Liga?', qtype: 1)
Option.create!(optiontext: '0', correct: 'false', Question_id: q13.id)
Option.create!(optiontext: '6', correct: 'false', Question_id: q13.id)
Option.create!(optiontext: '9', correct: 'false', Question_id: q13.id)
Option.create!(optiontext: '11', correct: 'true', Question_id: q13.id)

q14 = Question.create(Genre_id: g1.id, Subgenre_id: sg2.id, questiontext: 'Who among these players has won the league with both Barcelona and Real Madrid?', qtype: 1)
Option.create!(optiontext: 'Sameul Eto', correct: 'false', Question_id: q14.id)
Option.create!(optiontext: 'Javier Saviola', correct: 'false', Question_id: q14.id)
Option.create!(optiontext: 'Albert Celades', correct: 'true', Question_id: q14.id)
Option.create!(optiontext: 'Robert Prosinecki', correct: 'false', Question_id: q14.id)

q15 = Question.create(Genre_id: g1.id, Subgenre_id: sg2.id, questiontext: 'Which of these players did not score the first Golden Goal in World Cup history?', qtype: 2)
Option.create!(optiontext: 'Henry Camara', correct: 'true', Question_id: q15.id)
Option.create!(optiontext: 'llhan Mansiz', correct: 'true', Question_id: q15.id)
Option.create!(optiontext: 'Ahn Jung-Hwan', correct: 'true', Question_id: q15.id)
Option.create!(optiontext: 'Laurent Blanc', correct: 'false', Question_id: q15.id)

q16 = Question.create(Genre_id: g2.id, Subgenre_id: sg3.id, questiontext: 'In Harry Potter, who plays Nearly Headless Nick in the movie?', qtype: 1)
Option.create!(optiontext: 'Nicholas Cage', correct: 'false', Question_id: q16.id)
Option.create!(optiontext: 'John Hurt', correct: 'false', Question_id: q16.id)
Option.create!(optiontext: 'John Cleese', correct: 'true', Question_id: q16.id)
Option.create!(optiontext: 'Nick Nolte', correct: 'false', Question_id: q16.id)

q17 = Question.create(Genre_id: g2.id, Subgenre_id: sg3.id, questiontext: 'In Harry Potter who plays Mr. Ollivander, the wand maker and merchant in Diagon Alley in the movie?', qtype: 1)
Option.create!(optiontext: 'George Harrison', correct: 'false', Question_id: q17.id)
Option.create!(optiontext: 'John Hurt', correct: 'true', Question_id: q17.id)
Option.create!(optiontext: 'John Cleese', correct: 'false', Question_id: q17.id)
Option.create!(optiontext: 'Tom Cruise', correct: 'false', Question_id: q17.id)

q18 = Question.create(Genre_id: g2.id, Subgenre_id: sg3.id, questiontext: 'In The Sorcerers Stone besides a cake, what does Hagrid not get Harry for his birthday?', qtype: 2)
Option.create!(optiontext: 'A wand', correct: 'true', Question_id: q18.id)
Option.create!(optiontext: 'An owl', correct: 'false', Question_id: q18.id)
Option.create!(optiontext: 'A broomstick', correct: 'true', Question_id: q18.id)
Option.create!(optiontext: 'Books', correct: 'true', Question_id: q18.id)

q19 = Question.create(Genre_id: g2.id, Subgenre_id: sg3.id, questiontext: ' In The Sorcerers Stone, how many last minute points does Gryffindor get from Dumbledore?', qtype: 1)
Option.create!(optiontext: '200', correct: 'false', Question_id: q19.id)
Option.create!(optiontext: '170', correct: 'true', Question_id: q19.id)
Option.create!(optiontext: '50', correct: 'false', Question_id: q19.id)
Option.create!(optiontext: '100', correct: 'false', Question_id: q19.id)

q20 = Question.create(Genre_id: g2.id, Subgenre_id: sg3.id, questiontext: ' In Goblet of Fire what figures came out of Voldemorts wand?', qtype: 2)
Option.create!(optiontext: 'The old man, Frank Bryce ', correct: 'true', Question_id: q20.id)
Option.create!(optiontext: 'Cedric Diggory ', correct: 'true', Question_id: q20.id)
Option.create!(optiontext: 'Lily Potter ', correct: 'true', Question_id: q20.id)
Option.create!(optiontext: 'Bertha Jorkins', correct: 'false', Question_id: q20.id)

q21 = Question.create(Genre_id: g2.id, Subgenre_id: sg3.id, questiontext: 'In Goblet of Fire, who tells Harry to use gillyweed?', qtype: 1)
Option.create!(optiontext: 'Dobby', correct: 'false', Question_id: q21.id)
Option.create!(optiontext: 'Hermione ', correct: 'false', Question_id: q21.id)
Option.create!(optiontext: 'Neville ', correct: 'true', Question_id: q21.id)
Option.create!(optiontext: 'Mad-Eye Moody', correct: 'false', Question_id: q21.id)

q22 = Question.create(Genre_id: g2.id, Subgenre_id: sg4.id, questiontext: 'Aishwarya Rai was crowned Miss World in which year?', qtype: 1)
Option.create!(optiontext: '1992', correct: 'false', Question_id: q22.id)
Option.create!(optiontext: '1993', correct: 'false', Question_id: q22.id)
Option.create!(optiontext: '1994', correct: 'true', Question_id: q22.id)
Option.create!(optiontext: '1995', correct: 'false', Question_id: q22.id)

q23 = Question.create(Genre_id: g2.id, Subgenre_id: sg4.id, questiontext: 'Who, apart from Aamir Khan, wants to marry Preity Zinta in Dil Chahta Hai?', qtype: 1)
Option.create!(optiontext: 'Ayub Khan', correct: 'true', Question_id: q23.id)
Option.create!(optiontext: 'Akshaye Khanna', correct: 'false', Question_id: q23.id)
Option.create!(optiontext: 'Shah Rukh Khan', correct: 'false', Question_id: q23.id)
Option.create!(optiontext: 'Saif Ali Khan', correct: 'false', Question_id: q23.id)

q24 = Question.create(Genre_id: g2.id, Subgenre_id: sg4.id, questiontext: 'From where does Veeru propose to Basanti in Sholay?', qtype: 1)
Option.create!(optiontext: 'Top of Water Tank', correct: 'true', Question_id: q24.id)
Option.create!(optiontext: 'Top of ladder', correct: 'false', Question_id: q24.id)
Option.create!(optiontext: 'Top of a roof', correct: 'false', Question_id: q24.id)
Option.create!(optiontext: 'Top of a hill', correct: 'false', Question_id: q24.id)

q25 = Question.create(Genre_id: g2.id, Subgenre_id: sg4.id, questiontext: 'The song Aye mere pyaare watan is not from the film...?', qtype: 2)
Option.create!(optiontext: 'Upkaar', correct: 'true', Question_id: q25.id)
Option.create!(optiontext: 'Sarfarosh', correct: 'true', Question_id: q25.id)
Option.create!(optiontext: 'Kabuliwala', correct: 'false', Question_id: q25.id)
Option.create!(optiontext: 'Sikandar E-Azam', correct: 'true', Question_id: q25.id)

q26 = Question.create(Genre_id: g2.id, Subgenre_id: sg4.id, questiontext: 'Who did not play Amisha Patels mother in Yeh Zindagi Ka Safar?', qtype: 2)
Option.create!(optiontext: 'Nafisa Ali', correct: 'false', Question_id: q26.id)
Option.create!(optiontext: 'Nafisa Joseph', correct: 'true', Question_id: q26.id)
Option.create!(optiontext: 'Nafisa Lal', correct: 'true', Question_id: q26.id)
Option.create!(optiontext: 'Jaya Bacchan', correct: 'true', Question_id: q26.id)

q27 = Question.create(Genre_id: g2.id, Subgenre_id: sg4.id, questiontext: 'Who did not play Amisha Patels mother in Yeh Zindagi Ka Safar?', qtype: 1)
Option.create!(optiontext: 'Bhabis sister', correct: 'true', Question_id: q27.id)
Option.create!(optiontext: 'Friends sister', correct: 'false', Question_id: q27.id)
Option.create!(optiontext: 'Mamas daughter', correct: 'false', Question_id: q27.id)
Option.create!(optiontext: 'A Friend', correct: 'false', Question_id: q27.id)

q28 = Question.create(Genre_id: g1.id, Subgenre_id: sg1.id, questiontext: 'Identify the player', qtype: 3, image_url:'http://s3.india.com/wp-content/uploads/2014/12/ms-dhoni-first-test-century.jpg')
Option.create!(optiontext: 'MS Dhoni', correct: 'true', Question_id: q28.id)
Option.create!(optiontext: 'Sachin Tendulkar', correct: 'false', Question_id: q28.id)
Option.create!(optiontext: 'Virender Sehwag', correct: 'false', Question_id: q28.id)
Option.create!(optiontext: 'Virat Kohli', correct: 'false', Question_id: q28.id)

q29 = Question.create(Genre_id: g1.id, Subgenre_id: sg2.id, questiontext: 'Identify the player', qtype: 3, image_url:'http://i1.mirror.co.uk/incoming/article11158892.ece/ALTERNATES/s615/FC-Barcelona-v-Juventus-UEFA-Champions-League.jpg')
Option.create!(optiontext: 'Messi', correct: 'true', Question_id: q29.id)
Option.create!(optiontext: 'Swarez', correct: 'false', Question_id: q29.id)
Option.create!(optiontext: 'Rooney', correct: 'false', Question_id: q29.id)
Option.create!(optiontext: 'Neymar', correct: 'false', Question_id: q29.id)

q30 = Question.create(Genre_id: g1.id, Subgenre_id: sg2.id, questiontext: 'Identify the player', qtype: 3, image_url:'https://www.thesun.co.uk/wp-content/uploads/2017/08/nintchdbpict000348421167-e1503918817915.jpg?strip=all&w=791&quality=100')
Option.create!(optiontext: 'Asensio', correct: 'false', Question_id: q30.id)
Option.create!(optiontext: 'Ronaldo', correct: 'true', Question_id: q30.id)
Option.create!(optiontext: 'Ronaldinho', correct: 'false', Question_id: q30.id)
Option.create!(optiontext: 'Bale', correct: 'false', Question_id: q30.id)

q31 = Question.create(Genre_id: g2.id, Subgenre_id: sg3.id, questiontext: 'Identify the Actor', qtype: 3, image_url:'http://i.huffpost.com/gen/1541321/images/o-THE-WOLF-OF-WALL-STREET-facebook.jpg')
Option.create!(optiontext: 'Di Caprio', correct: 'true', Question_id: q31.id)
Option.create!(optiontext: 'Tom Cruise', correct: 'false', Question_id: q31.id)
Option.create!(optiontext: 'Robert Downey Jr', correct: 'false', Question_id: q31.id)
Option.create!(optiontext: 'Johnny Depp', correct: 'false', Question_id: q31.id)

q32 = Question.create(Genre_id: g2.id, Subgenre_id: sg4.id, questiontext: 'Identify the Actress', qtype: 3, image_url:'http://st1.bollywoodlife.com/wp-content/uploads/2017/07/Untitled-26-1.jpg')
Option.create!(optiontext: 'Alia Bhatt', correct: 'false', Question_id: q32.id)
Option.create!(optiontext: 'Deepika Padukone', correct: 'false', Question_id: q32.id)
Option.create!(optiontext: 'Kriti Sanon', correct: 'false', Question_id: q32.id)
Option.create!(optiontext: 'Disha Patani', correct: 'true', Question_id: q32.id)
