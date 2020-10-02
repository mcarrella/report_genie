import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:report_genie/report/report.dart';

void main() => runApp(App());

class App extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: BlocProvider(
										create: (_) => ReportCubit(),
										child: ReportPage(),
									),
								
								);
						}
}