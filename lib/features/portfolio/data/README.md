# Portfolio Data Layer

This directory contains all data-related code for the Portfolio feature, including gRPC/Proto definitions.

## Structure

```
data/
├── proto/                  # Protocol Buffer definitions (source of truth)
│   └── portfolio.proto     # Portfolio service & data models
│
├── generated/              # Auto-generated from proto (DO NOT EDIT)
│   ├── *.pb.dart          # Proto message classes
│   ├── *.pbgrpc.dart      # gRPC service stubs
│   └── *.pbjson.dart      # JSON serialization
│
├── grpc/                   # gRPC service implementation
│   ├── portfolio_grpc_client.dart      # Client wrapper
│   └── mock_portfolio_service.dart     # Mock server for local dev
│
├── datasource/             # Data source interfaces & implementations
│   └── portfolio_remote_datasource.dart
│
├── mappers/                # Proto ↔ Domain model conversions
│   └── portfolio_mapper.dart
│
└── mock_data.dart          # Mock data for development
```

## Why This Structure?

### ✅ Feature Encapsulation
- Portfolio owns its proto definitions
- No leakage into `core/` or other features
- Easy to understand what belongs to portfolio

### ✅ Clean Architecture
- Data layer is self-contained
- Domain layer doesn't know about gRPC/Proto
- Easy to swap data sources

### ✅ Scalability
- Adding `features/stats` doesn't affect portfolio
- Each feature has its own proto/gRPC setup
- No conflicts or shared state

## Workflow

### 1. Define Data Models (Proto)
Edit `proto/portfolio.proto`:

```protobuf
message NewModel {
  string field = 1;
}
```

### 2. Generate Dart Code
```bash
./scripts/generate_protos.sh
```

This generates code in `generated/`.

### 3. Implement Mock Service
Update `grpc/mock_portfolio_service.dart` to return mock data.

### 4. Add Mapper
Update `mappers/portfolio_mapper.dart` to convert proto → domain models.

### 5. Use in Repository
The repository (`domain/repository/`) uses the data source, which uses gRPC.

## Generated Code

The `generated/` directory contains auto-generated files. **Never edit these directly!**

To regenerate:
```bash
./scripts/generate_protos.sh
```

## gRPC Service

### Mock Service (Current)
- Local gRPC server runs in-app
- Returns hardcoded mock data
- Perfect for development without backend

### Real Service (Future)
Change one line in `main.dart`:
```dart
final grpcClient = PortfolioGrpcClient.createClient(
  host: 'api.example.com',
  port: 50051,
);
```

## Common Tasks

### Add New Field
1. Add to `proto/portfolio.proto`
2. Run `./scripts/generate_protos.sh`
3. Update mock service
4. Update mapper
5. Update domain model

### Add New RPC
1. Add to `proto/portfolio.proto` service definition
2. Run `./scripts/generate_protos.sh`
3. Implement in `mock_portfolio_service.dart`
4. Add method to `portfolio_grpc_client.dart`
5. Use in data source

## Benefits of Feature-Scoped Proto

- **Isolation**: Changes to portfolio don't affect other features
- **Clarity**: Everything portfolio-related is in one place
- **Parallel Development**: Multiple features can evolve independently
- **Easy Testing**: Test portfolio data layer without other features

## When to Share Proto?

If you have models used by **multiple features**, create:
```
lib/shared/proto/
lib/shared/generated/
```

But start feature-scoped. Only move to shared when actually needed.
