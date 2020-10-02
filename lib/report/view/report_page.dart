import 'package:report_genie/report/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'report_pdf.dart';

class Destination {
	const Destination(this.title, this.icon, this.color, this.idx);
	final String title;
	final IconData icon;
	final MaterialColor color;
	final int idx;
	}


class ReportPage extends StatelessWidget {
	List<String> _dropdownValues = ['load template', 'save template', 'more options'];
	static const List<Destination> allDestinations = <Destination>[
																	Destination('PDF', Icons.business, Colors.teal, 4),
																	Destination('Edit Template', Icons.school, Colors.orange, 5),
																	];
	static const List<Destination> menuOptions = const <Destination>[
																	Destination('Load Template', Icons.flight, Colors.red, 0),
																	Destination('Save Template', Icons.book, Colors.blue, 1),
																	Destination('New Template', Icons.school, Colors.yellow, 2),
																	];
																	
	
	onNavTapped(BuildContext context, int index, String lineA, String lineB) {
		print(index);
		
		if (index==0) {
			reportView(context, lineA, lineB);
			}
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
									title: Row(
													children: <Widget>[
																			
									
																			PopupMenuButton<Destination>(
																				
																				
																				itemBuilder: (BuildContext context) {
																					return menuOptions.map((Destination destination) {
																											return PopupMenuItem<Destination>(
																														value: destination,
																														
																														child: Text(destination.title)
																														);
																												}).toList();
																										}),
																						Text('                                    report genie'),
																							],
																					),
																									
								
																					
									),
			body:
								BlocBuilder<ReportCubit, ReportState>(
							builder: (context, state) {
										if (state is ReportInitial) {
											
											return ListView.builder(
														itemCount: state.paragraphs.length,
														itemBuilder: (context, index) {
															return
																	Container(
																		height: 215,
																		child: GestureDetector(
																						child: new Card(child: Text(state.paragraphs[index]['prompt'], style: TextStyle(
																																							fontFamily: 'Varela',
																																							
																																							fontSize: 20.0))),
																						onTap: () { showModalBottomSheet<void>(
																											context: context,
																											isScrollControlled: true,
																											builder: (BuildContext context) {
																													return Padding(
																														padding: MediaQuery.of(context).viewInsets,
																														child: Wrap(
																															children: <Widget>[
																																	Container(
																																		height: 300.0,
																																		child: Text(state.paragraphs[index]['prompt']),
																																		),
																																	TextField(
																																			decoration: InputDecoration(
																																				border: InputBorder.none,
																																				hintText: 'please type here'),
																																				),
																																		],
																																	),
																																);
																														},
																														).whenComplete(() {
																																print('EXITING BOTTOM MODAL');
																															});
																												}
																													
																												,
																						),
																		);
																		});
											
														}
										 else {
											return Center(child: Text('SOMETHING ELSE'));
											}
										
											
									}),
									
		bottomNavigationBar: BlocBuilder<ReportCubit, ReportState>(
							builder: (context, state) {
										if (state is ReportInitial) {
											return BottomNavigationBar(		
														onTap: (int index) {
															print('TAP TAP TAP');
															String lineA = state.paragraphs[0]['prompt'];
															print(lineA);
															String lineB = state.paragraphs[1]['prompt'];
															onNavTapped(context, index, lineA, lineB);
															},
														items: allDestinations.map((Destination destination) {
														
															return BottomNavigationBarItem(
																										icon: Icon(destination.icon),
																										backgroundColor: destination.color,
																										title: Text(destination.title)
																										);
																								}).toList(),
																						);
																				} else { return Text('lalala'); }
																			}),
								
							
							
							);
					}
}
																
																
														
														
