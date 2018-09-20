class FiguresController < ApplicationController

  get '/figures' do
    erb :"/figures/index"
  end

  get '/figures/new' do
    erb :"/figures/new"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :"/figures/edit"
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @title = Title.find_or_create_by(name: params[:title][:name])
      @figure.titles << @title
    end
    if !params[:landmark][:name].empty?
      @landmark = Landmark.find_or_create_by(name: params[:landmark][:name])
      @figure.landmarks << @landmark
    end
    @figure.save
    redirect '/'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:landmark][:name].empty?
      @landmark = Landmark.new(params[:landmark])
      @figure.landmarks << @landmark
    end
    @figure.save

    redirect "/figures/#{params[:id]}"
  end

end
