class MotdWidget < Apotomo::Widget
  def display
    @message = "<strong>Sprint Focus:</strong> Get everyone on the Inventor Publisher bus"
    render
  end
end
