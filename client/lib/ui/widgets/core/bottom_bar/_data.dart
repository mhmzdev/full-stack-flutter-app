part of 'bottom_bar.dart';

List<_ItemModel> get _items => [
      _ItemModel(
        active: CustomPaint(
          painter: const HomeFilledIconPainter(color: AppTheme.primary),
          size: HomeFilledIconPainter.s(11.un()),
        ),
        inActive: CustomPaint(
          painter: const HomeOutlineIconPainter(),
          size: HomeFilledIconPainter.s(11.un()),
        ),
        label: 'Home',
        path: AppRoutes.home,
      ),
      _ItemModel(
        active: CustomPaint(
          painter: const AddIconPainter(),
          size: AddIconPainter.s(15.un()),
        ),
        inActive: CustomPaint(
          painter: const AddIconPainter(),
          size: AddIconPainter.s(15.un()),
        ),
        label: 'Post',
        path: '',
      ),
      _ItemModel(
        active: CustomPaint(
          painter: const PersonFilledIconPainter(
            color: AppTheme.primary,
          ),
          size: PersonFilledIconPainter.s(11.un()),
        ),
        inActive: CustomPaint(
          painter: const PersonOutlineIconPainter(),
          size: PersonOutlineIconPainter.s(11.un()),
        ),
        label: 'Profile',
        path: AppRoutes.profile,
      ),
    ];
