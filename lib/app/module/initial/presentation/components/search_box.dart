import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class SearchBox extends StatefulWidget {
  final Function(String) onSubmitted;
  final TextEditingController controller;
  final EdgeInsets? padding;

  const SearchBox({
    required this.onSubmitted,
    required this.controller,
    this.padding,
  });

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  bool enableCursor = false;

  @override
  void initState() {
    widget.controller.addListener(
      () => setState(() => enableCursor = widget.controller.text.isNotEmpty),
    );
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: widget.controller,
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              splashFactory: InkSparkle.splashFactory,
            ),
            child: const Text('Sparkle!'),
            onPressed: () {},
          ),
          // InkWell(
          //   onTap: () => widget.onSubmitted(widget.controller.text),
          //   borderRadius: const BorderRadius.horizontal(
          //     right: Radius.circular(16),
          //   ),
          //   child: Ink(
          //     decoration: BoxDecoration(
          //       color: Theme.of(context).colorScheme.primary,
          //       borderRadius: const BorderRadius.horizontal(
          //         right: Radius.circular(16),
          //       ),
          //     ),
          //     child: Container(
          //       padding: const EdgeInsets.symmetric(horizontal: 24),
          //       height: double.infinity,
          //       child: Icon(
          //         UniconsLine.search,
          //         color: Theme.of(context).colorScheme.onPrimary,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
