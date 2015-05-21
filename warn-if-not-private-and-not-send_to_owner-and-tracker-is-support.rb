@signal_label = "[This label will be removed during the next submitting. Do not delete or modify it manually!]\r"
need_warning = false
if !@current_journal.nil?
  if !@current_journal.notes.include?(@signal_label) && !@current_journal.notes.empty? && !@current_journal.private_notes && !@current_journal.send_to_owner && @issue.tracker_id == 3
    need_warning = true
    @current_journal.notes = @signal_label + @current_journal.notes
  else
    need_warning = false
    @current_journal.notes.sub!(@signal_label, '') 
  end
end

if need_warning
  raise WorkflowError, "Warning: your note is not market as private and it will not be sent to the supportclient. However the tracker is Support. If you are sure that all is OK just submit the note again. To prevent such warnings in future you may mark notes as private."
end  
