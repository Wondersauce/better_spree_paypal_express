# hacking this here so that the Spree Refund#process! method doesn't choke.
# snippet from #process! below:
# text = response.params['message'] || response.params['response_reason_text'] || response.message
module PayPalErrorHandling
  def message
    self.errors.collect{ |e| e.long_message }.join(",")
  end

  def params
    { 'message' => message }
  end
end
