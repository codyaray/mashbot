Given /^there is a standard campaign$/ do
  Campaign.create!({
                     :title => 'Amazing Campaign',
                     :start_date => '01/15/2100',
                     :end_date => '02/14/2100'
                   })
end

Given /^there is a[n]? "([^\"]*)" with the following:$/ do |model, table|
  attributes = attributize_cuke_table table
  model.constantize.create!(attributes)
end

Then /^there should be a[n]? "([^\"]*)" with the following:$/ do |model, table|
  conditions = conditionize_cuke_table table
  assert_not_nil model.constantize.last :conditions => conditions  
end

## helper

def attributize_cuke_table table
  conditions = table.rows_hash
  conditions.keys.each do |key|
    value = conditions[key]
    if value.match /last/
      conditions[key] = last_match value, key
    end
  end
  conditions
end

def conditionize_cuke_table table
  conditions = table.rows_hash
  conditions.keys.each do |key|
    value = conditions[key]
    if conditions[key] == "true"
      conditions[key] = true
    elsif conditions[key] == "false"
      conditions[key] = false
    elsif value.match /last/
      conditions[key] = last_match value, key
    end
  end
  conditions
end

def last_match value, key
  tmp = value.gsub(/last/, '')
  model_name = (tmp.empty?)? key.gsub(/_id/, '') : tmp
  begin
    id = model_name.classify.constantize.last.id
  rescue
    raise "Make sure you are not using \"last\" as part of the value for #{key} if you do not intend to look up the last #{tmp}'s id.  If you did want the last #{tmp}, make sure that model exists, and that you've spelled it properly."
  end
end
