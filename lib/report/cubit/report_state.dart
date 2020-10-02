part of 'report_cubit.dart';


abstract class ReportState {
	const ReportState();
}

class ReportInitial extends ReportState {
	final List<Map<String, String>> paragraphs = const [{'prompt': 'highlights/summary', 'text': ''}, 
														{'prompt': 'difficulties/challenges', 'text': ''},
														{'prompt': 'ideas about future improvement', 'text': ''}];
	const ReportInitial();
	@override
	bool operator == (Object o) {
		if (identical(this, o)) return true;
		return o is ReportInitial && o.paragraphs == paragraphs;
		}
}

class ReportLoaded extends ReportState {
	final List<Map<String, String>> paragraphs = const [{'a': 'x', 'b': 'y'}, {'a': 'v', 'b': 'i'}];
	const ReportLoaded();
	
	@override
	bool operator == (Object o) {
		if (identical(this, o)) return true;
		return o is ReportLoaded && o.paragraphs == paragraphs;
		}
}
