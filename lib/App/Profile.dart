import 'package:flutter/material.dart';
import 'AuthScreen.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  void _showAddOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Create",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const Divider(),
                _bottomSheetTile(Icons.grid_on, "Post"),
                _bottomSheetTile(Icons.video_library_outlined, "Reel"),
                _bottomSheetTile(Icons.add_circle_outline, "Story"),
                _bottomSheetTile(
                  Icons.auto_awesome_outlined,
                  "Story Highlight",
                ),
                _bottomSheetTile(Icons.live_tv, "Live"),
                // const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _bottomSheetTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        endDrawer: _buildDrawer(context),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "suzey.ha",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => _showAddOptions(context),
              icon: const Icon(Icons.add_box_outlined, color: Colors.black),
            ),
            Builder(
              builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: const Icon(Icons.menu, color: Colors.black),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            _buildProfileHeader(),
            const TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(icon: Icon(Icons.grid_on)),
                Tab(icon: Icon(Icons.video_library_outlined)),
                Tab(icon: Icon(Icons.person_pin_outlined)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildPostGrid(),
                  const Center(child: Text("Reels Page")),
                  const Center(child: Text("Tagged Page")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 50),
          _drawerTile(Icons.settings, "Settings and privacy"),
          _drawerTile(Icons.history, "Your activity"),
          _drawerTile(Icons.archive_outlined, "Archive"),
          const Spacer(),
          const Divider(),
          _drawerTile(
            Icons.logout,
            "Log out",
            color: Colors.red,
            onTap: () => _showLogoutDialog(context),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Log out?"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AuthScreen()),
              );
            },
            child: const Text("Log out", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Widget _drawerTile(
    IconData icon,
    String title, {
    Color color = Colors.black,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: TextStyle(color: color, fontWeight: FontWeight.w500),
      ),
      onTap: onTap ?? () {},
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  'https://scontent.fpnh8-1.fna.fbcdn.net/v/t39.30808-6/481267582_1169811428149026_6125290746168601830_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeHR7fjJcpKetEdwHhHNYoxmA4VtK5YuRyYDhW0rli5HJho3qAwxIoCZxob9_yudegZ-msPfcFV0GdZ4ZzW2wX4W&_nc_ohc=t7cc7y4XqGIQ7kNvwHmLzdv&_nc_oc=AdnaRmlMJw__g9GpAMBji1zznsTNnibG9OsHTXy9myL9tfZq8J_aoeLnDa1exF5KLRM&_nc_zt=23&_nc_ht=scontent.fpnh8-1.fna&_nc_gid=Xg-r_1uKYH-hhnlxzgXfdg&oh=00_AfsKvtbk_hKY1Puo4wRvZE4L47d_SL4YVu4BqF-eBFa2NQ&oe=6990CBC8',
                ),
              ),
              _buildStatColumn("120", "Posts"),
              _buildStatColumn("1.2k", "Followers"),
              _buildStatColumn("350", "Following"),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "Houn Seyha",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text("I'm Smos sne in the world 🚀"),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildPostGrid() {
    return GridView.builder(
      itemCount: 20,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) => Image.network(
        'https://picsum.photos/id/${index + 10}/200/200',
        fit: BoxFit.cover,
      ),
    );
  }
}
