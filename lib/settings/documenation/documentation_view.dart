import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class DocumentationView extends StatefulWidget {
  final String currentPage;
  const DocumentationView({super.key, this.currentPage = "/"});

  @override
  State<DocumentationView> createState() => _DocumentationViewState();
}

class _DocumentationViewState extends State<DocumentationView> {
  String selectedLanguage = "de";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Documentation ${widget.currentPage}"),
          actions: [
            SizedBox(
              height: 100,
              width: 170,
              child: DropdownButtonFormField<String>(
                value: selectedLanguage,
                items: const [
                  DropdownMenuItem(
                    value: "de",
                    child: Text("Deutsch 🇩🇪"),
                  ),
                  DropdownMenuItem(
                    value: "en",
                    child: Text("English 🇬🇧"),
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value ?? "en";
                  });
                },
              ),
            )
          ],
        ),
        body: _DocBody(
            language: selectedLanguage, currentPage: widget.currentPage));
  }
}

class _DocBody extends StatelessWidget {
  final String language;
  final String currentPage;
  const _DocBody({required this.language, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getData(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Markdown(
            data: snapshot.data!,
            imageDirectory: "assets/documenation/docs/$language/",
            onTapLink: (text, href, title) {
              if (href != null) {
                _click(context, href);
              }
            },
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Future<String> _getData(BuildContext context) {
    return DefaultAssetBundle.of(context)
        .loadString('assets/documenation/docs/$language/$currentPage');
  }

  void _click(BuildContext context, String href) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DocumentationView(
            currentPage: href,
          ),
        ));
  }
}
