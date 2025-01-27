# AppHttpKit

A lightweight Swift HTTP client designed to simplify API requests with an easy-to-use interface and async/await support.

## Features

- Supports common HTTP methods: `GET`, `POST`, `PUT`, `PATCH`, and `DELETE`
- Customizable request headers and query parameters
- Supports multiple body encoders (JSON, URL, Multipart, Data)
- Built-in response handling

## Usage

### Creating an HttpClient instance

```swift
let client = HttpClient(baseURL: "https://api.example.com")
```

### Making requests

#### GET request

```swift
let responseData = try await client.get("/users", params: ["id": AnyEncodable(123)])
```

#### POST request

```swift
let responseData = try await client.post("/users", params: ["name": AnyEncodable("John Doe")])
```

#### PUT request

```swift
let responseData = try await client.put("/users/1", params: ["name": AnyEncodable("Jane Doe")])
```

#### PATCH request

```swift
let responseData = try await client.patch("/users/1", params: ["email": AnyEncodable("jane@example.com")])
```

#### DELETE request

```swift
let responseData = try await client.delete("/users/1")
```

### Handling responses

```swift
let response = try await client.get("/users/1")
if response.isSuccessful {
    print("Success: \(response.body)")
} else {
    print("Failed with code: \(response.code)")
}
```

## Error Handling

The `HttpClient` can throw the following errors:

- `ClientError.timeout`: When a request exceeds the timeout interval
- `ClientError.network(response:error:)`: For network-related issues
- `ClientError.encoderNotFound`: When an appropriate encoder is not available

