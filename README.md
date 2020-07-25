# Bank

IRB CL practice tool to mimic a simple bank ATM

## Usage

>Launch IRB

```bash
>$ irb
```

>Require and specify

```bash
2.7.0 :001 > require './lib/bank.rb'
bank = Bank.new
```

>Can deposit and withdraw

```ruby
bank.deposit(float)
bank.withdraw(float)
```

>Can view transactions

``` ruby
bank.view_statement()

# date || credit || debit || balance
# 14/01/2012 || || 500.00 || 2500.00
# 13/01/2012 || 2000.00 || || 3000.00
#1 10/01/2012 || 1000.00 || || 1000.00
```

---

## User Stories

As a User,  
So that I can store my hard earned money,  
I would like to be able make deposits.  
\
As a User,  
So that I can use my credit,  
I would like to be able to make withdrawals.  
\
As a User,  
So that I can keep track keep good records.  
I would like to store each date for each interaction.  
\
As a User,  
So that I can manage my finaces.  
I would like to be able to print my banks statement to the screen.
