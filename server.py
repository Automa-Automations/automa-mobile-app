import stripe
from flask import Flask, jsonify, request 
stripe.api_key = 'sk_test_51PCbyWRpgjuWcdPRWkDUKRRShKb8lZiYKQP8Ov37s2TdaAAGJYB4kteMHmiTHU7aBM40IoNbejAgMjRtn2wR4jDJ00gazKtd1m'

import os
from supabase import create_client, Client

url: str = "https://wvzgejpisuukgnohsimu.supabase.co"
key: str = input("What is your Supabase key? ")
supabase: Client = create_client(url, key)

import os

app = Flask(__name__)
prices: dict[str, int] = {
    'plan_premium': 2999,
    'plan_exclusive': 5999,
    'plan_standard': 1499
}

@app.route('/payment-sheet', methods=['POST'])
def payment_sheet():
  userId = request.json['userId']
  priceId = request.json['priceId'] or 'plan_standard'
    
# Check supabase for customer
  user = supabase.table('profiles').select('stripeCustomerId').eq('id', userId).execute()
  if user.data and user.data[0]['stripeCustomerId']:
        customer = stripe.Customer.retrieve(user.data[0]['stripeCustomerId'])
  else:
        customer = stripe.Customer.create()
        # Update user with stripeCustomerId
        supabase.table('profiles').update({
            'stripeCustomerId': customer.id,
        }).eq('id', userId).execute()

  ephemeralKey = stripe.EphemeralKey.create(
    customer=customer['id'],
    stripe_version='2024-04-10',
  )
  paymentIntent = stripe.PaymentIntent.create(
    amount=prices[priceId] or int(priceId.split('_')[1]), # users can also buy credits
    currency='usd',
    customer=customer['id'],
    automatic_payment_methods={
      'enabled': True,
    },
  )

  if "plan_" in priceId:
      # Update user expiryDate = -1
    # Users are stored in the 'profiles' table
    print("Updating Plan")
    response = supabase.table('profiles').update({
        'expiryDate': -1,
    }).eq('id', userId).execute()
    print(response)
    print(response.data)
  elif "credits_" in priceId:
      "Credits"
      print("Credits aren't integrated yet!")

  return jsonify(paymentIntent=paymentIntent.client_secret,
                 ephemeralKey=ephemeralKey.secret,
                 customer=customer.id,
                 publishableKey='pk_test_51PCbyWRpgjuWcdPRNb5nGYKleCCaDgtnAEcidL7x8CEwR7jkYicsAM2DCHwmZO7CsKE0uYFPocH974I1xtHdDseP004I8LUgiT')


if __name__ == '__main__':
    app.run(port=int(os.environ.get('PORT', 4242)))
