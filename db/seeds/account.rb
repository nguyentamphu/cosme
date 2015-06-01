config = YAML.load_file Rails.root.join('db/data/accounts.yml')

ActiveRecord::Base.transaction do
  config.each do |attr|
    id = attr.delete('id')

    # attr['start_at'] = Time.at(attr['start_at']).to_datetime
    # attr['end_at'] = Time.at(attr['end_at']).to_datetime

    account = Account.find_by_id id
    if account
      account.update_attributes! attr
    else
      account = Account.create! attr
    end
  end
end