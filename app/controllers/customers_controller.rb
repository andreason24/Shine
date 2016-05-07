class CustomersController < ApplicationController
  def index
    if params[:keywords].present?
      @keywords = params[:keywords]
      customer_search_term = CustomerSearchTerm.new(@keywords)
      # binding.pry
      @customers = Customer.where(
          customer_search_term.where_clause,
          customer_search_term.where_args).
          order(customer_search_term.order).
          limit(20)

    else
      @customers = Customer.first 10
    end
  end
end