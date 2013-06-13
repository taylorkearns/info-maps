ActiveAdmin.register Country do
  config.sort_order = 'name_asc'

  index do
    column :region_id do |country|
      Region.find_by_id(country.region_id).name
    end
    column :name
    column :capital
    column :population do |country|
      number_with_delimiter country.population
    end

    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :capital
      f.input :population
      f.input :region_id, as: :select, collection: Region.all, member_label: :name, member_value: :id
    end

    f.actions
  end

  show do |country|
    attributes_table do
      row :name
      row :capital
      row :population do
        number_with_delimiter country.population
      end
      row :region do
        Region.find_by_id(country.region_id).name
      end
    end

    active_admin_comments
  end
end
