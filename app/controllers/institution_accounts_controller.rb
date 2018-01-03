class InstitutionAccountsController < ApplicationController  
  include InstitutionAccountHelper
  before_action :authenticate_user!

  def index
  end

  def add_subscription_tag
    SubscriptionInstitute.create!(subscription_id: params[:subscription_id], institution_account_id: params[:institute_account_id])
    flash[:notice] = 'Subscription are sucessfully created for innstitution!'
    redirect_to institution_accounts_path
  end

  def search 
    @institution_account = InstitutionAccount.filter(params.slice(:publisher_id, 
            :status, :library_name, :institution_name, :id))
    @id = @institution_account.ids
    @institution_billing = InstitutionAccountBillingAddress.filter(params.slice(:first_name, :last_name,
                  :phone, :email,:address,:address_line2,:address_line3,:city,:state,
                  :postal_code,:country_code))
    @result = @institution_billing.where(institution_account_id: @id).paginate(:page => params[:page], :per_page => 5)
    
    # this is the params of the checkbox that is present in the form.
    @check = params[:ip_address]
    respond_to do |format|
      format.js 
      format.html
      format.xlsx
     end
  end

  def institution_admin_result
    @institution = InstitutionAccount.find_by_id(params[:id]).institution_name
    @institution_admin = InstitutionAdminUserAccount.where(:institution_name => @institution)
    respond_to do |format|
      format.html   
      format.xlsx { send_data @institution_admin }
    end
  end 

  def new
    @publishers = Publisher.all
    @institution = InstitutionAccount.new()
    #this is added inorder to build institution_acc_billing_address
    #we use this syntax because the association between institution account
    # and institution_acc_billing_address is has_one
    @institution.build_institution_account_billing_address
    @institution.ip_addresses.build
  end

  def create
    @institution = InstitutionAccount.create(institution_params)
    if @institution.save!
      ip_save_for_institute
      redirect_to institution_accounts_path
    else
      render 'new'
    end
  end

  def add_subscription
    @institute_account = InstitutionAccount.find_by_id(params[:id]) 
  end
 
  def edit
    @institution = InstitutionAccount.find_by_id(params[:id]) 
  end

  def update
    @institution = InstitutionAccount.find(params[:id])
    if @institution.update(institution_params)  
      redirect_to institution_accounts_path
    else
      render 'index'
    end
  end

  def import_for_institution_accounts
    #  In this method,we get the entire Excel file in params.
    # in params[:file], we get the path of the excel file.
    spreadsheet = open_spreadsheet(params[:file])
    header = spreadsheet.row(1)
    # we fetch first row elements( that act as column names of table) in header
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      # we get excel's row elements(that are attributes of table) in header
      # and in spreadsheet.row(i) we get data for record
      # here we transpose inorder to map each column and data for record insertion
      @institutions = InstitutionAccount.new
      @institutions.attributes = row.to_hash.slice(*row.to_hash.keys)
      @institutions.save!
    end
    redirect_to :back
  end

  def import_for_institution_accounts_billing
    #  In this method,we get the entire Excel file in params.
    # in params[:file], we get the path of the excel file.
    spreadsheet = open_spreadsheet(params[:file])
    header = spreadsheet.row(1)
    # we fetch first row elements( that act as column names of table) in header
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      # we get excel's row elements(that are attributes of table) in header
      # and in spreadsheet.row(i) we get data for record
      # here we transpose inorder to map each column and data for record insertion
      @institutionbillings = InstitutionAccountBillingAddress.new
      @institutionbillings.attributes = row.to_hash.slice(*row.to_hash.keys)
      @institutionbillings.save!
    end
    redirect_to :back
  end

  def import_for_ip_address
    #  In this method,we get the entire Excel file in params.
    # in params[:file], we get the path of the excel file.
    spreadsheet = open_spreadsheet(params[:file])
    header = spreadsheet.row(1)
    # we fetch first row elements( that act as column names of table) in header
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      # we get excel's row elements(that are attributes of table) in header
      # and in spreadsheet.row(i) we get data for record
      # here we transpose inorder to map each column and data for record insertion
      @ipaddresses = IpAddress.new
      @ipaddresses.attributes = row.to_hash.slice(*row.to_hash.keys)
      @ipaddresses.save!
    end
    redirect_to :back
  end

  def open_spreadsheet(file)
     #  the details of Excel sheet are holded in file
    case File.extname(file.original_filename)
      # in file.original_filename, we get the name of the excel sheet.
      #  the File.extname is a method that is used to fetch the extension 
      # of file
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Spreadsheet.open(file.path, extension: :xls)
     # in file.path,we get the path in which the excel sheet is stored
     # Roo:Spreadsheet.open(file.path, extension: :xls) helps us to open the 
     # Excel Spreadsheet
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  private

  def institution_params
    params.require(:institution_account).permit(:publisher_id,:institution_id, 
      :library_name,:institution_name,:status,:display_name, :logo, 
      institution_account_billing_address_attributes: [ :id,
      :first_name, :last_name, :phone, :email, :address, 
      :address_line2,:address_line3, :city, :state, 
      :postal_code, :country_code, :comments, :institution_account_id],
      ips_attributes: [:low_ip, :high_ip],
      users_attributes: [:email, :password])
  end

  def ip_save_for_institute
    ip_store = params["institution_account"]["ip_addresses_attributes"]["0"]
    params["institution_account"]["ip_addresses_attributes"].values.each do |ip_range|
      if ip_range[:low_ip].present? && ip_range[:low_ip].present? 
        institution_id = @institution.id
        lw_ip = IPAddr.new(ip_range[:low_ip]).to_i 
        hg_ip = IPAddr.new(ip_range[:high_ip]).to_i 
          IpAddress.create!(low_ip: lw_ip, high_ip: hg_ip, institution_account_id: institution_id) 
      end
    end
  end
end

 


