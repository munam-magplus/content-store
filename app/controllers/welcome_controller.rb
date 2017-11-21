class WelcomeController < ApplicationController
  def new
  end

  def index
  	@institute_name = InstitutionAccount.last
  end
end
