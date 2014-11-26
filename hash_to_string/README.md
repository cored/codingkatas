Complete the solution so that it returns a String in the format:

"Key (Value), Key (Value)"

From a hash for values within the given range, sorted by value lowest to
highest.

For example:

```ruby
food = {
  "Hamburger"=>1.99,
  "Cheese"=>0.99,
  "Steak"=>4.99,
  "Lobster"=>7.99,
  "Fries"=>1.49,
  "Sandwich"=>2.49
}
```

```ruby
list_in_range(food, (0.99, 1.99)) # should return "Cheese (0.99),
  Fries (1.49), Hamburger (1.99)"
 ```

