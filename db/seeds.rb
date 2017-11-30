# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Sudo Administrator
Span::Administrator.create(
  name: "John",
  surname: "Doe",
  email: "accounts@lim9.com",
  username: "sudo",
  password: "password",
  password_confirmation: "password",
  sudo: true
)

# Webmaster Administrator
Span::Administrator.create(
  name: "John",
  surname: "Doe",
  email: "admin@domain.com",
  username: "webmaster",
  password: "password",
  password_confirmation: "password",
  sudo: false
)

# Settings
Span::Setting.create(
  seo_title: "Sem Ullamcorper Commodo",
  seo_description: "Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.",
  seo_tags: "Magna, Consectetur, Nullam, Vehicula, Fringilla"
)

# Biography
Span::Biography.create(
  title: "Amet Vulputate Pharetra Tortor Dapibus",
  description: "Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.",
  body: "Aenean lacinia bibendum nulla sed consectetur.",
  seo_title: "",
  seo_description: "",
  seo_tags: ""
)

# Timeline Settings
Span::TimelineSetting.create(
  seo_title: "",
  seo_description: "",
  seo_tags: ""
)

# Contact Settings
Span::ContactSetting.create(
  seo_title: "",
  seo_description: "",
  seo_tags: ""
)

# Service Settings
Span::ServiceSetting.create(
  seo_title: "",
  seo_description: "",
  seo_tags: ""
)
