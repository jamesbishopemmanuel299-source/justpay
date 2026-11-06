# JustPay

JustPay is an Android-first Flutter **educational fintech UI prototype** inspired by common Nigerian wallet apps.

## Included
- Wallet dashboard with clearly labelled sample balance
- Home, Pay, Activity and Profile tabs
- Airtime, data, electricity, cable TV, bank transfer and wallet-funding interface previews
- Sample transaction history
- Responsive Material 3 UI

## Safety and integration status
This repository currently contains a demo interface only. It does not hold funds, create real wallets, initiate transfers, collect payments, or contact Paybeta/Flutterwave. All displayed balances and transactions are sample data.

Before any real-money functionality is considered, the project needs an appropriately authorized financial partner, provider approval, adult/business oversight, regulatory and KYC/AML review, secure server-side credentials, verified webhooks, reconciliation, fraud controls, and security testing. Never put provider secret keys in the mobile app.

## Build
Install Flutter, then run:

```bash
flutter pub get
flutter analyze
flutter build apk --debug
```
