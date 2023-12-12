# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Users
first_user = User.create(name: 'Anyars Yussif')
second_user = User.create(name: 'Yussif Gariba')
third_user = User.create(name: 'Gariba Sayibu')
fourth_user = User.create(name: 'Salamatu Issahaku')
fifth_user = User.create(name: 'Issahaku Ibrahim')

# Categories
first_category = Category.create(name:'Food', icon: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_vg9N3PlcJAjOIowhHKo5ePNJrXAmWC_7Iw&usqp=CAU', user_id: first_user.id)
second_category = Category.create(name:'Electricity', icon: 'data:image/png;base64,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', user_id: second_user.id)

third_category = Category.create(name:'Rent', icon: 'data:image/png;base64,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', user_id: third_user.id)

fourth_category = Category.create(name:'Car Maintenance', icon: 'data:image/png;base64,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', user_id: fourth_user.id)

fifth_category = Category.create(name:'Groceries', icon: 'https://cdn-icons-png.flaticon.com/512/1198/1198284.png', user_id: fifth_user.id)

# Expenses
first_expense = Expense.create(name: 'first expense', amount: 250, author_id: first_user.id, category_id: first_category.id)
second_expense = Expense.create(name: 'second expense', amount: 150, author_id: second_user.id, category_id: second_category.id)
third_expense = Expense.create(name: 'third expense', amount: 50, author_id: third_user.id, category_id: third_category.id)
fourth_expense = Expense.create(name: 'fourth expense', amount: 300, author_id: fourth_user.id, category_id: fourth_category.id)
fifth_expense = Expense.create(name: 'fifth expense', amount: 140, author_id: fifth_user.id, category_id: fifth_category.id)
sixth_expense = Expense.create(name: 'sixth expense', amount: 98, author_id: first_user.id, category_id: first_category.id)