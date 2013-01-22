class NotificationsController < ApplicationController
  # PUT /notifications/1
  # PUT /notifications/1.json
  def update
    @notification = Notification.find(params[:id])

    respond_to do |format|
      if @notification.update_attributes(:seen => params[:seen])
        format.json { head :no_content }
      else
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end
end