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
    if @sender.balance < @amount 
      @status = "Transaction rejected. Please check your account balance."
    end 
    # if @status == "pending" && @sender.balance > @amount
    #   @sender.balance -= @amount
    #   @receiver.balance += @amount
    #   @status = "complete"
    # end 
  end 
  
end
