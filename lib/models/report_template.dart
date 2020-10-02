import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ReportTemplate {
	final List<Map<String, String>> paragraphs;
	final String name;
	
	ReportTemplate({
						this.paragraphs,
						thits.name,
						});
						
	@override 
	bool operator == (Object o) {
		if (identical(this, o)) return true;
		return o is ReportTemplate &&
						o.paragraphs == paragraphs &&
						o.name == name;
					}
}