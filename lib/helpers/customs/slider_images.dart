import 'package:flutter/material.dart';
import 'package:task_inovola/helpers/styles/sizes.dart';

class SliderImages extends StatefulWidget {
  final List<String> slider;

  const SliderImages({Key? key, required this.slider}) : super(key: key);

  @override
  _SliderImagesState createState() => _SliderImagesState();
}

class _SliderImagesState extends State<SliderImages> {
  PageController controller = PageController();
  int _currentIndex = 0;


  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) * 0.3,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: widget.slider.length,
            scrollDirection: Axis.horizontal,
            physics: const ScrollPhysics(),
            // scrolling behaviour
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return NetWorckImageWidgetIcon(
                image: widget.slider[index],
              );
            },
          ),
          Positioned(
            top: height(context)*0.25,
            left: width(context)*0.1,
            child: SizedBox(
              height: height(context) * 0.025,
              child: ListView.builder(
                itemCount: widget.slider.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    margin: const EdgeInsets.all(2),
                    child: CircleAvatar(
                        radius: width(context) * 0.018,
                        backgroundColor: _currentIndex == index
                            ? Colors.white
                            : Colors.green),
                  );
                },
              ),
            ),
          ) // end indicator
        ],
      ),
    );
  }
}

class NetWorckImageWidgetIcon extends StatelessWidget {
  final String image;

  const NetWorckImageWidgetIcon({Key ?key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: BoxFit.fill,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.image_not_supported_sharp);
      },
    );
  }
}

