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
    if @status == "pending" && @sender.balance >= @amount
       @sender.balance -= @amount
       @receiver.balance += @amount
       @status = "complete"
    elsif @sender.balance < @amount
        "sfssf"
    end
  end 

  
end
