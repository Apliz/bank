require 'bank'
require 'date'

RSpec.describe Bank do
  
  it 'should have a bank object' do
    expect(subject).to be_kind_of(Bank)
  end

  it 'should a balance variable' do
    expect(subject.balance).to eq(0.00)
    expect(subject.balance).to be_kind_of(Float)
  end

  it 'balance change by 30 when 30 deposited' do
    expect{subject.deposit(30)}.to change{subject.balance}.by(30)
  end

  it 'balance changes by 30 when 30 withdrawn' do
    expect{subject.withdraw(30)}.to change{subject.balance}.by(-30)
  end

  it 'should generate a date-stamp for each action' do
    expect(subject.date).to eq(Date.strptime(Date.today.to_s, '%Y-%m-%d').to_s)
  end

  context 'action data formatting' do
    it 'should store data in form: date, credit, debit, balance' do
      expect{ subject.deposit(30) }.to change{subject.statement.first}.to([Date.strptime(Date.today.to_s, '%Y-%m-%d').to_s, 30, nil, 30.0])
    end

    it 'withdraw should not include credit data' do
      expect(subject.withdraw(30).first[1]).to eq(nil)
    end

    it 'deposit should not include debit data' do
      expect(subject.deposit(30).first[2]).to eq(nil)
    end
  end

  context 'statement' do
    it 'returns a row per previous action' do
      subject.deposit(30)
      expect{ subject.view_statement }.to output("date || credit || debit || balance\n#{Date.today.strftime('%Y-%m-%d')} || 30.0 ||  || 30.0\n").to_stdout
    end
  end

end