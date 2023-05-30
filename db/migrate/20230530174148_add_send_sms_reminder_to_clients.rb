class AddSendSmsReminderToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :send_sms_reminder, :boolean
  end
end
