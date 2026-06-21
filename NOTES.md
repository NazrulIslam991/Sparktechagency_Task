# Project Structure Overview

The application is built using a clean MVVM architecture along with Riverpod and a hybrid setup of Flutter and Native Android. Below is the breakdown of the system design, reasoning, and implementation approach.

---
## 1. Overall System Design

This application combines Flutter for the UI layer and native Android (Kotlin) for the system layer. Flutter manages the cross-platform user interface. Kotlin takes care of low-level device operations such as sensors, WiFi, battery, SIM, and system information that Flutter cannot directly access.
The system is designed to collect real-time device data, discover nearby devices, and enable peer-to-peer communication over a Local Area Network (LAN).

---
## 2. Architecture Pattern (MVVM + Riverpod)

The Flutter layer uses the MVVM (Model-View-ViewModel) architecture with Riverpod for state management.

Model: Defines data structures. \
View: Displays screens that show device data, network status, and received information.\
ViewModel (Riverpod Providers): Manages business logic, state updates, and communication between the Flutter UI, native Android code, and LAN services.

---
## 3. Native Bridge (MethodChannel)

#### A MethodChannel allows communication between Flutter and Android native code. 
- Flutter calls getDeviceData.
- Android collects hardware and system information.
- Data is returned to Flutter in a structured format.

#### The Android native layer (MainActivity.kt) gathers real-time device data. This enables access to:
- Sensors
- WiFi information
- Battery status
- SIM/network data
- System-level APIs

---
## 4. LAN Communication System

#### The system follows a two-layer networking model:
- UDP Broadcast: Used for automatic device discovery on the same WiFi network.
- TCP Sockets: Used for reliable peer-to-peer data exchange.

#### This ensures:
- Fast discovery (UDP)
- Reliable communication (TCP)

---
## 5. Data Flow

#### The overall data flow is as follows:

- Android collects device data.
- Data is passed to Flutter via MethodChannel.
- Devices broadcast their presence using UDP.
- Nearby devices automatically detect each other.
- A TCP connection is established for communication.
- JSON-based structured data is exchanged.

---
## 6. Project Structure

### i ) Native Layer :
#### Handles sensor access, system data collection, and MethodChannel communication.
- android/app/main/kotlin/com/example/sparktechagency_task/MainActivity.kt  

### ii ) Core Services  
#### Handles Flutter to Android communication via MethodChannel.
- lib/core/services/device_info_service.dart  
#### Manages UDP discovery and TCP peer-to-peer communication.
- lib/core/services/lan_service.dart  

### iii ) Data Layer  
#### Defines application state and data structures.
- lib/data/models/dashboard_state.dart  
- lib/data/models/received_data_model.dart  
- lib/data/models/received_data_state.dart  
#### Handles local storage using SharedPreferences.
- lib/data/sources/shared_preference.dart  

### iv ) Presentation Layer  
#### Main dashboard UI showing live device data.
- lib/presentation/dashboard  
#### Displays received device history.
- lib/presentation/received_data_screen  
#### Reusable UI components
- lib/presentation/widgets  

---
## 7. Design Rationale

- Flutter is chosen for cross-platform UI development.  
- MVVM with Riverpod ensures a scalable and maintainable architecture.  
- Native Android is used for hardware-level access.  
- Combining UDP and TCP provides a good balance of speed and reliability.  
- SharedPreferences is used for lightweight local caching.  
- The modular structure enhances maintainability and future scalability.

---