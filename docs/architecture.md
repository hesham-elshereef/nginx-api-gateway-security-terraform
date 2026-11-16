
flowchart TD
    A["Client"] -->|"GET /api/users"| B["EC2 - NGINX"]
    B -->|"Inject Custom Headers"| C["API Gateway"]
    C --> D{"Lambda Authorizer"}
    D -->|"Allow"| E["get-users-lambda"]
    D -->|"Deny"| F["403 Forbidden"]
    E --> G["200 OK + Users JSON"]
