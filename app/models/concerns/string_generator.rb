# app/model/concerns/string_generator.rb

module StringGenerator
  extend ActiveSupport::Concern
  # Slug Algorithm
  def generate_random_slug(size = 8)
    charset = %w(n 1 u 2 m 3 e 4 r 5 o 6 l 7 o 8 g 9 y 0)
    (0...size).map { charset.to_a[rand(charset.size)] }.join
  end

  # String Generator
  def generate_slug
    self.slug = generate_random_slug
  end

  # Username Algorithm
  def generate_random_username(size = 8)
    charset = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
    (0...size).map { charset.to_a[rand(charset.size)] }.join
  end

  # Username Generator
  def generate_username
    self.username = generate_random_username
  end

  # Password Algorithm
  def generate_random_password(size = 8)
    charset = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0 ! # $ % & = ? * +)
    (0...size).map { charset.to_a[rand(charset.size)] }.join
  end

  # Password Generator
  def generate_password
    self.password = generate_random_password
  end
end
