defmodule Febrd.Midtrans do
  @cg_base_url "https://app.sandbox.midtrans.com/snap/v1/transactions"

  @cg_base_url_prod "https://app.midtrans.com/snap/v1/transactions"
  @cg_base_status "https://api.sandbox.midtrans.com/v2/#{order_id}/status"
  @cg_base_status_prod "https://api.midtrans.com/v2/#{order_id}/status"


  @print_url false

  @server_key "sandbox_server_key"
  @server_key_prod "production_server_key"

  def create_deposito(wallet_address, amount) do
    headers = %{
      "accept": "application/json",
      "authorization": "Basic " <> Base.encode64("#{@server_key}:"),
      "content-type": "application/json"
    }
    order_id =  :crypto.strong_rand_bytes(17) |> Base.url_encode64()

    admin_fee_amount = 4500
    body = %{
      "transaction_details": %{
        "order_id": "FLIZZY-" <> order_id,
        "gross_amount": amount + admin_fee_amount
      },
      "credit_card": %{
        "secure": true
      },
      "item_details": [
        %{
          "id":  "FLIZZY-deposito" <> order_id,
          "price": amount,
          "quantity": 1,
          "name": "Jumlah Top up",
          "brand": "FlizzyCash",
          "category": "Deposit Wallet",
          "merchant_name": "Metamask Wallet",
          "url": "https://flizzy.id/"
        },
        %{
          "id":  "FLIZZY-admFee" <> order_id,
          "price": admin_fee_amount,
          "quantity": 1,
          "name": "Admin Fee"
        }
      ],
      customer_details: %{
        first_name: wallet_address
      }
    }


       response = HTTPoison.post(@cg_base_url, Poison.encode!(body), headers)




    case response do
      {:ok, %{status_code: 201, body: body}} ->
        response_body = body |> Poison.decode!()

        IO.puts("Midtrans transaction created successfully. Response body:")
        IO.inspect(response_body)

      {:ok, %{status_code: code}} ->
        raise "Failed to create Midtrans transaction. Response status code: #{code}"

      {:error, error} ->
        raise "Failed to create Midtrans transaction. Error: #{inspect error}"
    end
  end

  def create_deposito_prod(wallet_address, amount) do
    headers = %{
      "accept": "application/json",
      "authorization": "Basic " <> Base.encode64("#{@server_key_prod}:"),
      "content-type": "application/json"
    }
    order_id =  :crypto.strong_rand_bytes(17) |> Base.url_encode64()

    admin_fee_amount = 4500
    body = %{
      "transaction_details": %{
        "order_id": "FLIZZY-" <> order_id,
        "gross_amount": amount + admin_fee_amount
      },
      "credit_card": %{
        "secure": true
      },
      "item_details": [
        %{
          "id":  "FLIZZY-deposito" <> order_id,
          "price": amount,
          "quantity": 1,
          "name": "Jumlah Top up",
          "brand": "FlizzyCash",
          "category": "Deposit Wallet",
          "merchant_name": "Metamask Wallet",
          "url": "https://flizzy.id/"
        },
        %{
          "id":  "FLIZZY-admFee" <> order_id,
          "price": admin_fee_amount,
          "quantity": 1,
          "name": "Admin Fee"
        }
      ],
      customer_details: %{
        first_name: wallet_address
      }
    }


       response = HTTPoison.post(@cg_base_url_prod, Poison.encode!(body), headers)




    case response do
      {:ok, %{status_code: 201, body: body}} ->
        response_body = body |> Poison.decode!()

        IO.puts("Midtrans transaction created successfully. Response body:")
        IO.inspect(response_body)

      {:ok, %{status_code: code}} ->
        raise "Failed to create Midtrans transaction. Response status code: #{code}"

      {:error, error} ->
        raise "Failed to create Midtrans transaction. Error: #{inspect error}"
    end
  end



  def get_status(order_id) do
    headers = %{
      "accept": "application/json",
      "authorization": "Basic " <> Base.encode64("#{@server_key}:"),
      "content-type": "application/json"
    }

    cg_base_url_status = @cg_base_status_prod 


       response = HTTPoison.get(cg_base_url_status, headers)



    case response do
      {:ok, %{status_code: 200, body: body}} ->
        response_body = body |> Poison.decode!()

        IO.puts("Midtrans get status successfully Response body:")
        IO.inspect(response_body)

      {:ok, %{status_code: code}} ->
        raise "Failed to get status. Response status code: #{code}"

      {:error, error} ->
        raise "Get status failed. Error: #{inspect error}"
    end
  end


end
