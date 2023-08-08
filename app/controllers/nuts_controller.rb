class NutsController < ApplicationController

  require 'csv'

  def index

  end

  def manual_read

  end

  def compute_manual_read
    @distance = params[:distance].to_f
    @nuts = params[:nuts].to_f
    @consumed_per_km = params[:consumed_per_km].to_f
    @cart_capacity = params[:cart_capacity].to_f

    @result = max_deliverable_nuts_calculation(@distance, @nuts, @consumed_per_km, @cart_capacity)
  end

  def file_read

  end

  def compute_file_read
    result = []

    if params[:file_input].present?

      file = params[:file_input].read

      file.each_line do |line|
        params = line.chomp.split(',').map(&:to_f)
        distance, nuts, consumed_per_km, cart_capacity = params

        max_nuts_transportable = max_deliverable_nuts_calculation(distance, nuts, consumed_per_km, cart_capacity)
        row_result = {:incoming_data => [distance, nuts, consumed_per_km, cart_capacity], :result => max_nuts_transportable}
        result << row_result
      end

      @result = result
    end
  end

  private

  def max_deliverable_nuts_calculation(distance, nuts, consumed_per_km, cart_capacity)
    NutsTransporterCalculator.new(distance, nuts, consumed_per_km, cart_capacity).compute_maximum_nuts
  end

end
