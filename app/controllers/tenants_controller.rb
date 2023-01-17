class TenantsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: invalid_record
    rescue_from ActiveRecord::RecordNotFound, with: record_not_found

    def index
        tenant = Tenant.all
        render json: tenant
    end

    def show
        tenant = find_tenant
        render json: tenant
    end

    def create
        tenant = Tenant.create!(tenant_params)
        render json: tenant
    end

    def update
        tenant = Tenant.update!(tenant_params)
        render json: tenant
    end

    def destroy
        tenant = find_tenant
        tenant.destroy
        head :no_content
    end

    private

    def tenant_params
        params.permit(:name, :age)
    end

    def find_tenant
        find_tenant = Tenant.find(params[:id])
    end

    def invalid_record(invalid)
        render json: { error: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def not_found
        render json: { error: 'Not Found' }, status: :not_found
    end
end
