# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :list_clean do
    date "2014-02-07"
    source "MyString"
    upload_by "MyString"
    file_name "MyText"
    selection_query "MyString"
    cleaned_by "MyString"
    clean_date "2014-02-07"
    no_of_records 1
    no_of_good 1
    qa_by "MyString"
    qa_date "2014-02-07"
    qa_notes "MyText"
  end
end
