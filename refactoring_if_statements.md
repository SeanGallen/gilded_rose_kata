Examples of refactoring if statements
=====================================

## Move code around an if statement

before

```ruby
if a < 100
  a += 1
end
a -= 1
```

after

```ruby
a -= 1
if a < 99
  a += 1
end
```

## Move code into an if statement

v1

```ruby
a -= 1
if 0 < a
  a += 1
else
  a += 2
end
```

v2

```ruby
if 1 < a # <-- had to update the conditional
  a -= 1
  a += 1
else
  a -= 1
  a += 2
end
```

v3

```ruby
if 1 < a
  # no op
else
  a += 1
end
```

v4

```ruby
if 1 >= a
  a += 1
end
```

v5

```ruby
a += 1 if 1 >= a
```

v6

```ruby
a += 1 if a <= 1
```


## If both sides are the same, you can remove an if statement

before

```ruby
if 0 < a
  a += 1
else
  a += 1
end
```

after

```ruby
a += 1
```

## Invert nested if statements

before

```ruby
if a < 1
  if b < 1
    b += 1
  else
    b += 2
  end
end
```

after

```ruby
if b < 1
  if a < 1
    b += 1
  end
else
  if a < 1
    b += 2
  end
end
```

## Consolidate conditions to remove nesting

before

```ruby
if a < 1
  if b < 1
    b += 1
  else
    b += 2
  end
end
```

after

```ruby
if a < 1 && b < 1
  b += 1
elsif a < 1
  b += 2
end
```

## Consolidate two independent if statements

before

```ruby
if a < 1
  b += 1
end

if a < 5
  c += 1
end
```

after

```ruby
if a < 1
  b += 1
elsif a < 5
  c += 1
end
```

## Consolidate two dependent if statements

v1

```ruby
if a < 1
  b += 1
end

if a < 5
  b += 1
end
```

v2

```ruby
if a < 1
  b += 1
  b += 1
elsif a < 5
  b += 1
end
```

v3

```ruby
if a < 1
  b += 2
elsif a < 5
  b += 1
end
```

## Consolidate if statements that cover all the possibilities

before

```ruby
if a < 0
  b += 1
end

if 0 <= a
  b -= 1
end
```

after

```ruby
if a < 0
  b += 1
else
  b -= 1
end
```
