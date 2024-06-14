import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:worldcup/constant/app_assets.dart';
import 'package:worldcup/constant/font_style.dart';

class CommentsWidget extends StatefulWidget {
  const CommentsWidget({super.key});

  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget>
    with SingleTickerProviderStateMixin {
  final TextEditingController controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;
  late Animation<double> _animation;
  OverlayEntry? _overlayEntry;

  List<String> comments = [
    "The bowler runs in and delivers a full toss, beautifully driven through the covers for four!",
    "What a spectacular catch at the boundary! That's a game-changer!",
    "The batsman pulls it hard, but there's a fielder in the deep – just a single.",
    "It's a perfectly timed shot, racing towards the boundary, and it's four runs!",
    "An excellent yorker, the batsman just manages to dig it out.",
    "That's a massive six! The ball lands in the stands, what a hit!",
    "A quick single taken, great running between the wickets.",
    "The ball edges past the slip cordon and races away to the boundary."
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _scrollToBottom();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    _overlayEntry!.remove();
    _animationController.reset();
    _overlayEntry = null;
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _startAnimation(GlobalKey iconKey, String image) {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _animationController.reset();
      _overlayEntry = null;
    }

    RenderBox renderBox =
        iconKey.currentContext!.findRenderObject() as RenderBox;
    Offset position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Positioned(
              left: position.dx,
              top: position.dy - (_animation.value * 300),
              child: Transform.rotate(
                angle: _animation.value * 2 * 3.14,
                child: child,
              ),
            );
          },
          child: Image.asset(
            image,
            width: 30,
            height: 30,
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);

    _animationController.forward().then((_) {
      _overlayEntry!.remove();
      _overlayEntry = null;
      _animationController.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFB8E8BD).withOpacity(0.18),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Comments",
                style:
                    AppFontStyle.interRegular18.copyWith(color: Colors.white),
              ),
            ],
          ),
          const Divider(),
          Container(
            constraints: const BoxConstraints(
              maxHeight: 500,
            ),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: comments.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    comments[index],
                    style: AppFontStyle.interRegular14.copyWith(
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              _iconImage(image: AssetImages.ic4),
              _iconImage(image: AssetImages.ic6),
              _iconImage(image: AssetImages.icWicket),
              _iconImage(image: AssetImages.icThrow),
              kIsWeb
                  ? inputMessageRow()
                  : const SizedBox.shrink(),
            ],
          ),
          !kIsWeb ?
          inputMessageRow(): const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _iconImage({
    required String image,
  }) {
    final GlobalKey widgetKey = GlobalKey();
    Container mandatoryContainer = Container(
      key: widgetKey,
      width: 30,
      height: 30,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Image.asset(
          image,
        ),
      ),
    );

    return InkWell(
      onTap: () {
        _startAnimation(widgetKey, image);
      },
      child: mandatoryContainer,
    );
  }


  Widget inputMessageRow() {
    return Row(
      children: [
        kIsWeb ?
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 20,
          width: 2,
          color: Colors.black,
        ):const SizedBox.shrink(),
        Expanded(
          child: TextField(
            cursorColor: Colors.white,
            style: AppFontStyle.interRegular14
                .copyWith(color: Colors.white, fontSize: 14),
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
              filled: true,
              hintStyle: AppFontStyle.interRegular14.copyWith(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 14),
              hintText: "Write here",
              fillColor:
              const Color(0xFF262F27).withOpacity(0.33),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 20),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.black26,
            shape: BoxShape.circle,
          ),
          child: InkWell(
            onTap: () {
              if (controller.text.isNotEmpty) {
                setState(() {
                  comments.add(controller.text);
                  controller.clear();
                });
                _scrollToBottom(); // Scroll to bottom after adding a new comment
              }
            },
            child: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
