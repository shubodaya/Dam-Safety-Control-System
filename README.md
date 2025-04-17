# Safety Critical Dam Control System

## Overview

This project implements a **Safety Critical Dam Control System** developed for managing water gates in dam structures. The system is designed to respond in real-time to various environmental factors like water levels, wind speed, pressure, seismic activity, rain, and snow, ensuring the safety and stability of the dam. Its core objective is to prevent potential disasters like uncontrolled water release, structural failure, or dam collapse.

The system makes critical decisions based on the real-time data from multiple sensors and provides both manual and automated control for gate operations, safeguarding human lives and property downstream.

---

## Key Parameters Influencing Gate Operation

- **Water Level (Threshold: 100m, Critical: 80m)**  
  Monitors the height of water behind the dam. High water levels add pressure to the dam structure and may lead to overflow or failure.  
  **Influence**: If the water exceeds the threshold, gates are opened to release excess water based on operator input.

- **Pressure (Threshold: 5 atm, Critical: 2 atm)**  
  Measures the pressure exerted on the dam structure.  
  **Influence**: If pressure exceeds critical levels, the system adjusts gate operation to alleviate stress.

- **Wind Speed (Threshold: 15 km/h, Critical: 10 km/h)**  
  Measures wind speed and its effect on water dynamics, as high winds can cause waves, stressing the dam.  
  **Influence**: The system responds to high winds by adjusting the gate operation.

- **Rain (Threshold: 100 mm, Critical: 80 mm) & Snow (Threshold: 10 cm, Critical: 5 cm)**  
  Monitors rainfall and snow levels impacting the dam water inflow.  
  **Influence**: The system adjusts the gates based on the intensity of precipitation.

- **Seismographic Readings (Threshold: 5 Mw, Critical: 2 Mw)**  
  Measures seismic activity around the dam.  
  **Influence**: In case of seismic activity, emergency protocols are triggered to ensure the dam's safety.

---

## System Functionality

### Gate Control Methods

1. **Manual Gate Control:**  
   - The operator receives sensor readings and can open/close gates, adjusting the discharge rate based on the situation.  
   - The system prompts for confirmation to avoid simultaneous conflicting commands.

2. **Emergency Gate Control:**  
   - **Automatic Gate Opening:**  
     - Triggered when water/pressure levels exceed critical values or when water scarcity is detected downstream.
   - **Automatic Gate Closing:**  
     - Activated during seismic events or when rainfall exceeds critical values to prevent downstream flooding.

---

## Safety Critical System Design Principles

- **Consequences of Failure:**  
  Failure in this system could result in uncontrolled water release, dam collapse, and significant downstream damage.
  
- **Real-time Response:**  
  The system constantly monitors environmental parameters, adjusting gate operations accordingly.

- **Emergency Protocols:**  
  The system is designed to respond to extreme, unpredictable events like seismic activity, triggering immediate safety measures.

- **Preventive Measures for Overflow & Structural Failure:**  
  Constant monitoring helps prevent dam overflow and structural failure by adjusting gate operations proactively.

- **Manual and Emergency Gate Control:**  
  Operators can manually adjust gates, but the system also incorporates automatic controls during emergencies for optimal safety.

- **Operator Confirmation:**  
  The system prompts operators to confirm gate changes, ensuring proper gate management.

---

## Conclusion

The **Safety Critical Dam Control System** is designed to ensure the protection of both the dam structure and lives downstream. By integrating real-time sensor data, automated emergency responses, and manual gate control, it provides a comprehensive solution to manage the safety and stability of the dam under various environmental conditions.

---

## Hazard Analysis

### Fault Tree Analysis

The primary hazard considered in the system is **flooding**. The system uses a **Boolean Tree** to identify potential causes, such as structural failure, high pressure, and full gates releasing excess water.

### Minimal Cut Sets Formula:

