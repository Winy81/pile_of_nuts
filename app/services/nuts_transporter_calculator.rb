class NutsTransporterCalculator

  def initialize(distance, nuts, consumed_per_km, cart_capacity)

    @remaining_nuts = nuts
    @delivered_nuts = 0

    @single_trip = distance
    @return_trip = distance * 2

    @consumed_per_km = consumed_per_km
    @cart_capacity = cart_capacity

  end

  def compute_maximum_nuts

    # While nuts can cover the trip there and back and also the cart has enough capacity for it
    while is_the_remaining_nuts_can_cover_on_both_ways? && is_the_capacity_enough_to_cover_both_ways?
      @delivered_nuts += @cart_capacity - ate_supplement_on_there_and_back
      @remaining_nuts = @remaining_nuts - ate_supplement_on_there_and_back - @delivered_nuts
    end

    # The last trip (or only trip if the return is not possible) - can be - is a single if nuts can cover the trip only there and also the cart has enough capacity for it
    if  is_the_remaining_nuts_can_cover_a_full_way? && is_the_capacity_enough_to_cover_a_full_way?
      @last_trip_nuts = @cart_capacity < @remaining_nuts ? @cart_capacity - ate_supplement_on_single_trip : @remaining_nuts - ate_supplement_on_single_trip
      @delivered_nuts += @last_trip_nuts
    end

    @delivered_nuts
  end

  private

  def is_the_remaining_nuts_can_cover_on_both_ways?
    (@remaining_nuts - (@return_trip * @consumed_per_km)) > 0
  end

  def is_the_remaining_nuts_can_cover_a_full_way?
    (@remaining_nuts - (@single_trip * @consumed_per_km)) > 0
  end

  def is_the_capacity_enough_to_cover_both_ways?
    (@return_trip * @consumed_per_km) < @cart_capacity
  end

  def is_the_capacity_enough_to_cover_a_full_way?
    (@single_trip * @consumed_per_km) < @cart_capacity
  end

  def ate_supplement_on_there_and_back
    @return_trip * @consumed_per_km
  end

  def ate_supplement_on_single_trip
    @single_trip * @consumed_per_km
  end

end

