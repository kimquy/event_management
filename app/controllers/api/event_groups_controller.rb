module API
  class EventGroupsController < ApplicationController
    before_action :find_event_group, except: [:index, :create]

    def index
      render json: EventGroup.all
    end

    def show
      render json: @event_group
    end

    def create
      event_group = EventGroup.new(event_group_params)
      if event_group.save
        render json: event_group, status: :created
      else
        render json: event_group.errors.messages, status: :unprocessable_entity
      end
    end

    def update
      if @event_group.update(event_group_params)
        render json: @event_group, status: :accepted
      else
        render json: @event_group.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      @event_group.destroy
      head :ok
    end

    private

    def event_group_params
      params.require(:event_group).permit(
        :name, :description, :location, :status, :start_time, :end_time
      )
    end

    def find_event_group
      @event_group ||= EventGroup.find_by_id(params[:id])
      head :no_content unless @event_group
    end
  end
end
