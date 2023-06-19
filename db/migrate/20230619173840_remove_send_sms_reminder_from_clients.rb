class RemoveSendSmsReminderFromClients < ActiveRecord::Migration[7.0]
  def change
    remove_column :clients, :send_sms_reminder, :boolean
  end
end
