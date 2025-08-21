import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_assessment_task/utils/app_colors.dart';

class WhatsAppTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;

  const WhatsAppTabBar({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      color: isDarkMode 
          ? const Color(0xFF2A3942)  // WhatsApp dark header exact color
          : const Color(0xFF00A884), // WhatsApp green exact color
      child: Row(
        children: [
          // Community icon (left side)
        
          // Tab bar (right side)
          Expanded(
            child: TabBar(
              controller: tabController,
              indicatorColor: AppColors.appBarLight,
              indicatorWeight: 3.0,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: !isDarkMode ? Colors.white : Colors.grey,
              unselectedLabelColor: Colors.white.withOpacity(0.7),
              labelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.25,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.25,
              ),
              tabs: [
                _ChatTabWithBadge(),
                _SimpleTab(text: 'Status'),
                _SimpleTab(text: 'Calls'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ChatTabWithBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Chats',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.25,
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: isDarkMode ? AppColors.appBarLight: const Color(0xFF25D366), // WhatsApp green badge
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Text(
              '1',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SimpleTab extends StatelessWidget {
  final String text;

  const _SimpleTab({required this.text});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.25,
        ),
      ),
    );
  }
}
