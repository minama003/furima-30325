FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"a000000"}
    password_confirmation {password}
    first_name            {"ひらがな"}
    last_name             {"ひらがな"}
    first_name_reading    {"カタカナ"}
    last_name_reading     {"カタカナ"}
    birthday              {"1993-01-01"}
  end
end