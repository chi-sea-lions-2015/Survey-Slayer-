user = User.create!(name: "Nadia", email: "me@me.me", password: "12345")
user2 = User.create!(name: "Nadia", email: "me@me.me", password: "12345")
survey = user.surveys.create!(title: "Dinos")
question = survey.questions.create!(title: "What is your favotite Dino?")
question2 = survey.questions.create!(title: "Why do you like it?")
choice1 = question.choices.create!(title: "T-rex")
choice2 = question.choices.create!(title: "Spitting-dino")
choice3 = question.choices.create!(title: "Kempies")
choice4 = question.choices.create!(title: "Mammoth")
choice5 = question2.choices.create!(title: "THey're awesome!!")
choice6 = question2.choices.create!(title: "They're all dead!")
choice7 = question2.choices.create!(title: "They do cool stuff")
choice8 = question2.choices.create!(title: "my mom likes them")
taken_survey = survey.taken_surveys.create!(participant: user)
response = choice2.responses.create!(taken_survey: taken_survey)
