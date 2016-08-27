module API
  class GroupEventsController < ApplicationController
    before_action :find_group_event, except: [:index, :create]

    def index
      render json: EventGroup.all
    end

    def show
      render json: @group_event
    end

    private

    def find_group_event
      @group_event ||= EventGroup.find_by_id(params[:id])
      render :json, nothing: true, status: 404 unless @group_event
    end
  end
end
