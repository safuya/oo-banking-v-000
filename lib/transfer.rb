class Transfer
  attr_reader :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def transfer_valid?
    @sender.balance - @amount > 0
  end

  def execute_transaction
    if transfer_valid?
      @sender.withdraw(@amount) unless @status == 'complete'
      @receiver.deposit(@amount) unless @status == 'complete'
      @status = 'complete'
    else
      @status == 'rejected'
      binding.pry
      "Transaction rejected. Please check your account balance."
    end
  end

end
