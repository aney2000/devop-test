# frozen_string_literal: true

class StatusController < ApplicationController
  def show
    ActiveRecord::Base.connection.execute('SELECT 1')
    render json: { status: 'ok', database: 'connected' }
  rescue StandardError => e
    render json: { status: 'error', database: e.message }, status: :service_unavailable
  end
end
