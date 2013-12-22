Rails.configuration.stripe = {
    :publishable_key => ENV["STRIPE_DEV_PUSH"],
    :secret_key      => ENV["STRIPE_DEV_SECRET"]
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]