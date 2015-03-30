get '/participants/show' do
  # @user_id = session[:user_id]
  @surveys = Survey.all
  erb :'participants/show'
end

get '/participants/survey/:id' do
  @survey = Survey.find_by(id: params[:id])
  @survey_id = @survey.id
  @questions = @survey.questions
  erb :"participants/surveys"
end

post '/participants/survey/:id/response' do
  survey = Survey.find_by(id: params[:id])
  puts params
  user = current_user
  taken_survey = survey.taken_surveys.create(participant: user)
  response = taken_survey.responses.create(params[:choice])
  redirect "/surveys"
end
