class Transfer
  
  attr_reader :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount 
  end 

  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if @sender.balance < @amount || @status == "closed"
      return "Transaction rejected. Please check your account balance."
    elsif @status != "closed" && @status == "pending" && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    elsif @sender.balance < @amount
      "Transaction rejected. Please check your account balance."
    end 
  end 
  
end
