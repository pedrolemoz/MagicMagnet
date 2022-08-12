import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class SearchBox extends StatefulWidget {
  final Function(String) onSubmitted;

  const SearchBox({required this.onSubmitted});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  late final TextEditingController controller;
  bool enableCursor = false;

  @override
  void initState() {
    controller = TextEditingController()
      ..addListener(
        () => setState(() => enableCursor = controller.text.isNotEmpty),
      );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: controller,
              textAlign: TextAlign.center,
              textInputAction: TextInputAction.search,
              textCapitalization: TextCapitalization.sentences,
              enableSuggestions: true,
              showCursor: enableCursor,
              enableInteractiveSelection: true,
              maxLines: 1,
              onSubmitted: widget.onSubmitted,
              style: Theme.of(context).textTheme.subtitle1,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Search something here',
                hintStyle: Theme.of(context).textTheme.subtitle1,
                contentPadding: const EdgeInsets.all(16),
                fillColor: Theme.of(context).colorScheme.surface,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(16),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => widget.onSubmitted(controller.text),
            borderRadius:
                const BorderRadius.horizontal(right: Radius.circular(16)),
            child: Ink(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(16),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                height: double.infinity,
                child: Icon(
                  UniconsLine.search,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
