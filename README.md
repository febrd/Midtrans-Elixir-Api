# Midtrans-Elixir-Api
An Elixir Module For Midtrans Payment Gateway API 


========================
<h2><b>  SANDBOX </b> </h2>
------------------------

Create Deposito

==================

iex(1)> amount =10000

iex(2)> Febrd.Midtrans.create_deposito("0x12345678910", amount)

Midtrans transaction created successfully. Response body:

%{

"redirect_url" => "https://app.sandbox.midtrans.com/snap/v3/redirection/597f945d-xxxx-xxxx-xxx4-7f217eb851f9",

"token" => "597f945d-xxxx-xxx-xxx4-7f217eb851f9"

}

Get Status

===================

=== Code 404 ===

iex(3)> Febrd.Midtrans.get_status("FLIZZY-7K2KI-l2xxxxxxxxsKrqKqk=")

Midtrans Get Status successfully. Response body:

%{

"id" => "1f5959fb-xxxx-xxxx-xxxx-49c43b070310",
 
"status_code" => "404",

"status_message" => "Transaction doesn't exist."
}

=== Code 201 ===

Febrd.Midtrans.get_status("FLIZZY-zeeu3XJxxxxxxrFrWm2UEk=")

Midtrans Get Status successfully. Response body:

%{

"acquirer" => "gopay",

"currency" => "IDR",

"expiry_time" => "2023-05-05 06:19:46",

"fraud_status" => "accept",

"gross_amount" => "14500.00",

"merchant_id" => "G270004650",

"order_id" => "FLIZZY-zeeu3XxxxxxXrFrWm2UEk=",

"payment_type" => "qris",

"signature_key" => "b161129cf165ce97ce409xxxxxxxxxxxxxxxxxxxxxxce8edb9683ae89361510ee99a34",

"status_code" => "201",

"status_message" => "Success, transaction is found",

"transaction_id" => "89bfa64e-xxx-xx-xx-xxx-807119cc38ab",

"transaction_status" => "pending",

"transaction_time" => "2023-05-05 06:14:46"

}


===================

<h2><b> Production </b> </h2>

------------------------

CREATE DEPOSITO

==================

iex(1)> amount =10000

iex(2)> Febrd.Midtrans.create_deposito_prod("0x12345678910", amount)

Midtrans transaction created successfully. Response body:

%{

"redirect_url" => "https://app.midtrans.com/snap/v3/redirection/597f945d-xxxx-xxxx-xxx4-7f217eb851f9",

"token" => "597f945d-xxxx-xxx-xxx4-7f217eb851f9"

}

Get Status

===================

=== Code 404 ===

iex(3)> Febrd.Midtrans.get_status("FLIZZY-7K2KI-l2xxxxxxxxsKrqKqk=")

Midtrans Get Status successfully. Response body:

%{

"id" => "1f5959fb-xxxx-xxxx-xxxx-49c43b070310",
 
"status_code" => "404",

"status_message" => "Transaction doesn't exist."
}

=== Code 201 ===

Febrd.Midtrans.get_status("FLIZZY-zeeu3XJxxxxxxrFrWm2UEk=")

Midtrans Get Status successfully. Response body:

%{

"acquirer" => "gopay",

"currency" => "IDR",

"expiry_time" => "2023-05-05 06:19:46",

"fraud_status" => "accept",

"gross_amount" => "14500.00",

"merchant_id" => "G270004650",

"order_id" => "FLIZZY-zeeu3XxxxxxXrFrWm2UEk=",

"payment_type" => "qris",

"signature_key" => "b161129cf165ce97ce409xxxxxxxxxxxxxxxxxxxxxxce8edb9683ae89361510ee99a34",

"status_code" => "201",

"status_message" => "Success, transaction is found",

"transaction_id" => "89bfa64e-xxx-xx-xx-xxx-807119cc38ab",

"transaction_status" => "pending",

"transaction_time" => "2023-05-05 06:14:46"

}
