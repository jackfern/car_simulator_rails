class Car
  def initialize(make,model_year,color)
    @make = make
    @model_year = model_year
    @speed = 0
    @lights = false
    @light_status = "off"
    @parking_brake = false
    @color = color
  end

  def get_make
    @make
  end

  def get_model_year
    @model_year
  end

  def get_speed
    @speed
  end

  def get_lights
    @light_status
  end

  def get_make= x
    @make = x
  end

  def get_model_year= y
    @model_year = y
  end

  def get_speed= z
    @speed = z
  end

  def get_lights= a
    @light_status = a
  end

  def accelerate
    if @parking_brake == false
      @speed += 10
    end
  end

  def brake
    if @speed > 6
      @speed -= 7
    else
      @speed = 0
    end
  end

  def toggle_lights
    if @lights == false
      @lights = true
      @light_status = "on"
    else
      @lights = false
      @light_status = "off"
    end
  end

  def toggle_parking_brake(x)
    if x == "true" && @speed == 0
      @parking_brake = true
    elsif x == "false"
      @parking_brake = false
    end
  end

  def get_parking_brake
    @parking_brake
  end

  def get_color
    @color
  end

end
