require 'date'

class Bank 

  attr_reader :balance, :statement

  def initialize
    @balance = 0.0
    @statement = []
  end

  def date()
    Date.today.strftime('%Y-%m-%d')
  end

  def deposit(amount)
    @statement.push([date(), amount.to_f, nil , @balance += amount])
  end

  def withdraw(amount)
    @statement.push([date(), nil, amount.to_f , @balance -= amount])
  end

  def view_statement
    puts 'date || credit || debit || balance'
    @statement.reverse.each { |action| 
      puts action.join(' || ')
    }
  end
  
end
