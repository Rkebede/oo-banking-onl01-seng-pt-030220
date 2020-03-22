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
    if @sender.balance > @amount && valid?
      if @status == "pending"
       @sender.balance -= @amount
       @receiver.balance += @amount
       @status = "complete"
     end 
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end 

  
end
