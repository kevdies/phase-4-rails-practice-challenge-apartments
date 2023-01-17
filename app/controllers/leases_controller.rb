class LeasesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: not_found_message
rescue_from ActiveRecord::RecordInvalid, with: invalid_record

    def create
        lease = Lease.create!(lease_params)
        render json: lease, status: :created
    end

    def delete
        lease = find_lease
        lease.destroy
        head :no_conten
    end

    private

    def invalid_record(invalid)
        render json: {error: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def lease_params
        params.permit(:rent)
    end

    def find_lease
        lease = Lease.find(params[:id])
    end

    def not_found_message
        render json: {error: "Lease not found"}
    end
end
