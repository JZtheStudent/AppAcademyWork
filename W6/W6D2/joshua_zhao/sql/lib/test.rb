# == Schema Information
#
# Table name: cats
#
#  id          :integer      not null, primary key
#  name        :string
#  color       :string
#  breed       :string
#
# Table name: toys
#
#  id          :integer      not null, primary key
#  name        :string
#  color       :string
#  price       :integer
#
# Table name: cat_toys
#
#  id          :integer      not null, primary key
#  cat_id      :integer      not null, foriegn key
#  toy_id      :integer      not null, foreign key

require_relative '../data/pg_helper.rb'

def freyja
  # Find the names of all the cats that are the same color as the cat named 
  # `Freyja`.
  # Do not include `Freyja` in the results.
  # Sort by cat name alphabetically.

  execute(<<-SQL)
    SELECT cats_1.name
    FROM cats as cats_1
    WHERE
      cats_1.color = (
        SELECT cats_2.color
        FROM cats as cats_2
        WHERE cats_2.name = 'Freyja'
      )
      AND cats_1.name != 'Freyja'
    ORDER BY cats_1.name;

  SQL
end


def find_unknown
  # Find all the toys names that belong to the cat who's breed is `Unknown`.
  # Only return the toys that have more than one word in the name.
  # Order from the most expensive to least.

  execute(<<-SQL)
   SELECT toys.name
   FROM toys
   JOIN cat_toys ON cat_toys.toy_id = toys.id
   JOIN cats ON cat_toys.cat_id = cats.id
   WHERE cats.breed = 'Unknown' AND toys.name LIKE '% %'
   ORDER BY toys.price DESC;
  SQL
end

def five_cheap_toys
  # Find the name and prices for the five cheapest toys.
  # Order by toy price from most expensive to least.

  execute(<<-SQL)
    SELECT toys_1.name, toys_1.price
    FROM toys as toys_1
    WHERE toys_1.id IN (
      SELECT toys_2.id
      FROM toys as toys_2
      ORDER BY toys_2.price
      LIMIT 5
    )
    ORDER BY toys_1.price DESC;

  SQL
end

def rich_crypto_cats
  # `Bitcoin Cash` became a really popular toy sold at different prices.
  # Find the lowest price of the toy `Bitcoin Cash`.
  # List the names of the cats who acquired the toy at its lowest price.
  # Order by the cat name alphabetically.

  execute(<<-SQL)
    SELECT cats.name
    FROM cats
    JOIN cat_toys ON cat_toys.cat_id = cats.id
    JOIN toys AS toys_1 ON cat_toys.toy_id = toys_1.id
    WHERE toys_1.name = 'Bitcoin Cash' AND toys_1.price = (
      SELECT toys_2.price
      FROM toys as toys_2
      WHERE toys_2.name = 'Bitcoin Cash'
      ORDER BY toys_2.price
      LIMIT 1
    )
    ORDER BY cats.name;
  SQL
end

def toy_that_jet_owns
  # Find the most expensive toy that is owned by the cat named `Jet`.
  # Find the cats that own toys of the same name.
  # List the name of the cat and the name of the toy.
  # Exclude Jet from the results.
  # Order by cat name alphabetically.

  execute(<<-SQL)
    SELECT cats_1.name, toys_1.name
    FROM cats as cats_1
    JOIN cat_toys as cat_toys_1 ON cat_toys_1.cat_id = cats_1.id
    JOIN toys as toys_1 ON cat_toys_1.toy_id = toys_1.id
    WHERE cats_1.name != 'Jet' AND toys_1.name = (
      SELECT toys_2.name
      FROM toys as toys_2
      JOIN cat_toys as cat_toys_2 ON cat_toys_2.toy_id = toys_2.id
      JOIN cats as cats_2 ON cat_toys_2.cat_id = cats_2.id
      WHERE cats_2.name = 'Jet'
      ORDER BY toys_2.price DESC
      LIMIT 1
    )
    ORDER BY cats_1.name;
  SQL
end