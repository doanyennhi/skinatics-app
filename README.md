# Skinatics



Skinatics is an iOS application with the purpose of helping users find skincare products to help with their skin concerns. In other words, an "on-the-go skincare assistant".
 

## Team Members

- [Yen Nhi Doan](https://github.com/doanyennhi) (s3880599)
- [Marielle Louisse Lopez](https://github.com/marielle-louisse) (s3922406)
  

## Features

- Understand a user's skin type, conditions, and concerns, and then recommend suitable products found in nearby stores to help with such concerns.
- Allow a user to search for a product or ingredient, and understand its benefits and purpose in the skincare world.
  - Product barcodes can be scanned as well.
- Users can create a day and night skincare routine to follow for a seamless experience - users will not forget what product is next in their routine!
- Harness the power of AI to see if products users are using are in fact improving their skin.
  - Users take a selfie and skin analysis results are shown, comparing from previous analyses.
    
 
## Project Structure

```
├── Assets.xcassets        // app assets like colors, app icon & images
|
├── Extension              // extension-related code
|
├── Helper                 // common and utility functions
|
├── Model                  // define data structure
|
├── Preview Content        // app preview
|
├── Resources              // Common app resources
│  ├── fonts               // custom font for app
|
├── UIComponents           // common UI components across app like buttons, titles
|
├── View                   // all UI Views/ Screens
|   |   
│   ├── Auth               // Authentication-related screens
|   |
│   ├── Home               // Home screen
|   |
│   ├── Profile            // User Profile screen
|   |
│   ├── SkinQuiz           // Skin-related quiz screens
|   |
│   ├── StartUp            // Start/ First screen when open app
|
├── ContentView.swift      // Root screen
|
├── Info.plist             // Contain configuration info of app
|
├── SkinaticsApp.swift     // main method
