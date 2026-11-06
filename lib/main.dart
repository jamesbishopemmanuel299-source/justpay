import 'package:flutter/material.dart';

void main() => runApp(const JustPayApp());

const navy = Color(0xFF101C3A);
const blue = Color(0xFF315EF5);
const pale = Color(0xFFF4F6FB);

class JustPayApp extends StatelessWidget {
  const JustPayApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'JustPay',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: pale,
      colorScheme: ColorScheme.fromSeed(seedColor: blue, brightness: Brightness.light),
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(backgroundColor: pale, foregroundColor: navy, elevation: 0),
    ),
    home: const MainShell(),
  );
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int tab = 0;
  final pages = const [HomePage(), PaymentsPage(), ActivityPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: IndexedStack(index: tab, children: pages)),
    bottomNavigationBar: NavigationBar(
      selectedIndex: tab,
      onDestinationSelected: (v) => setState(() => tab = v),
      backgroundColor: Colors.white,
      indicatorColor: const Color(0xFFE8EDFF),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.grid_view_rounded), selectedIcon: Icon(Icons.grid_view), label: 'Pay'),
        NavigationDestination(icon: Icon(Icons.receipt_long_outlined), selectedIcon: Icon(Icons.receipt_long), label: 'Activity'),
        NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
      ],
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
    children: [
      Row(children: [
        Container(width: 44, height: 44, decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(15)), child: const Icon(Icons.account_balance_wallet_rounded, color: Colors.white)),
        const SizedBox(width: 11),
        const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('JUSTPAY', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.4, color: navy, fontSize: 17)),
          Text('Your money, organized', style: TextStyle(color: Colors.black54, fontSize: 11)),
        ]),
        const Spacer(),
        IconButton(onPressed: () => notice(context, 'Notifications are part of this demo.'), icon: const Icon(Icons.notifications_none_rounded, color: navy)),
      ]),
      const SizedBox(height: 24),
      Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFF17264D), Color(0xFF315EF5)], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(26),
          boxShadow: [BoxShadow(color: blue.withOpacity(.18), blurRadius: 22, offset: const Offset(0, 10))],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [const Text('DEMO WALLET BALANCE', style: TextStyle(color: Colors.white70, fontSize: 11, letterSpacing: 1.1)), const Spacer(), const Icon(Icons.visibility_outlined, color: Colors.white70, size: 19)]),
          const SizedBox(height: 12),
          const Text('₦ 125,000.00', style: TextStyle(color: Colors.white, fontSize: 31, fontWeight: FontWeight.w800)),
          const SizedBox(height: 6),
          const Text('Sample balance • No real funds', style: TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 24),
          Row(children: [
            Expanded(child: FilledButton.icon(onPressed: () => notice(context, 'Wallet funding is disabled in this prototype.'), icon: const Icon(Icons.add), label: const Text('Add money'), style: FilledButton.styleFrom(backgroundColor: Colors.white, foregroundColor: navy))),
            const SizedBox(width: 10),
            Expanded(child: OutlinedButton.icon(onPressed: () => notice(context, 'Transfers are disabled in this prototype.'), icon: const Icon(Icons.north_east), label: const Text('Transfer'), style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white70)))),
          ]),
        ]),
      ),
      const SizedBox(height: 26),
      const SectionTitle('Quick actions'),
      const SizedBox(height: 13),
      GridView.count(
        crossAxisCount: 4, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 15, crossAxisSpacing: 8, childAspectRatio: .82,
        children: [
          ActionTile(icon: Icons.phone_android_rounded, label: 'Airtime', onTap: () => notice(context, 'Airtime demo selected.')),
          ActionTile(icon: Icons.wifi_rounded, label: 'Data', onTap: () => notice(context, 'Data demo selected.')),
          ActionTile(icon: Icons.lightbulb_outline_rounded, label: 'Electricity', onTap: () => notice(context, 'Electricity demo selected.')),
          ActionTile(icon: Icons.live_tv_rounded, label: 'TV', onTap: () => notice(context, 'TV subscription demo selected.')),
          ActionTile(icon: Icons.account_balance_rounded, label: 'Bank', onTap: () => notice(context, 'Bank services are not connected.')),
          ActionTile(icon: Icons.qr_code_rounded, label: 'QR pay', onTap: () => notice(context, 'QR payments are disabled.')),
          ActionTile(icon: Icons.savings_outlined, label: 'Savings', onTap: () => notice(context, 'Savings is a future feature.')),
          ActionTile(icon: Icons.more_horiz_rounded, label: 'More', onTap: () => notice(context, 'More services coming soon.')),
        ],
      ),
      const SizedBox(height: 24),
      Row(children: [const SectionTitle('Recent activity'), const Spacer(), TextButton(onPressed: () => notice(context, 'Open Activity tab to view all sample records.'), child: const Text('See all'))]),
      const TransactionRow(icon: Icons.phone_android, title: 'Airtime purchase', subtitle: 'Sample • Today, 10:42 AM', amount: '- ₦2,000', color: Color(0xFF315EF5)),
      const TransactionRow(icon: Icons.account_balance_wallet_outlined, title: 'Wallet funding', subtitle: 'Sample • Yesterday', amount: '+ ₦20,000', color: Color(0xFF159A68), positive: true),
      const TransactionRow(icon: Icons.lightbulb_outline, title: 'Electricity bill', subtitle: 'Sample • 04 Nov', amount: '- ₦5,000', color: Color(0xFFE59A27)),
    ],
  );
}

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});
  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(20), children: [
    const PageHeading(title: 'Payments', subtitle: 'Explore payment services in demo mode.'),
    const SizedBox(height: 20),
    ServiceCard(icon: Icons.phone_android, title: 'Airtime', detail: 'Mobile top-ups', onTap: () => notice(context, 'Airtime is not connected to a provider.')),
    ServiceCard(icon: Icons.wifi, title: 'Mobile data', detail: 'Data bundles for supported networks', onTap: () => notice(context, 'Data purchases are disabled.')),
    ServiceCard(icon: Icons.bolt, title: 'Electricity', detail: 'Utility bill payment interface', onTap: () => notice(context, 'Electricity payments are disabled.')),
    ServiceCard(icon: Icons.live_tv, title: 'Cable TV', detail: 'TV subscription interface', onTap: () => notice(context, 'TV payments are disabled.')),
    ServiceCard(icon: Icons.swap_horiz, title: 'Bank transfer', detail: 'Transfer interface preview', onTap: () => notice(context, 'Real transfers are not enabled.')),
    ServiceCard(icon: Icons.account_balance_wallet, title: 'Add money', detail: 'Wallet funding interface preview', onTap: () => notice(context, 'Real wallet funding is not enabled.')),
  ]);
}

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});
  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(20), children: const [
    PageHeading(title: 'Activity', subtitle: 'Example transactions for preview only.'),
    SizedBox(height: 18),
    TransactionRow(icon: Icons.phone_android, title: 'Airtime purchase', subtitle: 'Demo • 06 Nov 2026', amount: '- ₦2,000', color: blue),
    TransactionRow(icon: Icons.account_balance_wallet, title: 'Wallet funding', subtitle: 'Demo • 05 Nov 2026', amount: '+ ₦20,000', color: Color(0xFF159A68), positive: true),
    TransactionRow(icon: Icons.lightbulb_outline, title: 'Electricity bill', subtitle: 'Demo • 04 Nov 2026', amount: '- ₦5,000', color: Color(0xFFE59A27)),
    TransactionRow(icon: Icons.wifi, title: 'Data bundle', subtitle: 'Demo • 02 Nov 2026', amount: '- ₦1,500', color: Color(0xFF8B5CF6)),
  ]);
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(20), children: [
    const PageHeading(title: 'Profile', subtitle: 'Manage your demo account.'),
    const SizedBox(height: 24),
    Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)), child: const Row(children: [
      CircleAvatar(radius: 28, backgroundColor: Color(0xFFE8EDFF), child: Icon(Icons.person, color: blue, size: 30)),
      SizedBox(width: 14),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('JustPay User', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), Text('Demo account', style: TextStyle(color: Colors.black54, fontSize: 12))]),
    ])),
    const SizedBox(height: 18),
    ServiceCard(icon: Icons.verified_user_outlined, title: 'Account verification', detail: 'Verification is not available in demo mode', onTap: () => notice(context, 'No identity documents are collected by this demo.')),
    ServiceCard(icon: Icons.lock_outline, title: 'Security', detail: 'Security settings preview', onTap: () => notice(context, 'Security controls will be added before any real integration.')),
    ServiceCard(icon: Icons.help_outline, title: 'Help and support', detail: 'Help centre preview', onTap: () => notice(context, 'Support centre coming soon.')),
    ServiceCard(icon: Icons.info_outline, title: 'About JustPay', detail: 'Educational fintech prototype', onTap: () => notice(context, 'JustPay is a demo, not a bank or payment service.')),
  ]);
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: navy));
}
class PageHeading extends StatelessWidget {
  final String title, subtitle;
  const PageHeading({required this.title, required this.subtitle, super.key});
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const SizedBox(height: 12), Text(title, style: const TextStyle(fontSize: 27, fontWeight: FontWeight.w900, color: navy)),
    const SizedBox(height: 5), Text(subtitle, style: const TextStyle(color: Colors.black54)),
  ]);
}
class ActionTile extends StatelessWidget {
  final IconData icon; final String label; final VoidCallback onTap;
  const ActionTile({required this.icon, required this.label, required this.onTap, super.key});
  @override
  Widget build(BuildContext context) => InkWell(onTap: onTap, borderRadius: BorderRadius.circular(16), child: Column(children: [
    Container(width: 56, height: 56, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)), child: Icon(icon, color: blue, size: 25)),
    const SizedBox(height: 8), Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: navy)),
  ]));
}
class ServiceCard extends StatelessWidget {
  final IconData icon; final String title, detail; final VoidCallback onTap;
  const ServiceCard({required this.icon, required this.title, required this.detail, required this.onTap, super.key});
  @override
  Widget build(BuildContext context) => Card(color: Colors.white, elevation: 0, margin: const EdgeInsets.only(bottom: 10), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)), child: ListTile(
    onTap: onTap, contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
    leading: Container(width: 44, height: 44, decoration: BoxDecoration(color: const Color(0xFFEFF2FF), borderRadius: BorderRadius.circular(14)), child: Icon(icon, color: blue)),
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700, color: navy)),
    subtitle: Text(detail, style: const TextStyle(fontSize: 12)),
    trailing: const Icon(Icons.chevron_right, color: Colors.black38),
  ));
}
class TransactionRow extends StatelessWidget {
  final IconData icon; final String title, subtitle, amount; final Color color; final bool positive;
  const TransactionRow({required this.icon, required this.title, required this.subtitle, required this.amount, required this.color, this.positive = false, super.key});
  @override
  Widget build(BuildContext context) => Container(margin: const EdgeInsets.only(top: 9), padding: const EdgeInsets.all(13), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: Row(children: [
    CircleAvatar(backgroundColor: color.withOpacity(.10), child: Icon(icon, color: color, size: 20)),
    const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: const TextStyle(fontWeight: FontWeight.w700, color: navy)),
      const SizedBox(height: 3), Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.black54)),
    ])),
    Text(amount, style: TextStyle(fontWeight: FontWeight.w800, color: positive ? const Color(0xFF159A68) : navy, fontSize: 13)),
  ]));
}
void notice(BuildContext context, String message) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), behavior: SnackBarBehavior.floating));
