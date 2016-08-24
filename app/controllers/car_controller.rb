class CarController < ApplicationController
  def create
    @make = params[:make]
    @model_year = params[:model_year]
    @color = params[:color]
    @car = Car.new(@make,@model_year, @color)
    @parking_brake_on = @car.get_parking_brake
    @parking_brake_off = !@car.get_parking_brake
    session[:car] = @car.to_yaml
  end

  def accelerate
    @car = YAML.load(session[:car])
    @car.accelerate
    @parking_brake_on = @car.get_parking_brake
    @parking_brake_off = !@car.get_parking_brake
    session[:car] = @car.to_yaml
    render 'create.html.erb'
  end

  def brake
    @car = YAML.load(session[:car])
    @car.brake
    @parking_brake_on = @car.get_parking_brake
    @parking_brake_off = !@car.get_parking_brake
    session[:car] = @car.to_yaml
    render 'create.html.erb'
  end

  def toggle_lights
    @car = YAML.load(session[:car])
    @speed = @car.get_speed
    @car.toggle_lights
    @parking_brake_on = @car.get_parking_brake
    @parking_brake_off = !@car.get_parking_brake
    session[:car] = @car.to_yaml
    render 'create.html.erb'
  end

  def toggle_parking_brake
    @car = YAML.load(session[:car])
    @car.toggle_parking_brake(params[:parking_brake])
    @parking_brake_on = @car.get_parking_brake
    @parking_brake_off = !@car.get_parking_brake
    session[:car] = @car.to_yaml
    render 'create.html.erb'
  end

  def index
  end
end
