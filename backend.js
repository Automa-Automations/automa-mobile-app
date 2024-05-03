const express = require('express');
const stripe = require('stripe')('sk_test_51P66Kt08DVAPlynAaeR6umU6fNrQFgvyeY7sSmNEBFYhSTw04kYtukpozWNvNmDud3fFBIbenkU4inlZgzvCeim300Cq94Xq5H');
// This example sets up an endpoint using the Express framework.
// Watch this video to get started: https://youtu.be/rPR2aJ6XnAc.
// Add all the middleware & setup express app
const app = express();

app.post('/payment-sheet', async (req, res) => {
  // Use an existing Customer ID if this is a returning customer.
  const customer = await stripe.customers.create();
  const ephemeralKey = await stripe.ephemeralKeys.create(
    {customer: customer.id},
    {apiVersion: '2024-04-10'}
  );
  const paymentIntent = await stripe.paymentIntents.create({
    amount: 1099,
    currency: 'eur',
    customer: customer.id,
    // In the latest version of the API, specifying the `automatic_payment_methods` parameter
    // is optional because Stripe enables its functionality by default.
    automatic_payment_methods: {
      enabled: true,
    },
  });

  res.json({
    paymentIntent: paymentIntent.client_secret,
    ephemeralKey: ephemeralKey.secret,
    customer: customer.id,
    publishableKey: 'pk_test_51P66Kt08DVAPlynAT9mJ29reqr9SrA7fPbNl7W3s9bGugc4e6IxMbKMjX492bHofMAfGQEgiiC4x4cXLdxmSe0HQ00H7m9Isxe'
  });
});

// Run the server.
//
app.listen(4242, () => console.log('Running on port 4242'))
