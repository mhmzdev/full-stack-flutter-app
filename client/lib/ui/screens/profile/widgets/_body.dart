part of '../profile.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Screen(
      keyboardHandler: true,
      bottomBar: true,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: Space.a.t25,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppIconButton(
                    icon: CustomPaint(
                      painter: const PersonEditIconPainter(),
                      size: PersonEditIconPainter.s(10.un()),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              Space.y.t100,
              Avatar(
                user: profiles.first,
              ),
              Space.y.t25,
              Text(
                '${profiles.first.firstName} ${profiles.first.lastName}',
                style: AppText.h3,
              ),
              Space.y.t10,
              Text(
                "\"${profiles.first.bio}\"",
                style: AppText.s1 + AppTheme.grey,
                textAlign: TextAlign.center,
              ),
              Space.y.t30,
              Container(
                padding: Space.a.t20,
                decoration: BoxDecoration(
                  color: AppTheme.backgroundLight,
                  borderRadius: 12.radius(),
                  border: Border.all(
                    color: AppTheme.grey,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 0; i < 3; i++)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '120',
                            style: AppText.b1,
                          ),
                          Text(
                            'Posts',
                            style: AppText.b3 + AppTheme.grey,
                          )
                        ],
                      )
                  ],
                ),
              ),
              Space.y.t30,
              const _ContentCapsule(),
              Space.y.t25,
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.85,
                ),
                itemCount: profiles.first.posts.length,
                itemBuilder: (context, index) {
                  final id = profiles.first.posts[index];
                  final post = posts.firstWhere((element) => element.id == id);

                  return Container(
                    margin: Space.a.t10,
                    decoration: BoxDecoration(
                      borderRadius: 12.radius(),
                      image: DecorationImage(
                        image: AssetImage(
                          post.imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              Space.y.t100,
              Space.y.t100,
              Space.bottom,
            ],
          ),
        ),
      ),
    );
  }
}
