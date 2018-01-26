def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
    return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, amount)
  pet_shop[:admin][:pets_sold] += amount
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

# could REFACTOR
def pets_by_breed(pet_shop, breed)
  pets_of_breed = [] # initialize variable to put pets in
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      pets_of_breed.push(pet)
    end
  end
  return pets_of_breed
end

def find_pet_by_name(pet_shop, name)
  the_pet = nil
  for pet in pet_shop[:pets]
    if pet[:name] == name
      the_pet = pet
    end
  end
  return the_pet
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end

def customer_can_afford_pet(customer, pet)
  customer[:cash] >= pet[:price]
end

def sell_pet_to_customer(pet_shop, pet_to_sell, customer)
  # Can only sell the pet if certain conditions are met
  # - the pet is in stock
  # - the customer can afford it
  for pet in pet_shop[:pets]
    # check the conditions
    if pet == pet_to_sell && customer[:cash] >= pet[:price]
      # add the pet to the customers pets
      customer[:pets].push(pet_to_sell)
      # increase the number of pets sold
      pet_shop[:admin][:pets_sold] += 1
      # recalculate the shops total cash
      pet_shop[:admin][:total_cash] += pet_to_sell[:price]
      # if conditions not met, do nothing
    end
  end
end
