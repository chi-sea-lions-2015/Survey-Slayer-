get '/surveys' do
  @surveys = Survey.all
 erb :surveys
end

get '/my_surveys' do
  @user = current_user
  @surveys = Survey.all
  erb :my_surveys
end

get '/surveys/new' do
  erb :new_survey
end

get '/surveys/:survey_id/results' do
  @survey = Survey.find_by(id: params[:survey_id])
end

post '/surveys' do
  @user = current_user
  @survey = @user.surveys.create(params[:survey])
  redirect "/surveys/#{@survey.id}/questions/new"
end

get '/surveys/:survey_id/questions/new' do
  @survey = Survey.find_by(id: params[:survey_id])
  erb :"questions/new"
end

post '/surveys/:survey_id/questions' do
  @survey = Survey.find_by(id: params[:survey_id])
  @question = @survey.questions.create(params[:question])
  redirect "/surveys/#{@survey.id}/questions/#{@question.id}/choices/new"
end

get '/surveys/:survey_id/questions/:question_id/choices/new' do
  @survey= Survey.find_by(id: params[:survey_id])
  @question = Question.find_by(id: params[:question_id])
  erb :'choices/new'
end

post '/surveys/:survey_id/questions/:question_id/choices' do
  @survey = Survey.find_by(id: params[:survey_id])
  @question = Question.find_by(id: params[:question_id])
  @choice1 = @question.choices.create(params[:choice1])
  @choice2 = @question.choices.create(params[:choice2])
  @choice3 = @question.choices.create(params[:choice3])
  @choice4 = @question.choices.create(params[:choice4])
  redirect "/surveys"
end

