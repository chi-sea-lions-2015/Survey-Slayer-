user = User.create!(name: "Nadia", email: "me@me.me", password: "12345")
survey = user.surveys.create!(title: "Dinos")
question = survey.questions.create!(title: "What is your favotite Dino?")
choice1 = question.choices.create!(title: "T-rex")
choice2 = question.choices.create!(title: "Spitting-dino")
taken_survey = survey.taken_surveys.create!(participant: user)
response = choice2.responses.create!(taken_survey: taken_survey)
