Text-to-ASL System
Overview
The Text-to-ASL System is a comprehensive solution designed to bridge the communication gap between hearing and deaf individuals by translating spoken or written English into American Sign Language (ASL). The project features a dual-interface approach, offering both a Flutter-based mobile application for portable use and a Python Flask web application that showcases a 3D avatar for real-time fingerspelling visualization.

Features
1. Multi-Platform Interfaces
Web Application (Python/Flask):
3D Avatar Studio: A modern, interactive interface featuring a programmatically generated 3D avatar (built with Three.js). The avatar enables real-time fingerspelling of words and sentences with accurate hand poses and lip synchronization (visemes).
Legacy 2D View: A classic view that displays ASL GIFs for corresponding words.
Terminal Integration: Allows users to input text directly via the server terminal to control the avatar.
Mobile Application (Flutter):
A portable app designed for iOS and Android.
Includes capabilities for Speech-to-Text (voice input) and video/audio playback.
Bundles a local database of ASL assets ("EthSL" and standard ASL images).
2. Intelligent Translation Logic
Text Processing: The system parses input text (typed or spoken) to identify keywords.
Asset Matching: It searches a local database of ASL GIFs/images to find exact matches for words.
Fingerspelling Fallback: If a specific sign (word) is not found in the database, the system automatically falls back to fingerspelling the word letter-by-letter to ensure no meaning is lost.
3. Smart Avatar (Web)
Real-time Animation: Uses Tween.js for smooth transitions between hand shapes.
Lip Sync: Implements basic visemes (mouth shapes) that synchronize with the signing for a more human-like appearance.
Interactive Controls: Supports input via text typing or microphone (Web Speech API).
Technology Stack
Backend: Python, Flask
Frontend (Web): HTML5, JavaScript (ES6 modules), Three.js, Tween.js
Frontend (Mobile): Flutter, Dart
Assets: A comprehensive library of ASL GIFs and images.
Getting Started
Prerequisites
Python 3.x
Flutter SDK
Google Chrome (for optimal web experience)
Running the Web Application
Navigate to the project directory.
Run the Flask server:
bash
python python_web/app.py