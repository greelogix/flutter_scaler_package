import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaler/flutter_adaptive_scaler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterScaler(
      builder: (context, child) => MaterialApp(
        title: 'Flutter Scaler Pro',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF6366F1),
            primary: const Color(0xFF6366F1),
            secondary: const Color(0xFFEC4899),
          ),
          fontFamily: 'Google Sans',
          useMaterial3: true,
        ),
        home: const DashboardScreen(),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220.h,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/banner.png',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.7),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20.h,
                    left: 20.w,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 35.r,
                          backgroundImage: const AssetImage('assets/images/profile.png'),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(width: 15.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome back, Alex!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Product Designer',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(20.p),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  'Quick Statistics',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                SizedBox(height: 15.h),
                SizedBox(
                  height: 120.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildStatCard(
                        context,
                        'Revenue',
                        '\$12,450',
                        Icons.payments_outlined,
                        const Color(0xFF6366F1),
                      ),
                      _buildStatCard(
                        context,
                        'New Project',
                        '86',
                        Icons.rocket_launch_outlined,
                        const Color(0xFFEC4899),
                      ),
                      _buildStatCard(
                        context,
                        'Team Growth',
                        '+12%',
                        Icons.trending_up_outlined,
                        const Color(0xFF10B981),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.h),
                Text(
                  'Recent Activity',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                SizedBox(height: 15.h),
                ...List.generate(5, (index) => _buildActivityTile(index)),
                SizedBox(height: 20.h),
                _buildSystemStatus(),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon, Color color) {
    return Container(
      width: 150.w,
      margin: EdgeInsets.only(right: 15.w),
      padding: EdgeInsets.all(15.p),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.1),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: color, size: 28.i),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF64748B),
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E293B),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivityTile(int index) {
    final titles = ['UI Design Update', 'Marketing Meeting', 'Client Review', 'Bug Squash', 'Feature Launch'];
    final subtitles = ['2 hours ago', '4 hours ago', 'Yesterday', '2 days ago', 'Last week'];
    final colors = [Colors.blue, Colors.orange, Colors.purple, Colors.red, Colors.green];

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.p),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              color: colors[index % colors.length].withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_none_outlined,
              color: colors[index % colors.length],
              size: 20.i,
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titles[index % titles.length],
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitles[index % subtitles.length],
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: const Color(0xFFCBD5E1), size: 20.i),
        ],
      ),
    );
  }

  Widget _buildSystemStatus() {
    return Container(
      padding: EdgeInsets.all(15.p),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Responsive Engine Active',
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
              ),
              Icon(Icons.check_circle, color: const Color(0xFF10B981), size: 18.i),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _statusIndicator('iOS', true),
              _statusIndicator('Android', true),
              _statusIndicator('Web', true),
              _statusIndicator('Desktop', true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statusIndicator(String label, bool active) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: Colors.white60, fontSize: 10.sp)),
        SizedBox(height: 4.h),
        Container(width: 8.w, height: 8.h, decoration: const BoxDecoration(color: Color(0xFF10B981), shape: BoxShape.circle)),
      ],
    );
  }
}
