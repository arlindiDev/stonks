# Stock Portfolio Tracker

A Flutter application for tracking stock portfolios with Clean Architecture, BLoC state management, gRPC integration, and dynamic theming.

## Demo



https://github.com/user-attachments/assets/1e98a5b6-ddc2-4e8a-9106-2bd98f085341



## Architecture & Code Structure

This project follows **Clean Architecture** with clear separation of concerns across three layers:

1. **Data Layer** - External data sources (gRPC services, proto models, repository implementations)
2. **Domain Layer** - Business logic (entities, repository contracts)
3. **Presentation Layer** - UI and state management (BLoC, screens, widgets)

### Folder Structure
```
lib/
├── core/                          # Shared utilities & infrastructure
│   ├── di/                        # Dependency injection setup
│   ├── error/                     # Error handling (Failures, Result type)
│   ├── grpc/                      # gRPC channel & server factory
│   ├── theme/                     # Theme state
│   └── ui/                        # Shared UI (colors, constants)
│
├── features/                      # Feature modules (Clean Architecture)
│   ├── portfolio/                 # Portfolio feature
│   │   ├── data/                  # Data Layer
│   │   │   ├── datasource/        # Data sources
│   │   │   ├── generated/         # Generated proto code
│   │   │   ├── grpc/              # gRPC client & mock service
│   │   │   ├── mappers/           # Proto ↔ Domain conversion
│   │   │   ├── proto/             # Proto definitions
│   │   │   └── mock_data_helper.dart
│   │   │
│   │   ├── domain/                # Domain Layer (Business Logic)
│   │   │   ├── entities/          # Pure business entities
│   │   │   └── repository/        # Repository interfaces & implementation
│   │   │
│   │   └── presentation/          # Presentation Layer
│   │       ├── state/             # BLoC state management
│   │       └── ui/
│   │           ├── screens/       # Screen widgets
│   │           └── widgets/       # UI components
│   │
│   └── theme/                     # Theme switching feature
│       └── presentation/
│           └── state/             # Theme BLoC
│
├── main.dart                      # App entry point
└── scripts/
    └── generate_protos.sh         # Proto code generation script
```

### Technologies Used
- **Flutter & Dart** - UI framework
- **BLoC (flutter_bloc)** - State management with Equatable
- **gRPC & Protocol Buffers** - Type-safe communication layer
- **GetIt** - Dependency injection
- **fl_chart** - Interactive charts
- **Intl** - Number and date formatting

### Key Architecture Patterns
1. **Clean Architecture**: Separation between data, domain, and presentation layers
2. **Repository Pattern**: Abstracts data sources from business logic
3. **BLoC Pattern**: Manages UI state predictably with events and states
4. **Dependency Injection**: Uses GetIt for loose coupling
5. **Error Handling**: Custom Failure types with Result pattern (Either)
6. **gRPC Integration**: Proto-first approach with mock services for development

### Data Models vs Entities

Proto messages are converted to domain entities through mappers. This separation allows:
- **API changes** don't directly impact business logic
- **Domain entities** can combine multiple proto messages
- **Type safety** across the entire data flow
- **Testability** without network dependencies

## UI Features

### Portfolio Screen

**Features:**
- **Loading State**: Displays circular progress indicator while fetching data
- **Pull to Refresh**: Swipe down to refresh portfolio data
- **Error Handling**: Shows error view with retry button on failure
- **Dynamic Theme Switching**: Toggle between Retail Bank (light) and Neobank (dark) themes
- **Animated Theme Icon**: Smooth fade transition when switching themes

### Portfolio Components

#### 1. Portfolio Chart Card
Interactive chart displaying total portfolio performance:
- **Total Portfolio Value**: Large formatted currency display at the top
- **Chart Periods**: 1D, 1W, 1M, 6M, YTD, 1Y, ALL
- **Interactive Chart**: Built with fl_chart for smooth rendering
- **Touchable Data Points**: Touch to see exact values at specific timestamps
- **Period Selector**: Toggle between different time periods

#### 2. Portfolio Item Cards
Individual stock position cards showing:
- **Ticker Symbol**: Stock identifier (bold)
- **Company Name**: Full company name
- **Current Price**: Real-time market price
- **Day Change %**: Daily price movement with color coding
- **Position Size**: Number of shares owned
- **Average Price**: Purchase price per share
- **Market Value**: Total position value
- **Portfolio Percentage**: Percentage of total portfolio
- **Unrealized P&L**: Profit/loss with color coding (green for gains, red for losses)
- **Unrealized P&L %**: Percentage gain/loss with color coding

## Theme System

### Retail Bank Theme (Light)
- **Background**: Light, professional palette
- **Primary Colors**: Traditional banking colors
- **Card Style**: Subtle shadows and borders
- **Icon**: Sun icon (wb_sunny_outlined)

### Neobank Theme (Dark)
- **Background**: Modern dark palette
- **Primary Colors**: Contemporary fintech colors
- **Card Style**: Elevated cards with glow effects
- **Icon**: Moon icon (nights_stay_outlined)


## gRPC Integration

### Mock Service Development
The app uses a **mock gRPC service** for development:
- **PortfolioService**: Implements proto service definition
- **Mock Data Helper**: Generates realistic portfolio data
- **Chart Data**: Pre-generated time-series data for all periods
- **Type Safety**: Proto-enforced contracts between layers

### Data Flow
```
UI Event
    ↓
BLoC (Event)
    ↓
Repository
    ↓
DataSource
    ↓
gRPC Client
    ↓
Mock gRPC Service (Development) / Real Service (Production)
    ↓
Proto Response
    ↓
Mapper (Proto → Entity)
    ↓
Repository
    ↓
BLoC (State Update)
    ↓
UI Rebuild
```

### Proto Definitions
Located in `lib/features/portfolio/data/proto/`:
- `portfolio.proto` - Service and message definitions
- Generated code in `lib/features/portfolio/data/generated/`

**Generate Proto Code:**
```bash
./scripts/generate_protos.sh
```

## Error Handling

### Result Pattern
Uses a `Result` wrapper type for handling success/failure:
```dart
final result = await repository.getPortfolioData();

if (result.isSuccess) {
  final data = result.getDataOrNull();
  if (data != null) {
    emit(PortfolioLoaded(portfolioData: data));
  }
} else if (result.isFailure) {
  final failure = result.getFailureOrNull();
  if (failure != null) {
    emit(PortfolioError(message: failure.message));
  }
}
```

### Failure Types
- **NetworkFailure**: Network connection errors
- **ServerFailure**: gRPC server errors
- **DataParsingFailure**: Parsing or mapping errors
- **UnexpectedFailure**: Unexpected errors

## Testing

### Current Test Coverage
- ✅ **Unit Tests**: BLoC logic, entities, chart periods, Result/Failure types
- ✅ **Widget Tests**: Portfolio item cards, portfolio screen, theme switching
- ✅ **State Tests**: Portfolio states, theme states
- ✅ **Mapper Tests**: Proto ↔ Entity conversion
- ⚠️ **Missing Tests**: Portfolio chart card widget tests (I would recommend screenshot tests)

**Run Tests:**
```bash
flutter test
```

**View Coverage:**
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## Getting Started

### Prerequisites
- Flutter SDK (^3.9.0)
- Dart SDK
- Protocol Buffers Compiler (`protoc`)

### Installation


1. **Install dependencies:**
```bash
flutter pub get
```

2. **Generate proto code (if needed):**
```bash
chmod +x scripts/generate_protos.sh
./scripts/generate_protos.sh
```

3. **Run the app:**
```bash
flutter run
```

# What Should Be Added in a Real Production App


### 1. **Internationalization (i18n)**
- Support multiple languages
- Extract all hardcoded strings to translation files
- Use `intl` package for localization
- The formatters have some hardcoded strings which should be moved to localization files

### 3. **Design System & Reusable Components**
```
lib/core/ui/
├── components/           # Atomic design components
│   ├── atoms/           # Buttons, text fields, badges, chips
│   ├── molecules/       # Cards, form groups, list items
│   └── organisms/       # Complex components, headers
├── theme/
│   ├── spacing.dart     # Consistent padding/margin values
│   ├── typography.dart  # Font styles and weights
│   ├── dimensions.dart  # Responsive sizing
│   ├── shadows.dart     # Elevation and shadow styles
```

### 4. **Responsive Design System**
- Create `AppDimensions` class with responsive values for paddings.
- Typography System for different font styles
- Support multiple screen sizes (mobile, tablet, desktop, web)


### 5. **Analytics & Monitoring**

**Analytics:**
- Firebase Analytics or Mixpanel
- Track user behavior and feature usage

**Error Tracking:**
- Sentry or Firebase Crashlytics
- Performance monitoring

**Logging:**
- Structured logging with log levels
- Remote logging for production issues


**Built with ❤️ using Flutter**
