class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.amount < self.sender.balance
      if self.status == "pending"
      self.sender.balance -= @amount 
      self.receiver.balance += @amount
      self.sender.balance
      self.receiver.balance
      self.status = "complete"
      puts "#{status}"
      else
      "rejected"
      end
    else
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
    self.sender.balance += self.amount
    self.receiver.balance -= self.amount
    self.status = "reversed"
    self.sender.balance
    self.receiver.balance
    end
  end


end
