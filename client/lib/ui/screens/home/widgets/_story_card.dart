part of '../home.dart';

class _StoryCard extends StatelessWidget {
  final User user;
  const _StoryCard({
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final image = posts.firstWhere((p) => p.id == user.id);

    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () {},
      child: Container(
        margin: Space.r.t25,
        width: 50.un(),
        height: 65.un(),
        decoration: BoxDecoration(
          borderRadius: 12.radius(),
          image: DecorationImage(
            image: AssetImage(
              image.imageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: 12.radius(),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  height: 25.un(),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.backgroundLight.withOpacity(0.8),
                    border: Border.all(
                      color: AppTheme.grey,
                    ),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(1.un()),
                      bottom: Radius.circular(5.un()),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 10.un(),
                  backgroundImage: AssetImage(
                    user.imageURL,
                  ),
                ),
                Space.y.t10,
                Text(
                  '${user.firstName} ${user.lastName.substring(0, 1)}.',
                ),
                Space.y.t30,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
