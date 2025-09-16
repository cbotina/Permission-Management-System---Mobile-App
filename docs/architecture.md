# Permission Management System (PMS) - Mobile Architecture

## Overview

The Permission Management System (PMS) mobile application is a Flutter-based cross-platform app that follows a feature-driven architecture with layered components. The system emphasizes modularity, reusability, and clear separation of concerns through a well-structured feature-based organization.

## Technology Stack

- **Framework**: Flutter (Dart)
- **State Management**: Riverpod with Hooks
- **Code Generation**: Freezed, JSON Serializable, Build Runner
- **HTTP Client**: HTTP package
- **Local Storage**: Shared Preferences
- **File Handling**: File Picker, Firebase Storage
- **Authentication**: JWT Decoder
- **UI Components**: Material Design 3
- **Testing**: Flutter Test

## Architecture Overview

### Feature-Driven Architecture

The application is organized around features rather than technical layers, promoting high cohesion and low coupling:

```
┌─────────────────────────────────────────────────────────┐
│                    Pages Layer                          │
│              (Screen Composition)                       │
├─────────────────────────────────────────────────────────┤
│                  Features Layer                         │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐      │
│  │   Feature   │ │   Feature   │ │   Feature   │      │
│  │     1       │ │     2       │ │     3       │      │
│  └─────────────┘ └─────────────┘ └─────────────┘      │
├─────────────────────────────────────────────────────────┤
│                  Common Layer                           │
│         (Shared Components & Utilities)                │
└─────────────────────────────────────────────────────────┘
```

### Feature Internal Structure

Each feature follows a consistent layered architecture:

```
feature_name/
├── data/
│   ├── abstract_repositories/    # Repository interfaces
│   ├── dto/                      # Data transfer objects
│   ├── providers/                # Riverpod providers
│   └── repositories/             # Repository implementations
│       ├── impl_*.dart           # Real repository implementations
│       └── mock_*.dart           # Mock repository implementations
├── domain/
│   ├── models/                   # Business entities
│   └── enums/                    # Domain enumerations
├── presentation/
│   ├── controllers/              # State controllers
│   ├── state/                    # State definitions
│   └── widgets/                  # UI components
└── application/                  # Application services (optional)
```

## Component Communication Patterns

### Data Flow Architecture

```
User Interaction → Page → Feature Widget → Controller → Service → Repository → API
                                    ↓
                              State Update ← Provider ← Data Transformation ← Response
```

### State Management Flow

```
Widget → Controller (AsyncNotifier) → Service → Repository → API
  ↓
State Provider → Widget Rebuild → UI Update
```

## Core Components

### 1. Pages
**Purpose**: Screen-level composition and navigation
**Responsibilities**:
- Compose feature widgets into complete screens
- Handle navigation between screens
- Manage screen-level state
- Coordinate multiple features

**Communication**:
- Consumes feature widgets from different features
- Manages navigation flow
- Handles screen-level user interactions

### 2. Feature Widgets
**Purpose**: Self-contained UI components for specific features
**Responsibilities**:
- Present feature-specific UI
- Handle user interactions within the feature
- Manage local widget state
- Communicate with feature controllers

**Communication**:
- Used by pages for screen composition
- Interacts with feature controllers
- May consume common widgets

### 3. Controllers (AsyncNotifier)
**Purpose**: Manage feature state and business logic
**Responsibilities**:
- Handle asynchronous operations
- Manage feature state
- Coordinate with services
- Provide state to widgets

**Communication**:
- Called by feature widgets
- Interacts with services and repositories
- Updates state through providers

### 4. Services
**Purpose**: Implement business logic and orchestrate operations
**Responsibilities**:
- Process business rules
- Coordinate between repositories
- Handle complex operations
- Transform data between layers

**Communication**:
- Called by controllers
- Interacts with repositories
- May call other services

### 5. Repositories
**Purpose**: Abstract data access operations
**Responsibilities**:
- Perform API calls
- Handle data transformation
- Manage caching
- Provide data to services

**Communication**:
- Called by services
- Interacts with external APIs
- Returns domain models

### 6. Domain Models
**Purpose**: Represent business entities and data structures
**Responsibilities**:
- Define data structure
- Enforce business rules
- Provide type safety
- Support serialization

**Communication**:
- Used across all layers
- Transformed by DTOs for API communication
- Referenced by services and controllers

## Page Composition Pattern

### Page Structure
Pages act as composition containers that combine widgets from different features:

```dart
class FeaturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feature')),
      body: Column(
        children: [
          FeatureWidget1(),      // From Feature A
          FeatureWidget2(),      // From Feature B
          CommonWidget(),        // From Common layer
        ],
      ),
    );
  }
}
```

### Widget Composition
Feature widgets are designed to be composable and reusable:

```dart
class FeatureTile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Tile(
      iconData: Icons.feature_icon,
      title: "Feature Title",
      subtitle: "Feature Description",
      onTap: () => navigateToFeature(context),
    );
  }
}
```

## State Management Architecture

### Riverpod Provider Hierarchy

```
Global Providers (App Level)
├── Repository Providers
├── Session Providers
└── Feature Providers
    ├── Data Providers
    ├── State Providers
    └── Controller Providers
```

### Provider Types

1. **Repository Providers**: Provide repository implementations
2. **Data Providers**: Provide raw data from repositories
3. **State Providers**: Provide processed state for UI
4. **Controller Providers**: Provide state management controllers

### State Flow Pattern

```dart
// Repository Provider
final repositoryProvider = Provider<IRepository>((ref) => Repository());

// Data Provider
final dataProvider = FutureProvider<List<Model>>((ref) async {
  final repository = ref.watch(repositoryProvider);
  return repository.getData();
});

// Controller Provider
final controllerProvider = AsyncNotifierProvider<Controller, State>(() => Controller());
```

## Common Layer Architecture

### Shared Components
Reusable UI components organized by functionality:

```
common/
├── components/
│   ├── buttons/           # Button variants
│   ├── form_fields/       # Input components
│   ├── loading/           # Loading indicators
│   └── table/             # Table components
├── themes/                # App theming
├── models/                # Shared data models
├── providers/             # Global providers
├── utils/                 # Utility functions
└── extensions/            # Dart extensions
```

### Component Design Patterns

1. **Composition over Inheritance**: Components are composed rather than extended
2. **Props-based Configuration**: Components accept configuration through constructor parameters
3. **Theme Integration**: Components respect app theming
4. **Accessibility**: Components support accessibility features

## Data Layer Architecture

### Repository Pattern
Abstract repositories define contracts for data access:

```dart
abstract class IFeatureRepository {
  Future<List<Model>> getData();
  Future<Model> createData(CreateDto dto);
  Future<Model> updateData(int id, UpdateDto dto);
  Future<void> deleteData(int id);
}
```

### Mock Repository Pattern
Each abstract repository has a corresponding mock implementation for testing purposes:

```dart
class MockFeatureRepository implements IFeatureRepository {
  @override
  Future<List<Model>> getData() async {
    return Future.value(mockData);
  }

  @override
  Future<Model> createData(CreateDto dto) async {
    return Future.value(mockCreatedModel);
  }

  @override
  Future<Model> updateData(int id, UpdateDto dto) async {
    return Future.value(mockUpdatedModel);
  }

  @override
  Future<void> deleteData(int id) async {
    // Mock implementation - no actual deletion
  }
}

// Mock data constants
const List<Model> mockData = [
  Model(id: 1, name: 'Test Item 1'),
  Model(id: 2, name: 'Test Item 2'),
];
```

**Mock Repository Benefits**:
- **Testing Isolation**: Enables testing without external dependencies
- **Predictable Data**: Provides consistent test data for reliable tests
- **Fast Execution**: Eliminates network calls and database operations
- **Error Simulation**: Allows testing error scenarios easily
- **Development**: Enables development without backend services

### DTO Pattern
Data Transfer Objects handle API communication:

```dart
@freezed
class CreateDto with _$CreateDto {
  const factory CreateDto({
    required String name,
    required String description,
  }) = _CreateDto;

  factory CreateDto.fromJson(Map<String, dynamic> json) => _$CreateDtoFromJson(json);
}
```

### Provider Injection
Repositories are injected through Riverpod providers:

```dart
final featureRepositoryProvider = Provider<IFeatureRepository>((ref) {
  return FeatureRepository(ref: ref);
});
```

## Navigation Architecture

### Route Management
Navigation is handled through Flutter's built-in navigation:

```dart
// Navigation pattern
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => const TargetPage(),
  ),
);
```

### Page Composition
Pages compose feature widgets and handle navigation:

```dart
class MainMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          FeatureTile1(),  // Navigates to FeaturePage1
          FeatureTile2(),  // Navigates to FeaturePage2
          CommonTile(),    // Navigates to CommonPage
        ],
      ),
    );
  }
}
```

## Error Handling Architecture

### Error Propagation
Errors flow through the architecture layers:

```
API Error → Repository → Service → Controller → Widget → UI
```

### Error Handling Patterns

1. **AsyncValue**: Riverpod's built-in error handling
2. **Extension Methods**: Custom error handling extensions
3. **Error Widgets**: Dedicated error display components
4. **User Feedback**: Toast messages and dialogs

### Error UI Pattern

```dart
extension AsyncValueUI on AsyncValue {
  void dialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      showDialog(
        context: context,
        builder: (context) => ErrorDialog(error: error),
      );
    }
  }
}
```

## Theming Architecture

### Theme Structure
Centralized theming system:

```dart
// Theme definition
final lightTheme = ThemeData(
  useMaterial3: false,
  fontFamily: 'CustomFont',
  colorScheme: lightColorScheme,
  // ... other theme properties
);
```

### Component Theming
Components respect theme configuration:

```dart
class ThemedComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Text(
        'Themed Text',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
```

## Development Guidelines

### Creating a New Feature

1. **Create Feature Structure**:
   ```bash
   mkdir -p lib/features/feature_name/{data,domain,presentation}
   mkdir -p lib/features/feature_name/data/{abstract_repositories,dto,providers,repositories}
   mkdir -p lib/features/feature_name/domain/{models,enums}
   mkdir -p lib/features/feature_name/presentation/{controllers,state,widgets}
   ```

2. **Define Domain Models**:
   ```dart
   @freezed
   class FeatureModel with _$FeatureModel {
     const factory FeatureModel({
       required int id,
       required String name,
     }) = _FeatureModel;
     
     factory FeatureModel.fromJson(Map<String, dynamic> json) => 
         _$FeatureModelFromJson(json);
   }
   ```

3. **Create Repository Interface**:
   ```dart
   abstract class IFeatureRepository {
     Future<List<FeatureModel>> getFeatures();
     Future<FeatureModel> createFeature(CreateFeatureDto dto);
   }
   ```

4. **Implement Repository**:
   ```dart
   class FeatureRepository implements IFeatureRepository {
     final Ref ref;
     
     FeatureRepository({required this.ref});
     
     @override
     Future<List<FeatureModel>> getFeatures() async {
       // Implementation
     }
   }
   ```

5. **Create Providers**:
   ```dart
   final featureRepositoryProvider = Provider<IFeatureRepository>((ref) {
     return FeatureRepository(ref: ref);
   });
   
   final featuresProvider = FutureProvider<List<FeatureModel>>((ref) async {
     final repository = ref.watch(featureRepositoryProvider);
     return repository.getFeatures();
   });
   ```

6. **Create Controller**:
   ```dart
   class FeatureController extends AsyncNotifier<FeatureState> {
     @override
     FutureOr<FeatureState> build() {
       return FeatureState.initial();
     }
     
     Future<void> loadFeatures() async {
       state = const AsyncValue.loading();
       state = await AsyncValue.guard(() async {
         // Load features logic
       });
     }
   }
   ```

7. **Create Feature Widget**:
   ```dart
   class FeatureWidget extends ConsumerWidget {
     @override
     Widget build(BuildContext context, WidgetRef ref) {
       final features = ref.watch(featuresProvider);
       
       return features.when(
         data: (data) => ListView.builder(
           itemCount: data.length,
           itemBuilder: (context, index) => FeatureTile(feature: data[index]),
         ),
         loading: () => const CircularProgressIndicator(),
         error: (error, stack) => ErrorWidget(error: error),
       );
     }
   }
   ```

8. **Create Page**:
   ```dart
   class FeaturePage extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(title: Text('Features')),
         body: const FeatureWidget(),
       );
     }
   }
   ```

### Creating Common Components

1. **Design Component Interface**:
   ```dart
   class CustomButton extends StatelessWidget {
     final Widget child;
     final VoidCallback? onPressed;
     final bool isLoading;
     
     const CustomButton({
       super.key,
       required this.child,
       this.onPressed,
       this.isLoading = false,
     });
   }
   ```

2. **Implement Component**:
   ```dart
   @override
   Widget build(BuildContext context) {
     return Material(
       child: InkWell(
         onTap: isLoading ? null : onPressed,
         child: Container(
           padding: const EdgeInsets.all(16),
           decoration: BoxDecoration(
             color: Theme.of(context).colorScheme.primary,
             borderRadius: BorderRadius.circular(8),
           ),
           child: isLoading 
             ? const CircularProgressIndicator()
             : child,
         ),
       ),
     );
   }
   ```

3. **Add to Common Layer**:
   Place in appropriate `common/components/` subdirectory

### Testing Strategy

#### Widget Testing
We only need widget testing. Typically a component is tested using its 'Page' component, unless specified.
- Use ProviderScope with overrides when needed to test multiple scenarios
- Include only the requested specs in the action plan
- Test files should be placed under `test/{feature_name}/`

#### Mock Repository Usage in Tests
Mock repositories are used to provide test data and isolate components from external dependencies:

```dart
// Example test with mock repository override
testWidgets('FeaturePage displays data correctly', (tester) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        featureRepositoryProvider.overrideWithValue(MockFeatureRepository()),
      ],
      child: const MaterialApp(home: FeaturePage()),
    ),
  );

  await tester.pumpAndSettle();
  
  expect(find.text('Test Item 1'), findsOneWidget);
  expect(find.text('Test Item 2'), findsOneWidget);
});
```

**Mock Repository Testing Benefits**:
- **Consistent Test Data**: All tests use the same predictable data
- **Fast Test Execution**: No network or database dependencies
- **Error Scenario Testing**: Easy to simulate different error conditions
- **Isolated Testing**: Tests focus on component behavior, not data fetching

### Code Organization

#### File Naming Conventions
- **Models**: `feature_model.dart`
- **Repositories**: `impl_feature_repository.dart`
- **Mock Repositories**: `mock_feature_repository.dart`
- **Controllers**: `feature_controller.dart`
- **Widgets**: `feature_widget.dart`
- **Pages**: `feature_page.dart`

#### Import Organization
```dart
// Flutter imports
import 'package:flutter/material.dart';

// Third-party imports
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Internal imports
import 'package:pms_app/common/components/button.dart';
import 'package:pms_app/features/feature_name/domain/models/feature_model.dart';
```

## Performance Considerations

### State Management
- **Selective Rebuilds**: Use specific providers to minimize rebuilds
- **State Caching**: Cache expensive computations
- **Provider Scoping**: Scope providers appropriately

### Widget Optimization
- **const Constructors**: Use const constructors where possible
- **Widget Composition**: Compose widgets efficiently
- **Memory Management**: Dispose resources properly

### Data Loading
- **Lazy Loading**: Load data when needed
- **Pagination**: Implement pagination for large datasets
- **Caching**: Cache frequently accessed data

## Security Architecture

### Authentication
- **JWT Tokens**: Store and validate JWT tokens
- **Token Refresh**: Implement token refresh logic
- **Secure Storage**: Use secure storage for sensitive data

### Data Protection
- **Input Validation**: Validate all user inputs
- **API Security**: Use HTTPS for all API calls
- **Error Handling**: Don't expose sensitive information in errors

This architecture provides a scalable, maintainable foundation for Flutter applications that promotes code reusability, clear separation of concerns, and efficient state management while maintaining flexibility for future enhancements.
