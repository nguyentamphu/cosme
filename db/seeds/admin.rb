config = YAML.load_file Rails.root.join('db/data/admins.yml')

ActiveRecord::Base.transaction do
  config.each do |attr|
    id = attr.delete('id')

    # attr['start_at'] = Time.at(attr['start_at']).to_datetime
    # attr['end_at'] = Time.at(attr['end_at']).to_datetime

    admin = Admin.find_by_id id
    if admin
      admin.update_attributes! attr
    else
      admin = Admin.create! attr
    end
  end
end