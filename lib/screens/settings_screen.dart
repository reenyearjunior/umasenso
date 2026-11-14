import 'package:flutter/material.dart';
import '../app_shared.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Notification Toggles State
  bool pushNotifications = true;
  bool smsNotifications = true;
  bool emailNotifications = true;
  bool priceAlerts = true;
  bool orderUpdates = true;

  // Data Toggles State
  bool offlineMode = false;
  bool autoSync = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8F5),
      appBar: AppBar(
        backgroundColor: forest,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==================== ACCOUNT ====================
            _buildSectionHeader('Account'),
            _buildCardWrapper([
              _buildNavigationTile(Icons.person_outline, 'Edit Profile'),
              _buildNavigationTile(Icons.lock_outline, 'Change Password'),
              _buildNavigationTile(Icons.link_outlined, 'Linked Accounts', isLast: true),
            ]),

            // ==================== NOTIFICATIONS ====================
            _buildSectionHeader('Notifications'),
            _buildCardWrapper([
              _buildSwitchTile(
                Icons.notifications_none_outlined,
                'Push Notifications',
                pushNotifications,
                (val) => setState(() => pushNotifications = val),
              ),
              _buildSwitchTile(
                Icons.sms_outlined,
                'SMS Notifications',
                smsNotifications,
                (val) => setState(() => smsNotifications = val),
              ),
              _buildSwitchTile(
                Icons.email_outlined,
                'Email Notifications',
                emailNotifications,
                (val) => setState(() => emailNotifications = val),
              ),
              _buildSwitchTile(
                Icons.add_alert_outlined,
                'Price Alerts',
                priceAlerts,
                (val) => setState(() => priceAlerts = val),
              ),
              _buildSwitchTile(
                Icons.attach_money_outlined,
                'Order Updates',
                orderUpdates,
                (val) => setState(() => orderUpdates = val),
                isLast: true,
              ),
            ]),

            // ==================== DISPLAY ====================
            _buildSectionHeader('Display'),
            _buildCardWrapper([
              _buildNavigationTile(Icons.language_outlined, 'Language', trailingText: 'Filipino'),
              _buildNavigationTile(Icons.palette_outlined, 'Theme', trailingText: 'Light'),
              _buildNavigationTile(Icons.text_fields_outlined, 'Font Size', trailingText: 'Medium', isLast: true),
            ]),

            // ==================== DATA ====================
            _buildSectionHeader('Data'),
            _buildCardWrapper([
              _buildSwitchTile(
                Icons.cloud_off_outlined,
                'Offline Mode',
                offlineMode,
                (val) => setState(() => offlineMode = val),
              ),
              _buildSwitchTile(
                Icons.sync_outlined,
                'Auto-Sync',
                autoSync,
                (val) => setState(() => autoSync = val),
              ),
              _buildNavigationTile(Icons.delete_outline, 'Clear Cache', trailingText: '32 MB'),
              _buildNavigationTile(Icons.download_outlined, 'Download Data', isLast: true),
            ]),

            // ==================== ABOUT ====================
            _buildSectionHeader('About'),
            _buildCardWrapper([
              _buildNavigationTile(Icons.build_outlined, 'App Version', trailingText: 'v1.0.0', showChevron: false),
              _buildNavigationTile(Icons.article_outlined, 'Terms of Service'),
              _buildNavigationTile(Icons.privacy_tip_outlined, 'Privacy Policy'),
              _buildNavigationTile(Icons.code_outlined, 'Open Source Licenses', isLast: true),
            ]),

            // ==================== DANGER ZONE ====================
            _buildSectionHeader('Danger Zone', isDanger: true),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFF5F5),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Column(
                children: [
                  _buildDangerTile(Icons.shield_outlined, 'Deactivate Account'),
                  const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFFFCDD2)),
                  _buildDangerTile(Icons.delete_forever_outlined, 'Delete Account', isLast: true),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Section Header Text
  Widget _buildSectionHeader(String title, {bool isDanger = false}) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, top: 14, bottom: 6),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: isDanger ? Colors.redAccent : ink,
        ),
      ),
    );
  }

  // Card Container for Grouped Items
  Widget _buildCardWrapper(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(children: children),
    );
  }

  // Tile with Chevron or Trailing Text
  Widget _buildNavigationTile(
    IconData icon,
    String title, {
    String? trailingText,
    bool showChevron = true,
    bool isLast = false,
  }) {
    return Column(
      children: [
        ListTile(
          dense: true,
          leading: Icon(icon, color: forest, size: 20),
          title: Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: ink)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (trailingText != null)
                Text(trailingText, style: const TextStyle(color: Colors.black45, fontSize: 12)),
              if (trailingText != null && showChevron) const SizedBox(width: 4),
              if (showChevron) const Icon(Icons.chevron_right, size: 18, color: Colors.black38),
            ],
          ),
          onTap: () {},
        ),
        if (!isLast) const Divider(height: 1, indent: 16, endIndent: 16),
      ],
    );
  }

  // Switch Toggle Tile
  Widget _buildSwitchTile(
    IconData icon,
    String title,
    bool value,
    ValueChanged<bool> onChanged, {
    bool isLast = false,
  }) {
    return Column(
      children: [
        ListTile(
          dense: true,
          leading: Icon(icon, color: forest, size: 20),
          title: Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: ink)),
          trailing: Switch(
            value: value,
            activeColor: forest,
            onChanged: onChanged,
          ),
        ),
        if (!isLast) const Divider(height: 1, indent: 16, endIndent: 16),
      ],
    );
  }

  // Red Danger Zone Tile
  Widget _buildDangerTile(IconData icon, String title, {bool isLast = false}) {
    return ListTile(
      dense: true,
      leading: Icon(icon, color: Colors.redAccent, size: 20),
      title: Text(
        title,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.redAccent),
      ),
      trailing: const Icon(Icons.chevron_right, size: 18, color: Colors.redAccent),
      onTap: () {},
    );
  }
}