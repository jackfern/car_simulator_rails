class CarController < ApplicationController
  def create
    if (!params[:make].nil? && params[:make].strip.empty?) || (!params[:model_year].nil? && params[:model_year].strip.empty?)
      redirect_to '/'
    else
      @make = params[:make]
      @model_year = params[:model_year]
      @color = params[:color]
      @car = Car.new(@make,@model_year, @color)
      @parking_brake_on = @car.get_parking_brake
      @parking_brake_off = !@car.get_parking_brake
      session[:car] = @car.to_yaml
    end
  end

  def accelerate
    if !session.has_key?("car")
      redirect_to '/'
    else
      @car = YAML.load(session[:car])
      @car.accelerate
      @parking_brake_on = @car.get_parking_brake
      @parking_brake_off = !@car.get_parking_brake
      session[:car] = @car.to_yaml
      render 'create.html.erb'
    end
  end

  def brake
    if !session.has_key?("car")
      redirect_to '/'
    else
      @car = YAML.load(session[:car])
      @car.brake
      @parking_brake_on = @car.get_parking_brake
      @parking_brake_off = !@car.get_parking_brake
      session[:car] = @car.to_yaml
      render 'create.html.erb'
    end
  end

  def toggle_lights
    if !session.has_key?("car")
      redirect_to '/'
    else
      @car = YAML.load(session[:car])
      @speed = @car.get_speed
      @car.toggle_lights
      @parking_brake_on = @car.get_parking_brake
      @parking_brake_off = !@car.get_parking_brake
      session[:car] = @car.to_yaml
      render 'create.html.erb'
    end
  end

  def toggle_parking_brake
    if !session.has_key?("car")
      redirect_to '/'
    else
      @car = YAML.load(session[:car])
      @car.toggle_parking_brake(params[:parking_brake])
      @parking_brake_on = @car.get_parking_brake
      @parking_brake_off = !@car.get_parking_brake
      session[:car] = @car.to_yaml
      render 'create.html.erb'
    end
  end

  def index
  end
end
