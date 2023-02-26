import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';
import 'package:supercharged/supercharged.dart';
import 'package:themed/themed.dart';

export 'package:collection/collection.dart';
export 'package:recase/recase.dart';
export 'package:supercharged/supercharged.dart';
export 'package:themed/themed.dart';
export 'package:client/router/routes.dart';

part '_props.dart';

part 'extension/_date.dart';
part 'extension/_double.dart';
part 'extension/_int.dart';
part 'extension/_num.dart';
part 'extension/_space.dart';
part 'extension/_string.dart';
part 'extension/_typography.dart';

part 'space/_data.dart';
part 'space/_model_edge_insets.dart';
part 'space/_model_widget.dart';
part 'space/_space.dart';
part 'space/_tokens.dart';

part 'theme/_colors.dart';
part 'theme/_typography.dart';

part 'ui/_breakpoints.dart';
part 'ui/_media.dart';
part 'ui/_screen.dart';
part 'ui/_unit.dart';

class App {
  static void init(BuildContext context, [VoidCallback? callback]) {
    AppMedia.init(context);
    AppScreen.init();
    AppUnit.init();
    Space.init();
    AppText.init();

    if (callback != null) {
      callback();
    }
  }
}
