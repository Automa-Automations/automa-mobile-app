import stripe
from flask import Flask, jsonify
stripe.api_key = 'sk_test_51PCbyWRpgjuWcdPRWkDUKRRShKb8lZiYKQP8Ov37s2TdaAAGJYB4kteMHmiTHU7aBM40IoNbejAgMjRtn2wR4jDJ00gazKtd1m'

import os

app = Flask(__name__)

@app.route('/payment-sheet', methods=['POST'])
def payment_sheet():
  # Use an existing Customer ID if this is a returning customer
  customer = stripe.Customer.create()
  ephemeralKey = stripe.EphemeralKey.create(
    customer=customer['id'],
    stripe_version='2024-04-10',
  )
  paymentIntent = stripe.PaymentIntent.create(
    amount=1099,
    currency='eur',
    customer=customer['id'],
    # In the latest version of the API, specifying the `automatic_payment_methods` parameter
    # is optional because Stripe enables its functionality by default.
    automatic_payment_methods={
      'enabled': True,
    },
  )
  return jsonify(paymentIntent=paymentIntent.client_secret,
                 ephemeralKey=ephemeralKey.secret,
                 customer=customer.id,
                 publishableKey='pk_test_51PCbyWRpgjuWcdPRNb5nGYKleCCaDgtnAEcidL7x8CEwR7jkYicsAM2DCHwmZO7CsKE0uYFPocH974I1xtHdDseP004I8LUgiT')


if __name__ == '__main__':
    app.run(port=int(os.environ.get('PORT', 4242)))
