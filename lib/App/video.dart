import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoState();
}

class _VideoState extends State<VideoPage> {
  final List<Map<String, dynamic>> reelsData = [
    {
      'username': 'malita_official',
      'profile': 'https://i.pravatar.cc/150?u=90',
      'video_placeholder': 'https://picsum.photos/id/101/600/1000',
      'caption': 'Nature is calling 🌿✨ #hiking #vibes',
      'likes': '1.2M',
      'comments': '12k',
      'isLiked': false,
      'isFollowed': false,
    },
    {
      'username': 'chef_santi',
      'profile': 'https://i.pravatar.cc/150?u=91',
      'video_placeholder': 'https://picsum.photos/id/102/600/1000',
      'caption': 'Best street food in Phnom Penh! 🍜🔥 #foodie',
      'likes': '450k',
      'comments': '5k',
      'isLiked': false,
      'isFollowed': false,
    },
    {
      'username': 'travel_vanna',
      'profile': 'https://i.pravatar.cc/150?u=92',
      'video_placeholder': 'https://picsum.photos/id/103/600/1000',
      'caption': 'Missing this beach sunset 🌅 #beachlife',
      'likes': '890k',
      'comments': '22k',
      'isLiked': false,
      'isFollowed': false,
    },
    {
      'username': 'fitness_rithy',
      'profile': 'https://i.pravatar.cc/150?u=93',
      'video_placeholder': 'https://picsum.photos/id/104/600/1000',
      'caption': 'No pain, no gain. Morning workout! 💪⚡ #gym',
      'likes': '15k',
      'comments': '200',
      'isLiked': false,
      'isFollowed': false,
    },
    {
      'username': 'flutter_cambodia',
      'profile': 'https://i.pravatar.cc/150?u=94',
      'video_placeholder': 'https://picsum.photos/id/106/600/1000',
      'caption': 'Building amazing apps with Dart 🚀 #flutterdev',
      'likes': '2.5M',
      'comments': '45k',
      'isLiked': false,
      'isFollowed': false,
    },
    {
      'username': 'photography_dara',
      'profile': 'https://i.pravatar.cc/150?u=95',
      'video_placeholder': 'https://picsum.photos/id/107/600/1000',
      'caption': 'Captured the soul of the city tonight 🌃📸',
      'likes': '32k',
      'comments': '890',
      'isLiked': false,
      'isFollowed': false,
    },
    {
      'username': 'gaming_nary',
      'profile': 'https://i.pravatar.cc/150?u=96',
      'video_placeholder': 'https://picsum.photos/id/108/600/1000',
      'caption': 'Finally hit Diamond rank! Let\'s go! 🎮🔥',
      'likes': '105k',
      'comments': '3.1k',
      'isLiked': false,
      'isFollowed': false,
    },
    {
      'username': 'coffee_lover_pp',
      'profile': 'https://i.pravatar.cc/150?u=97',
      'video_placeholder': 'https://picsum.photos/id/109/600/1000',
      'caption': 'Monday morning latte art ☕️🤍 #cafe',
      'likes': '8k',
      'comments': '150',
      'isLiked': false,
      'isFollowed': false,
    },
    {
      'username': 'fashion_sophia',
      'profile': 'https://i.pravatar.cc/150?u=98',
      'video_placeholder': 'https://picsum.photos/id/110/600/1000',
      'caption': 'OOTD: Street style edition 👗✨ #fashion',
      'likes': '200k',
      'comments': '1.8k',
      'isLiked': false,
      'isFollowed': false,
    },
    {
      'username': 'coding_with_vibol',
      'profile': 'https://i.pravatar.cc/150?u=99',
      'video_placeholder': 'https://picsum.photos/id/111/600/1000',
      'caption': 'Clean code is a love letter to the next dev 💻❤️',
      'likes': '55k',
      'comments': '1.2k',
      'isLiked': false,
      'isFollowed': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: reelsData.length,
        itemBuilder: (context, index) {
          final reel = reelsData[index];

          return Stack(
            fit: StackFit.expand,
            children: [
              Image.network(reel['video_placeholder'], fit: BoxFit.cover),

              Positioned(
                bottom: 20,
                left: 15,
                right: 70,
                child: _buildBottomInfo(reel),
              ),
              Positioned(
                bottom: 80,
                right: 15,
                child: Column(
                  children: [
                    _reelAction(
                      reel['isLiked'] ? Icons.favorite : Icons.favorite_border,
                      reel['likes'],
                      color: reel['isLiked'] ? Colors.red : Colors.white,
                      onTap: () {
                        setState(() {
                          reel['isLiked'] = !reel['isLiked'];
                        });
                      },
                    ),
                    _reelAction(Icons.chat_bubble_outline, reel['comments']),
                    _reelAction(Icons.send_outlined, ""),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Helper for Bottom Text & Follow
  Widget _buildBottomInfo(Map<String, dynamic> reel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(reel['profile'])),
            const SizedBox(width: 10),
            Text(
              reel['username'],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () =>
                  setState(() => reel['isFollowed'] = !reel['isFollowed']),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: reel['isFollowed'] ? Colors.transparent : Colors.blue,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  reel['isFollowed'] ? "Following" : "Follow",
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(reel['caption'], style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  // Helper for Sidebar Icons
  Widget _reelAction(
    IconData icon,
    String label, {
    Color color = Colors.white,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Icon(icon, color: color, size: 35),
            if (label.isNotEmpty)
              Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
          ],
        ),
      ),
    );
  }
}
