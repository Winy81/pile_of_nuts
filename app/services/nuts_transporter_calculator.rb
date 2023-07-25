class NutsTransporterCalculator

  #def self.compute_maximum_nuts(distance, nuts, consumed_per_km, cart_capacity)

    ## Calculate the maximum distance the horse can travel with the current nuts in the cart
    #max_distance = (nuts / consumed_per_km).to_f
    #max_distance_on_each_way = (cart_capacity / consumed_per_km).to_f
    #
    ## Return 0 if have not enough nuts or not enough capacity for feeding for a deliver
    #return 0 if (max_distance < distance) || (max_distance_on_each_way < distance)
    #
    ## Calculate the number of trips needed to transport all nuts to the town
    #num_trips = (nuts / cart_capacity.to_f).floor
    #
    ## Calculate the total distance traveled by the horse during all trips
    #total_distance = distance * num_trips
    #
    ## Calculate the number of nuts what we will deliver on the calculated journeys and reduce with cost (ate nuts on the delivery)
    #max_nuts = (num_trips * cart_capacity) - (total_distance * consumed_per_km)
    #
    ## Return the value, if they would eat more than on the cart just return with 0
    ## Alternative way
    ## max_nuts.to_f > 0 ? max_nuts.to_f : 0
    #
    #return max_nuts
  #end

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
