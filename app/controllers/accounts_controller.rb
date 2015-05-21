class AccountsController < ApplicationController
  layout '_form_public', only: [:new, :show, :create, :edit]
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json 
  def index
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
    @btn_edit = "Edit"
  end

  # POST /accounts
  # POST /accounts.json
  def create
          # return false
    @account = Account.new(account_params)
    accounts = Account.find_by(email: account_params[:email], is_delete: '0')

    if params[:account][:password] != params[:account][:password_confirm]
      @msg_confirm = 'Password does not match!'
      render 'new'
    else
      if accounts.present?
        redirect_to new_account_path, notice:'E-mail does not exist!'
      else
        respond_to do |format|
          @account.is_delete = '0'
          if @account.save
            @acc = Account.find_by(email: account_params[:email])
            SendMailer.user_email(@acc).deliver
            format.html { redirect_to root_path }
            format.json { render :show, status: :created, location: @account }
          else  
            format.html { render :new }
            format.json { render json: @account.errors, status: :unprocessable_entity }
          end
        end
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def account_params
    params.require(:account).permit(:email, :password, :role, :full_name, :tel, :birthday, :address, :gender, :image)
  end
end
