part of 'bottom_bar.dart';

List<_ItemModel> get _items => [
      _ItemModel(
        active: CustomPaint(
          painter: const HomeFilledIconPainter(color: AppTheme.primary),
          size: HomeFilledIconPainter.s(10.un()),
        ),
        inActive: CustomPaint(
          painter: const HomeOutlineIconPainter(),
          size: HomeFilledIconPainter.s(10.un()),
        ),
        label: 'Home',
        path: '',
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
          painter: const PersonFilledIconPainter(),
          size: PersonFilledIconPainter.s(10.un()),
        ),
        inActive: CustomPaint(
          painter: const PersonOutlineIconPainter(),
          size: PersonOutlineIconPainter.s(10.un()),
        ),
        label: 'Profile',
        path: '',
      ),
    ];
