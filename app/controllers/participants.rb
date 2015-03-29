get '/participants/show' do
  @user_id = session[:user_id]
  @surveys = Survey.all
  p @surveys
  erb :'participants/show'
end

get '/participants/survey/:id' do
  @survey = Survey.find_by(id: params[:id])
  @survey_id = @survey.id
  # @choices = @survey.
  erb :"participants/surveys"
end

put '/participants/survey/:id' do
  @survey = Survey.find_by(id: params[:id])
  @survey_id = @survey.id
  erb :"participants/surveys"
end
