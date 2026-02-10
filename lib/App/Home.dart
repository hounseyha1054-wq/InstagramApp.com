import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, String>> stories = [
    {'username': 'Yaya', 'profile_url': 'https://i.pravatar.cc/150?u=11'},
    {'username': 'Malika', 'profile_url': 'https://i.pravatar.cc/150?u=12'},
    {'username': 'Sokha', 'profile_url': 'https://i.pravatar.cc/150?u=13'},
    {'username': 'Vanna', 'profile_url': 'https://i.pravatar.cc/150?u=14'},
    {'username': 'Rithy', 'profile_url': 'https://i.pravatar.cc/150?u=15'},
  ];

  final List<Map<String, String>> posts = [
    {
      'username': 'kimalong',
      'userImage': 'https://i.pravatar.cc/150?u=50',
      'postImage': 'https://picsum.photos/id/20/500/500',
      'likes': '1,240 likes',
      'caption': 'Coding the night away with Flutter! 💻✨ #developer #flutter',
    },
    {
      'username': 'travel_with_me',
      'userImage': 'https://i.pravatar.cc/150?u=51',
      'postImage': 'https://picsum.photos/id/10/500/500',
      'likes': '850 likes',
      'caption': 'Missing these mountain views today. 🏔️✈️ #travelgram',
    },
    {
      "username": "chef_mario",
      "userImage": "https://i.pravatar.cc/150?u=52",
      "postImage": "https://picsum.photos/id/42/500/500",
      "likes": "3,120 likes",
      "caption": "Homemade sourdough is finally perfect! 🥖🔥 #baking #foodie",
    },
    {
      "username": "fit_life_jen",
      "userImage": "https://i.pravatar.cc/150?u=53",
      "postImage": "https://picsum.photos/id/22/500/500",
      "likes": "1,050 likes",
      "caption":
          "Early morning miles. The city is so quiet at 5 AM. 🏃‍♀️🌇 #runner",
    },
    {
      "username": "urban_arch",
      "userImage": "https://i.pravatar.cc/150?u=54",
      "postImage": "https://picsum.photos/id/30/500/500",
      "likes": "945 likes",
      "caption": "Geometry in the wild. 🏢📐 #architecture #minimalism",
    },
    {
      "username": "coffee_and_kindle",
      "userImage": "https://i.pravatar.cc/150?u=55",
      "postImage": "https://picsum.photos/id/1060/500/500",
      "likes": "420 likes",
      "caption": "Rainy Sundays were made for this. ☕📖 #bookstagram",
    },
    {
      "username": "pixel_art_daily",
      "userImage": "https://i.pravatar.cc/150?u=56",
      "postImage": "https://picsum.photos/id/60/500/500",
      "likes": "2,890 likes",
      "caption":
          "Desktop setup for the week. Clean and green. 🌿🖥️ #workspace",
    },
    {
      "username": "adventure_seeker",
      "userImage": "https://i.pravatar.cc/150?u=57",
      "postImage": "https://picsum.photos/id/28/500/500",
      "likes": "5,600 likes",
      "caption": "Life begins at the end of your comfort zone. 🌊🛶 #adventure",
    },
    {
      "username": "nature_lens",
      "userImage": "https://i.pravatar.cc/150?u=58",
      "postImage": "https://picsum.photos/id/15/500/500",
      "likes": "1,115 likes",
      "caption":
          "Found this hidden waterfall today. Nature is healing. 🌿💦 #naturephotography",
    },
    {
      "username": "tech_trends",
      "userImage": "https://i.pravatar.cc/150?u=59",
      "postImage": "https://picsum.photos/id/1/500/500",
      "likes": "730 likes",
      "caption":
          "Reviewing the latest hardware. This build is a beast! 💻⚡ #tech",
    },
    {
      "username": "pet_palace",
      "userImage": "https://i.pravatar.cc/150?u=60",
      "postImage": "https://picsum.photos/id/237/500/500",
      "likes": "12,400 likes",
      "caption":
          "The goodest boy you'll see on your feed today. 🐶🎾 #dogsofinstagram",
    },
    {
      "username": "vibe_check",
      "userImage": "https://i.pravatar.cc/150?u=61",
      "postImage": "https://picsum.photos/id/39/500/500",
      "likes": "2,100 likes",
      "caption": "Golden hour hits different in the desert. 🌵✨ #sunset",
    },
    // ... add more posts here if you like
  ];
  final List<Map<String, dynamic>> chatData = [
    {
      "username": "suzy.ha",
      "userImage": "https://i.pravatar.cc/150?u=a1",
      "lastMessage": "Sent a photo",
      "time": "2w",
    },
    {
      "username": "renda_01",
      "userImage": "https://i.pravatar.cc/150?u=a2",
      "lastMessage": "Hi bro",
      "time": "42w",
    },
    {
      "username": "_pagnatepy_",
      "userImage": "https://i.pravatar.cc/150?u=a3",
      "lastMessage": "Seen",
      "time": "1h",
    },
    {
      "username": "asemdreams",
      "userImage": "https://i.pravatar.cc/150?u=a4",
      "lastMessage": "Sent",
      "time": "3d",
    },
    {
      "username": "vo_tey_kh",
      "userImage": "https://i.pravatar.cc/150?u=a5",
      "lastMessage": "Sent a photo",
      "time": "221w",
    },
  ];

  void _ShowSendOption(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: const BoxDecoration(
            color: Colors.black, // Instagram dark mode background
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              _buildHandle(),
              _buildHeader(),

              _buildSearchBar(),

              Expanded(
                child: ListView(
                  children: [
                    _buildSectionTitle("Messages"),
                    _buildMessageList(chatData),
                    _buildSectionTitle("Suggestions"),
                    // _buildMessageList(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHandle() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: 4,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "suzey.ha",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(Icons.edit_note, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildMessageList(List<Map<String, dynamic>> items) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final user = items[index];

        return ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(user['userImage']),
          ),
          title: Text(
            user['username'],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            "${user['lastMessage']} • ${user['time']}",
            style: const TextStyle(color: Colors.grey),
          ),
          trailing: const Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
            size: 20,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: false,
        title: const Text(
          'Instagram',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          Icon(Icons.favorite_border, color: Colors.black),
          SizedBox(width: 16),
          IconButton(
            onPressed: () => _ShowSendOption(context),
            icon: const Icon(Icons.send_outlined, color: Colors.black),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: ListView.builder(
        itemCount: posts.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildStorySection();
          }
          final postData = posts[index - 1];
          return PostWidget(postData: postData);
        },
      ),
    );
  }

  Widget _buildStorySection() {
    return Column(
      children: [
        SizedBox(
          height: 115,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stories.length + 1,
            itemBuilder: (context, sIndex) {
              if (sIndex == 0) {
                return _storyItem(
                  image:
                      'https://scontent.fpnh8-1.fna.fbcdn.net/v/t39.30808-6/481267582_1169811428149026_6125290746168601830_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeHR7fjJcpKetEdwHhHNYoxmA4VtK5YuRyYDhW0rli5HJho3qAwxIoCZxob9_yudegZ-msPfcFV0GdZ4ZzW2wX4W&_nc_ohc=t7cc7y4XqGIQ7kNvwHmLzdv&_nc_oc=AdnaRmlMJw__g9GpAMBji1zznsTNnibG9OsHTXy9myL9tfZq8J_aoeLnDa1exF5KLRM&_nc_zt=23&_nc_ht=scontent.fpnh8-1.fna&_nc_gid=Xg-r_1uKYH-hhnlxzgXfdg&oh=00_AfsKvtbk_hKY1Puo4wRvZE4L47d_SL4YVu4BqF-eBFa2NQ&oe=6990CBC8',
                  name: 'Your story',
                  isYourStory: true,
                );
              }
              final story = stories[sIndex - 1];
              return _storyItem(
                image: story['profile_url']!,
                name: story['username']!,
              );
            },
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }

  Widget _storyItem({
    required String image,
    required String name,
    bool isYourStory = false,
    bool hasUpdate = true, // Added to control the border
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(3), // Space for the border
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: hasUpdate && !isYourStory
                      ? const LinearGradient(
                          colors: [
                            Color(0xFF833AB4),
                            Color(0xFFFD1D1D),
                            Color(0xFFFCAF45),
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        )
                      : null,
                  border: !hasUpdate && !isYourStory
                      ? Border.all(color: Colors.grey.shade300, width: 1)
                      : null,
                ),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(image),
                  ),
                ),
              ),

              if (isYourStory)
                Positioned(
                  bottom: 2,
                  right: 2,
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 14),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class PostWidget extends StatefulWidget {
  final Map<String, String> postData;
  const PostWidget({super.key, required this.postData});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isLiked = false;
  bool Issave = false;

  final List<Map<String, String>> commentData = [
    {
      'username': 'sok.dev',
      'userImage': 'https://i.pravatar.cc/150?u=1',
      'comment': 'Flutter is getting better and better! 🔥',
      'time': '2h',
    },
    {
      'username': 'dara_travels',
      'userImage': 'https://i.pravatar.cc/150?u=2',
      'comment': 'Where was this photo taken? So beautiful!',
      'time': '5h',
    },
    {
      'username': 'rathana_ui',
      'userImage': 'https://i.pravatar.cc/150?u=3',
      'comment': 'Love the color palette in this shot. 🎨',
      'time': '1d',
    },
    {
      'username': 'vireak_tech',
      'userImage': 'https://i.pravatar.cc/150?u=4',
      'comment': 'Check your DMs, I have a question about the code.',
      'time': '2d',
    },
    {
      'username': 'sophia.kh',
      'userImage': 'https://i.pravatar.cc/150?u=5',
      'comment': 'Great job! Keep it up. 🚀',
      'time': '3d',
    },
  ];
  final List<Map<String, String>> friends = [
    {'name': 'Yaya', 'image': 'https://i.pravatar.cc/150?u=11'},
    {'name': 'Malika', 'image': 'https://i.pravatar.cc/150?u=12'},
    {'name': 'Sokha', 'image': 'https://i.pravatar.cc/150?u=13'},
    {'name': 'Vanna', 'image': 'https://i.pravatar.cc/150?u=14'},
    {'name': 'Rithy', 'image': 'https://i.pravatar.cc/150?u=15'},
  ];

  void _showCommentSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.95,
          builder: (_, controller) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 4,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const Text(
                    "Comments",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const Divider(),

                  Expanded(
                    child: ListView.builder(
                      controller: controller,
                      itemCount: commentData.length,
                      itemBuilder: (context, index) {
                        final item = commentData[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundImage: NetworkImage(
                                  item['userImage']!,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '${item['username']} ',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(text: item['comment']),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item['time']!,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.favorite_border,
                                size: 14,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                      left: 10,
                      right: 10,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://scontent.fpnh1-1.fna.fbcdn.net/v/t39.30808-6/612410000_1417538746709625_3910764155792402143_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeFUVpl1IOa_aXR8id2sezR7qvUAur8fjdGq9QC6vx-N0W-ZXsG8AQYKAaS0HKzIaZ6jhJ3yiPQtU6poQCDCe3zF&_nc_ohc=gPN06_eCQ9IQ7kNvwG7XDkI&_nc_oc=Adm46BXl3K1i0T1Snw_IRPz898yOuPm9k2ibV8CG8sWtQkA2xUr8yK9W_7NAkxk9vUo&_nc_zt=23&_nc_ht=scontent.fpnh1-1.fna&_nc_gid=Sj2HzMGQqWRJoEiOf187-g&oh=00_AfujQAmE42WhUUw7J5I7ag2BzvOEfZz8Y0mFqr-UEka0eg&oe=698B6CF8",
                          ),
                        ),

                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Add a comment...",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey[500]),
                            ),
                          ),
                        ),
                        TextButton(onPressed: () {}, child: const Text("Post")),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showShareSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 350,
          child: Column(
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Horizontal Friends List
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: friends.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              friends[index]['image']!,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            friends[index]['name']!,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text("Share to external apps..."),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _igItem(IconData icon, String title, {bool isDanger = false}) {
    return ListTile(
      leading: Icon(icon, color: isDanger ? Colors.red : Colors.black),
      title: Text(
        title,
        style: TextStyle(
          color: isDanger ? Colors.red : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {},
    );
  }

  void _ShowMoreHoriz(BuildContext context) {
    showModalBottomSheet(
      context: context,

      builder: (context) {
        return Container(
          color: Colors.transparent,
          height: 400,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              _igItem(Icons.bookmark_border, "Save"),
              _igItem(Icons.qr_code, "QR code"),
              _igItem(Icons.link, "Copy link"),
              _igItem(Icons.share, "Share"),
              _igItem(Icons.report, "Report", isDanger: true),

              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(widget.postData['userImage']!),
              ),
              const SizedBox(width: 10),
              Text(
                widget.postData['username']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => _ShowMoreHoriz(context),
                icon: Icon(Icons.more_horiz),
              ),
            ],
          ),
        ),
        Image.network(
          widget.postData['postImage']!,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () => _showCommentSheet(context),
              icon: const Icon(Icons.chat_bubble_outline),
            ),
            IconButton(
              onPressed: () => _showShareSheet(context),
              icon: const Icon(Icons.send_outlined),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                setState(() {
                  Issave = !Issave;
                });
                if (Issave) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Save Your Collections!"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              icon: Icon(
                Issave ? Icons.bookmark : Icons.bookmark_border,
                color: Issave ? Colors.black : Colors.black,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.postData['likes']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(
                      text: "${widget.postData['username']!} ",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: widget.postData['caption']!),
                  ],
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ],
    );
  }
}
