import 'package:flutter/material.dart';

class WeatherSearchField extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const WeatherSearchField({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  State<WeatherSearchField> createState() => _WeatherSearchFieldState();
}

class _WeatherSearchFieldState extends State<WeatherSearchField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final hasText = widget.controller.text.isNotEmpty;

    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: widget.controller,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Enter the city name',
                suffixIcon: hasText
                    ? IconButton(
                        icon: const Icon(Icons.close, size: 20),
                        onPressed: () {
                          widget.controller.clear();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              ),
              onSubmitted: (_) => widget.onSearch(),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Material(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(14),
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: widget.onSearch,
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Icon(Icons.search, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}