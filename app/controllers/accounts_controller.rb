class AccountsController < ApplicationController
    before_action :set_Account, only: %i[ show update destroy ]
  
    # GET /Accounts
    def index
      @Accounts = Account.all
  
      render json: @Accounts
    end
  
    # GET /Accounts/1
    def show
      render json: @Account
    end
  
    # POST /Accounts
    def create
      @Account = Account.new(Account_params)
  
      if @Account.save
        render json: @Account, status: :created, location: @Account
      else
        render json: @Account.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /Accounts/1
    def update
      if @Account.update(Account_params)
        render json: @Account
      else
        render json: @Account.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /Accounts/1
    def destroy
      @Account.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_Account
        @Account = Account.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def Account_params
        params.require(:Account).permit(:name, :relationship)
      end
  end