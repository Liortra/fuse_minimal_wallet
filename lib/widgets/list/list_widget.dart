import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuse_minimal_wallet/widgets/widgets.dart';

class ListViewWidget extends StatefulWidget {
  final List<dynamic> listView;

  const ListViewWidget({Key? key, required this.listView}) : super(key: key);

  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  void initState() {
    super.initState();

    try {
      if(widget.listView.isNotEmpty) widget.listView.first.label;
    } on NoSuchMethodError catch (e) {
      throw ArgumentError("MUST ADD LABEL PROPERTY");
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        itemCount: widget.listView.length,
        itemBuilder: (context, index) {
          final item = widget.listView[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                vertical: SizeConfig.spacing_small_vertical,
                horizontal: SizeConfig.spacing_medium_horizontal,),
              title: Text(item.label),
              // title: getLabel(item.label),
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/icon.png"),
              ),
            ),
          );
        });
  }
  
  Widget getLabel(label){
    return FutureBuilder<String>(
        future: label,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done)
            return snapshot.hasData ? Text("${snapshot.data!}") : Text("Empty");
          else
            return Container();
        });
  }
}
