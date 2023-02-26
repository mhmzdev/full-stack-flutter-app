---
to: lib/ui/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart
---
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:client/responsive/responsive.dart';
<% if (formData) { %>
import 'package:flutter/foundation.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
<% } %>

import 'package:client/configs/configs.dart';

import 'package:client/ui/widgets/core/screen/screen.dart';

<% if (formData) { %>part 'static/_form_data.dart';<% } %>
<% if (formData) { %>part 'static/_form_keys.dart';<% } %>

part 'views/_desktop.dart';
part 'views/_tablet.dart';
part 'views/_mobile.dart';
<% if (widgets.length) { widgets.forEach(function(key){ %>part 'widgets/_<%=h.changeCase.snake(key)%>.dart';<% }); } %>

part 'widgets/_header.dart';

part '_state.dart';

class <%=h.changeCase.pascal(name)%>Screen extends StatelessWidget {
  const <%=h.changeCase.pascal(name)%>Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const Responsive(
        mobile: _Mobile(),
        tablet: _Tablet(),
        desktop: _Desktop(),
      ),
    );
  }
}
