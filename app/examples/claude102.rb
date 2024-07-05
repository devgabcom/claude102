class Claude102
  def self.examples
    claude = AiAgent.new.claude
    message = "Explain the difference between a Cavoodle and a Cavapoodle"

    # specifying an exact model to use
    response = claude.messages(
      claude.user_message(message),
      { model: 'claude-3-haiku-20240307' })
    y AiAgent.new.format_claude_response(response)

    # using a pre-defined model constant
    response = claude.messages(
      claude.user_message(message),
      { model: Claude::Client::MODEL_CLAUDE_SMARTEST })
    y AiAgent.new.format_claude_response(response)

    # specifying a different temperature to use
    response = claude.messages(
      claude.user_message(message),
      { temperature: 0.0 })
    y AiAgent.new.format_claude_response(response)

    # specifying max_tokens
    response = claude.messages(
      claude.user_message(message),
      { max_tokens: 50 })
    y AiAgent.new.format_claude_response(response)

    # conversations
    system_message = "You are a helpful assistant."
    messages = [
      {"role": "user", "content": "Hello there."},
      {"role": "assistant", "content": "Hi, I'm Claude. How can I help you?"},
      {"role": "user", "content": "Can you explain LLMs in plain English?"},
    ]
    response = claude.messages(
      messages,{ system: system_message })
    y AiAgent.new.format_claude_response(response)

    # conversations with system message
    system_message = "You are a grumpy unhelpful assistant."
    response = claude.messages(
      messages,{ system: system_message })
    y AiAgent.new.format_claude_response(response)

    # partially-filled response
    messages = [
      {"role": "user", "content": "Which wine goes best with steak? (A) Sauvignon blanc (B) Cabernet sauvignon (C) Pinot noir, (D) Pinot blanc"},
      {"role": "assistant", "content": "The best answer is ("},
    ]
    response = claude.messages(messages)
    y AiAgent.new.format_claude_response(response)

  end
end
