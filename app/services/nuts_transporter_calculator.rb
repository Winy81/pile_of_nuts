class NutsTransporterCalculator

  def self.compute_maximum_nuts(distance, nuts, consumed_per_km, cart_capacity)

    remaining_nuts = nuts
    delivered_nuts = 0

    single_trip = distance
    return_trip = distance * 2

    # While nuts can cover the trip there and back and also the cart has enough capacity for it
    while (remaining_nuts - (return_trip * consumed_per_km)) > 0 && (return_trip * consumed_per_km) < cart_capacity
      delivered_nuts += cart_capacity - (return_trip * consumed_per_km)
      remaining_nuts = remaining_nuts - (return_trip * consumed_per_km) - delivered_nuts
    end

    # The last trip (or only trip if the return not possible) - can be - is a single if nuts can cover the trip only there and also the cart has enough capacity for it
    if (remaining_nuts - (single_trip * consumed_per_km)) > 0 && (single_trip * consumed_per_km) < cart_capacity
      last_trip_nuts = cart_capacity < remaining_nuts ? cart_capacity - (single_trip * consumed_per_km) : remaining_nuts - (single_trip * consumed_per_km)
      delivered_nuts += last_trip_nuts
    end

    @delivered_nuts = delivered_nuts

  end
end
