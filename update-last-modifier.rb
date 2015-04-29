#/usr/bin/ruby
def update_custom_fields(issue, fields)

    f_id = Hash.new { |hash, key| hash[key] = nil }
    issue.available_custom_fields.each_with_index.map { |f,indx| f_id[f.name] = f.id }
    field_list = []
    fields.each do |name, value|
      field_id = f_id[name].to_s
      field_list << Hash[field_id, value]
    end
    issue.custom_field_values = field_list.reduce({},:merge)
end

begin
user_id = @current_journal.user_id
rescue
user_id = ''
end

#no journal - this is a creation
if user_id == ''
begin
user_id = @issue.author_id
rescue
user_id = ''
end
end

fields = {"last_modifier" => user_id.to_s}

#raise WorkflowError, "!!! 1) " + user.to_yaml
#raise WorkflowError, "!!! 1) " + @issue.to_yaml

update_custom_fields(@issue, fields)
#raise WorkflowError, "!!! 1) " + fields.to_s + "!!! 1a) " + "!!! 2) " + " available fields \n" + @issue.available_custom_fields.to_s + "!!! 3) " + @issue.custom_field_values.to_s + "!!! 4) " + @issue.available_custom_fields.each_with_index.to_s

