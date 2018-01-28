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

  def execute_transaction
    @sender.withdraw(@amount) unless @status == 'complete'
    @receiver.deposit(@amount) unless @status == 'complete'
    @status = 'complete'
  end

end
