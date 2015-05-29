if !@current_journal.nil? && @current_journal.send_to_owner
  owner_email = @issue.custom_field_value( CustomField.find_by_name('owner-email') )
  raise WorkflowError, "It's impossible to send an email to nobody! Specify the owner's email or uncheck the flag 'Send mail to supportclient'" if owner_email.blank?
end
